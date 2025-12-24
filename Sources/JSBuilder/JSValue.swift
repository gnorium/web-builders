#if !os(WASI)


/// Protocol for anything that can be a JS value
public protocol JSValue: Sendable {
    var expression: JSExpression { get }
}

/// JSIdentifier reference (bare names like `memory`, `elem`)
@dynamicMemberLookup
@dynamicCallable
public struct JSIdentifier: JSValue, JS {
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
    public func dynamicallyCall(withArguments args: [any JSValue]) -> JSExpression {
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
    public func callAsFunction(_ args: any JSValue...) -> JSExpression {
        return dynamicallyCall(withArguments: args)
    }

    /// Method call: obj.method("name", args...) - DEPRECATED: Use obj.methodName(args...) instead
    public func method(_ name: String, _ args: any JSValue...) -> JSIdentifier {
        JSIdentifier(expression: .methodCall(expr, name, args.map(\.expression)))
    }

    /// Array access: obj[index]
    public subscript(index: any JSValue) -> JSIdentifier {
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

extension Int: JSValue {
    public var expression: JSExpression { .number(Double(self)) }
}

extension Double: JSValue {
    public var expression: JSExpression { .number(self) }
}

extension String: JSValue {
    public var expression: JSExpression { .string(self) }
}

extension Bool: JSValue {
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
public func += (lhs: JSIdentifier, rhs: JSValue) -> JSStatement {
	.expression(.compoundAssign("+", lhs.expression, rhs.expression))
}

/// Binary operations
public func + (lhs: any JSValue, rhs: any JSValue) -> JSBinaryOp {
    JSBinaryOp(.binary("+", lhs.expression, rhs.expression))
}

public func - (lhs: any JSValue, rhs: any JSValue) -> JSBinaryOp {
    JSBinaryOp(.binary("-", lhs.expression, rhs.expression))
}

public func * (lhs: any JSValue, rhs: any JSValue) -> JSBinaryOp {
    JSBinaryOp(.binary("*", lhs.expression, rhs.expression))
}

public func / (lhs: any JSValue, rhs: any JSValue) -> JSBinaryOp {
    JSBinaryOp(.binary("/", lhs.expression, rhs.expression))
}

/// Comparison operations
public func > (lhs: JSValue, rhs: JSValue) -> JSBinaryOp {
    JSBinaryOp(.binary(">", lhs.expression, rhs.expression))
}

public func < (lhs: JSValue, rhs: JSValue) -> JSBinaryOp {
    JSBinaryOp(.binary("<", lhs.expression, rhs.expression))
}

public func >= (lhs: JSValue, rhs: JSValue) -> JSBinaryOp {
    JSBinaryOp(.binary(">=", lhs.expression, rhs.expression))
}

public func <= (lhs: JSValue, rhs: JSValue) -> JSBinaryOp {
    JSBinaryOp(.binary("<=", lhs.expression, rhs.expression))
}

public func == (lhs: JSValue, rhs: JSValue) -> JSBinaryOp {
    JSBinaryOp(.binary("===", lhs.expression, rhs.expression))
}

public func != (lhs: JSValue, rhs: JSValue) -> JSBinaryOp {
    JSBinaryOp(.binary("!==", lhs.expression, rhs.expression))
}

/// Logical operations
public func && (lhs: JSValue, rhs: JSValue) -> JSBinaryOp {
    JSBinaryOp(.binary("&&", lhs.expression, rhs.expression))
}

public func || (lhs: JSValue, rhs: JSValue) -> JSBinaryOp {
    JSBinaryOp(.binary("||", lhs.expression, rhs.expression))
}

/// In operator for JS: "property" <| object
infix operator <|: ComparisonPrecedence
public func <| (_ lhs: any JSValue, _ rhs: any JSValue) -> JSBinaryOp {
    JSBinaryOp(.binary("in", lhs.expression, rhs.expression))
}

/// Wrapper for binary operations
public struct JSBinaryOp: JSValue {
    public let expression: JSExpression
    init(_ expr: JSExpression) { self.expression = expr }
}

/// Unary not: !expr
public prefix func ! (value: JSValue) -> JSUnaryOp {
    JSUnaryOp(.unary("!", value.expression))
}

public struct JSUnaryOp: JSValue {
    public let expression: JSExpression
    init(_ expr: JSExpression) { self.expression = expr }
}

/// Ternary operator: condition ?> trueValue |> falseValue
/// Using double arrow ?> and vertical bar |>
public struct JSTernaryIntermediate: JSValue {
    let condition: JSExpression
    let trueExpr: JSExpression

    public var expression: JSExpression {
        .ternary(condition, trueExpr, .bool(false))
    }

    public static func |> (lhs: JSTernaryIntermediate, rhs: any JSValue) -> JSExpression {
        .ternary(lhs.condition, lhs.trueExpr, rhs.expression)
    }
}

infix operator ?>: ConditionalPrecedence
infix operator |>: ConditionalPrecedence
precedencegroup ConditionalPrecedence {
    associativity: right
    lowerThan: LogicalConjunctionPrecedence
}

public func ?> (condition: any JSValue, trueValue: any JSValue) -> JSTernaryIntermediate {
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
public func ?? (lhs: any JSValue, rhs: any JSValue) -> JSExpression {
    .nullishCoalesce(lhs.expression, rhs.expression)
}

/// Arrow function operator: [params] => body
infix operator =>: FunctionArrowPrecedence

public func => (lhs: [JSIdentifier], @JSBuilder rhs: @escaping () -> [JS]) -> JSExpression {
    let jsItems = rhs()
    let statements: [JSStatement] = jsItems.compactMap { item in
        if let stmt = item as? JSStatement {
            return stmt
        } else if let expr = item as? JSExpression {
            return .expression(expr)
        } else if let value = item as? (any JSValue) {
            return .expression(value.expression)
        }
        return nil
    }
    return .arrowFunction(lhs, statements)
}


#endif
