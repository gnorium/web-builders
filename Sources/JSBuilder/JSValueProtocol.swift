#if !os(WASI)


/// Protocol for anything that can be a JSProtocol value
public protocol JSValueProtocol: Sendable {
    var expression: JSExpression { get }
}

/// JSIdentifier reference (bare names like `memory`, `elem`)
@dynamicMemberLookup
@dynamicCallable
public struct JSIdentifier: JSValueProtocol, JSProtocol {
    let expr: JSExpression

    public init(_ name: String) {
        self.expr = .identifier(name)
    }

    init(expression: JSExpression) {
        self.expr = expression
    }

    public var expression: JSExpression { expr }

    public func render(indent: Int = 0) -> String {
        JSStatement.expression(expr).render(indent: indent)
    }

    /// Member access: obj.property
    public subscript(dynamicMember prop: String) -> JSIdentifier {
        JSIdentifier(expression: .member(expr, prop))
    }

    /// Method call via dynamic member: obj.methodName(args...)
    public func dynamicallyCall(withArguments args: [any JSValueProtocol]) -> JSExpression {
        // When called as a method on a member access, use the member as method name
        if case .member(let obj, let methodName) = expr {
            return .methodCall(obj, methodName, args.map(\.expression))
        }
        // Otherwise treat as function call
        if case .identifier(let name) = expr {
            return .call(name, args.map(\.expression))
        }
        return .call(expr.render(), args.map(\.expression))
    }

    /// Variadic call helper for cleaner syntax
    public func callAsFunction(_ args: any JSValueProtocol...) -> JSExpression {
        return dynamicallyCall(withArguments: args)
    }

    /// Method call: obj.method("name", args...) - DEPRECATED: Use obj.methodName(args...) instead
    public func method(_ name: String, _ args: any JSValueProtocol...) -> JSIdentifier {
        JSIdentifier(expression: .methodCall(expr, name, args.map(\.expression)))
    }

    /// Array access: obj[index]
    public subscript(index: any JSValueProtocol) -> JSIdentifier {
        JSIdentifier(expression: .arrayAccess(expr, index.expression))
    }
}

/// Optional chaining for JSIdentifier: parent ?| contains
public func ?| (lhs: JSIdentifier, rhs: JSIdentifier) -> JSOptionalChainMethod {
    // rhs should be just a method name identifier
    if case .identifier(let methodName) = rhs.expr {
        return JSOptionalChainMethod(object: lhs.expr, method: methodName)
    }
    fatalError("Right side of ?| must be a simple identifier (method name)")
}

/// Create identifier from string
public func identifier(_ name: String) -> JSIdentifier {
    JSIdentifier(name)
}

/// Short helper to create identifiers
public func id(_ name: String) -> JSIdentifier {
    JSIdentifier(name)
}

// MARK: - Literal Conformances

extension Int: JSValueProtocol {
    public var expression: JSExpression { .number(Double(self)) }
}

extension Double: JSValueProtocol {
    public var expression: JSExpression { .number(self) }
}

extension String: JSValueProtocol {
    public var expression: JSExpression { .string(self) }
}

extension Bool: JSValueProtocol {
    public var expression: JSExpression { .bool(self) }
}

// MARK: - Operators

/// Postfix increment: varName++
postfix operator ++

public postfix func ++ (name: String) -> JSExpression {
	.postIncrement(name)
}

/// Optional chaining operator: obj ?| method
/// Usage: parent ?| contains(child) generates parent?.contains(child)
infix operator ?|: OptionalChainingPrecedence
precedencegroup OptionalChainingPrecedence {
    associativity: left
    higherThan: NilCoalescingPrecedence
}

/// Assignment with +=
public func += (lhs: JSIdentifier, rhs: any JSValueProtocol) -> JSStatement {
	.expression(.compoundAssign("+", lhs.expression, rhs.expression))
}

/// Binary operations
public func + (lhs: any JSValueProtocol, rhs: any JSValueProtocol) -> JSBinaryOp {
    JSBinaryOp(.binary("+", lhs.expression, rhs.expression))
}

public func - (lhs: any JSValueProtocol, rhs: any JSValueProtocol) -> JSBinaryOp {
    JSBinaryOp(.binary("-", lhs.expression, rhs.expression))
}

public func * (lhs: any JSValueProtocol, rhs: any JSValueProtocol) -> JSBinaryOp {
    JSBinaryOp(.binary("*", lhs.expression, rhs.expression))
}

public func / (lhs: any JSValueProtocol, rhs: any JSValueProtocol) -> JSBinaryOp {
    JSBinaryOp(.binary("/", lhs.expression, rhs.expression))
}

/// Comparison operations
public func > (lhs: any JSValueProtocol, rhs: any JSValueProtocol) -> JSBinaryOp {
    JSBinaryOp(.binary(">", lhs.expression, rhs.expression))
}

public func < (lhs: any JSValueProtocol, rhs: any JSValueProtocol) -> JSBinaryOp {
    JSBinaryOp(.binary("<", lhs.expression, rhs.expression))
}

public func >= (lhs: any JSValueProtocol, rhs: any JSValueProtocol) -> JSBinaryOp {
    JSBinaryOp(.binary(">=", lhs.expression, rhs.expression))
}

public func <= (lhs: any JSValueProtocol, rhs: any JSValueProtocol) -> JSBinaryOp {
    JSBinaryOp(.binary("<=", lhs.expression, rhs.expression))
}

public func == (lhs: any JSValueProtocol, rhs: any JSValueProtocol) -> JSBinaryOp {
    JSBinaryOp(.binary("===", lhs.expression, rhs.expression))
}

public func != (lhs: any JSValueProtocol, rhs: any JSValueProtocol) -> JSBinaryOp {
    JSBinaryOp(.binary("!==", lhs.expression, rhs.expression))
}

/// Logical operations
public func && (lhs: any JSValueProtocol, rhs: any JSValueProtocol) -> JSBinaryOp {
    JSBinaryOp(.binary("&&", lhs.expression, rhs.expression))
}

public func || (lhs: any JSValueProtocol, rhs: any JSValueProtocol) -> JSBinaryOp {
    JSBinaryOp(.binary("||", lhs.expression, rhs.expression))
}

/// In operator for JSProtocol: "property" <| object
infix operator <|: ComparisonPrecedence
public func <| (_ lhs: any JSValueProtocol, _ rhs: any JSValueProtocol) -> JSBinaryOp {
    JSBinaryOp(.binary("in", lhs.expression, rhs.expression))
}

/// Wrapper for binary operations
public struct JSBinaryOp: JSValueProtocol {
    public let expression: JSExpression
    init(_ expr: JSExpression) { self.expression = expr }
}

/// Unary not: !expr
public prefix func ! (value: any JSValueProtocol) -> JSUnaryOp {
    JSUnaryOp(.unary("!", value.expression))
}

public struct JSUnaryOp: JSValueProtocol {
    public let expression: JSExpression
    init(_ expr: JSExpression) { self.expression = expr }
}

/// Ternary operator: condition ?> trueValue |> falseValue
/// Using double arrow ?> and vertical bar |>
public struct JSTernaryIntermediate: JSValueProtocol {
    let condition: JSExpression
    let trueExpr: JSExpression

    public var expression: JSExpression {
        .ternary(condition, trueExpr, .bool(false))
    }

    public static func |> (lhs: JSTernaryIntermediate, rhs: any JSValueProtocol) -> JSExpression {
        .ternary(lhs.condition, lhs.trueExpr, rhs.expression)
    }
}

infix operator ?>: ConditionalPrecedence
infix operator |>: ConditionalPrecedence
precedencegroup ConditionalPrecedence {
    associativity: right
    lowerThan: LogicalConjunctionPrecedence
}

public func ?> (condition: any JSValueProtocol, trueValue: any JSValueProtocol) -> JSTernaryIntermediate {
    JSTernaryIntermediate(condition: condition.expression, trueExpr: trueValue.expression)
}

/// Post-increment operator: i++
public postfix func ++ (operand: JSIdentifier) -> JSExpression {
    if case .identifier(let name) = operand.expression {
        return .postIncrement(name)
    }
    return .postIncrement(operand.expression.render())
}

/// Nullish coalescing operator: a ?? b
infix operator ??: NilCoalescingPrecedence
public func ?? (lhs: any JSValueProtocol, rhs: any JSValueProtocol) -> JSExpression {
    .nullishCoalesce(lhs.expression, rhs.expression)
}

/// Arrow function operator: [params] => body
infix operator =>: FunctionArrowPrecedence

public func => (lhs: [JSIdentifier], @JSBuilder rhs: () -> [any JSProtocol]) -> JSExpression {
    let jsItems = rhs()
    let statements: [JSStatement] = jsItems.compactMap { item in
        if let stmt = item as? JSStatement {
            return stmt
        } else if let expr = item as? JSExpression {
            return .expression(expr)
        } else if let value = item as? (any JSValueProtocol) {
            return .expression(value.expression)
        }
        return nil
    }
    return .arrowFunction(lhs, statements)
}


#endif
