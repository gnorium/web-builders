import EmbeddedSwiftUtilities

@dynamicMemberLookup
public indirect enum JSExpression: Sendable, JSValue, JSContent {
    case identifier(String)
    case number(Double)
    case string(String)
    case templateLiteral(String, [(String, JSExpression)])  // Template literal with interpolations
    case bool(Bool)
    case null
    case undefined
    case array([JSExpression])
    case object([(String, JSExpression)])
    case objectMultiline([(String, JSExpression)])  // Object with newlines and indentation
    case new(String, [JSExpression])  // new ClassName(args)
    case call(String, [JSExpression])  // functionName(args)
    case member(JSExpression, String)  // obj.property
    case methodCall(JSExpression, String, [JSExpression])  // obj.method(args)
    case methodCallMultiline(JSExpression, [(String, [JSExpression])])  // obj\n.method1()\n.method2()
    case ternary(JSExpression, JSExpression, JSExpression)  // condition ? true : false
    case binary(String, JSExpression, JSExpression)  // a + b, a && b, etc
    case unary(String, JSExpression)  // !a, -a, etc
    case arrowFunction([JSIdentifier], [AnyJSContent])  // (params) => { body }
    case anonymousFunction([JSIdentifier], [AnyJSContent])  // function(params) { body }
    case methodShorthand([JSIdentifier], [AnyJSContent])  // ES6 method shorthand: method(params) { body }
    case arrayAccess(JSExpression, JSExpression)  // arr[index]
    case postIncrement(String)  // counter++
    case postDecrement(String)  // counter--
    case optionalChain(JSExpression, String, [JSExpression])  // obj?.method(args)
    case nullishCoalesce(JSExpression, JSExpression)  // a ?? b
    case assign(JSExpression, JSExpression)  // a = b
    case compoundAssign(String, JSExpression, JSExpression)  // a += b, a -= b, etc
    case throwExpression(JSExpression)  // throw new Error()
    case awaitExpression(JSExpression)  // await expr

    public func render(indent: Int = 0) -> String {
        let ind = String(repeating: "  ", count: indent)
        switch self {
        case .identifier(let name):
            return name
        case .number(let n):
            // Remove .0 suffix for whole numbers
            if n.truncatingRemainder(dividingBy: 1) == 0 {
                return intToString(Int(n))
            }
            return doubleToString(n)
        case .string(let s):
            // Use single quotes if string contains double quotes but no single quotes
            if s.contains("\"") && !s.contains("'") {
                return "'\(s)'"
            }
            // Otherwise use double quotes (escape any double quotes in the string)
            let escaped = stringReplace(s, "\"", "\\\"")
            return "\"\(escaped)\""
        case .templateLiteral(let template, let interpolations):
            // Template literal: `text ${expr} more text`
            var result = "`\(template)"
            for (placeholder, expr) in interpolations {
                result = stringReplace(result, placeholder, "${\(expr.render(indent: indent))}")
            }
            return result + "`"
        case .bool(let b):
            return b ? "true" : "false"
        case .null:
            return "null"
        case .array(let elements):
            var items = ""
            for (index, element) in elements.enumerated() {
                items += element.render(indent: indent)
                if index < elements.count - 1 {
                    items += ", "
                }
            }
            return "[\(items)]"
        case .object(let props):
            var pairs = ""
            for (index, prop) in props.enumerated() {
                pairs += "\(prop.0): \(prop.1.render(indent: indent))"
                if index < props.count - 1 {
                    pairs += ", "
                }
            }
            return "{ \(pairs) }"
        case .objectMultiline(let props):
            if props.isEmpty {
                return "{}"
            }
            let ind = String(repeating: "  ", count: indent)
            let innerInd = String(repeating: "  ", count: indent + 1)
            var result = "{\n"
            for (index, prop) in props.enumerated() {
                let key = prop.0
                let value = prop.1
                // For arrow/anonymous functions, use ES6 method shorthand
                if case .arrowFunction(let params, let body) = value {
                    var paramNames: [String] = []
                    for param in params {
                        if case .identifier(let name) = param.expression {
                            paramNames.append(name)
                        } else {
                            paramNames.append(param.expression.render())
                        }
                    }
                    let paramList = paramNames.joinedString(separator: ", ")
                    var bodyCode = ""
                    for (bIndex, stmt) in body.enumerated() {
                        bodyCode += stmt.render(indent: indent + 2)
                        if bIndex < body.count - 1 {
                            bodyCode += "\n"
                        }
                    }
                    result += "\(innerInd)\(key)(\(paramList)) {\n\(bodyCode)\n\(innerInd)}"
                } else if case .anonymousFunction(let params, let body) = value {
                    var paramNames: [String] = []
                    for param in params {
                        if case .identifier(let name) = param.expression {
                            paramNames.append(name)
                        } else {
                            paramNames.append(param.expression.render())
                        }
                    }
                    let paramList = paramNames.joinedString(separator: ", ")
                    var bodyCode = ""
                    for (bIndex, stmt) in body.enumerated() {
                        bodyCode += stmt.render(indent: indent + 2)
                        if bIndex < body.count - 1 {
                            bodyCode += "\n"
                        }
                    }
                    result += "\(innerInd)\(key)(\(paramList)) {\n\(bodyCode)\n\(innerInd)}"
                } else if case .methodShorthand(let params, let body) = value {
                    var paramNames: [String] = []
                    for param in params {
                        if case .identifier(let name) = param.expression {
                            paramNames.append(name)
                        } else {
                            paramNames.append(param.expression.render())
                        }
                    }
                    let paramList = paramNames.joinedString(separator: ", ")
                    var bodyCode = ""
                    for (bIndex, stmt) in body.enumerated() {
                        bodyCode += stmt.render(indent: indent + 2)
                        if bIndex < body.count - 1 {
                            bodyCode += "\n"
                        }
                    }
                    result += "\(innerInd)\(key)(\(paramList)) {\n\(bodyCode)\n\(innerInd)}"
                } else if case .identifier(let name) = value, name == key {
                    // ES6 property shorthand: when key and value are the same identifier
                    result += "\(innerInd)\(key)"
                } else {
                    // For other values, render with indent context (we're at indent + 1 inside the object)
                    let rendered = value.render(indent: indent + 1)
                    // Quote key if it contains special characters (like hyphens)
                    let needsQuoting = key.contains("-") || key.contains(" ")
                    let quotedKey = needsQuoting ? "\"\(key)\"" : key
                    result += "\(innerInd)\(quotedKey): \(rendered)"
                }
                // Add comma and newline (except for last item)
                if index < props.count - 1 {
                    result += ",\n"
                } else {
                    result += "\n"
                }
            }
            result += "\(ind)}"
            return result
        case .new(let className, let args):
            var argStrings: [String] = []
            for arg in args { argStrings.append(arg.render(indent: indent)) }
            let argList = argStrings.joinedString(separator: ", ")
            return "new \(className)(\(argList))"
        case .call(let funcName, let args):
            var argStrings: [String] = []
            for arg in args { argStrings.append(arg.render(indent: indent)) }
            let argList = argStrings.joinedString(separator: ", ")
            return "\(funcName)(\(argList))"
        case .member(let obj, let prop):
            return "\(obj.render()).\(prop)"
        case .undefined:
            return "undefined"
        case .methodCall(let obj, let method, let args):
            var argStrings: [String] = []
            for arg in args { argStrings.append(arg.render(indent: indent)) }
            let argList = argStrings.joinedString(separator: ", ")
            return "\(obj.render(indent: indent)).\(method)(\(argList))"
        case .methodCallMultiline(let obj, let methods):
            // Multi-line method chain: each method on its own line
            var result = obj.render(indent: indent)
            for (method, args) in methods {
                var argStrings: [String] = []
                for arg in args { argStrings.append(arg.render(indent: indent)) }
                let argList = argStrings.joinedString(separator: ", ")
                result += "\n\(ind).\(method)(\(argList))"
            }
            return result
        case .ternary(let condition, let trueExpr, let falseExpr):
            // Wrap complex conditions (binary operations) in parentheses for clarity
            let condStr: String
            if case .binary = condition {
                condStr = "(\(condition.render(indent: indent)))"
            } else {
                condStr = condition.render(indent: indent)
            }
            return "\(condStr) ? \(trueExpr.render(indent: indent)) : \(falseExpr.render(indent: indent))"
        case .binary(let op, let left, let right):
            let leftStr = left.render(indent: indent)
            // Wrap ternary expressions on the right side in parentheses for correct precedence
            let rightStr: String
            if case .ternary = right {
                rightStr = "(\(right.render(indent: indent)))"
            } else {
                rightStr = right.render(indent: indent)
            }
            return "\(leftStr) \(op) \(rightStr)"
        case .unary(let op, let expr):
            // Add space after keyword-like unary operators (typeof, void, delete)
            if op == "typeof" || op == "void" || op == "delete" {
                return "\(op) \(expr.render(indent: indent))"
            }
            return "\(op)\(expr.render(indent: indent))"
        case .arrowFunction(let params, let body):
            // Omit parentheses for single parameters (idiomatic style)
            var paramNames: [String] = []
            for param in params {
                if case .identifier(let name) = param.expression {
                    paramNames.append(name)
                } else {
                    paramNames.append(param.expression.render())
                }
            }
            let paramList: String
            if params.count == 1 {
                paramList = paramNames[0]
            } else {
                paramList = "(\(paramNames.joinedString(separator: ", ")))"
            }

            // Multi-line arrow functions: body at current indent + 1
            var bodyCode = ""
            for (index, stmt) in body.enumerated() {
                bodyCode += stmt.render(indent: indent + 1)
                if index < body.count - 1 {
                    bodyCode += "\n"
                }
            }
            return "\(paramList) => {\n\(bodyCode)\n\(ind)}"
        case .anonymousFunction(let params, let body):
            let paramList = params.map { param in
                if case .identifier(let name) = param.expression {
                    return name
                }
                return param.expression.render()
            }.joinedString(separator: ", ")
            var bodyLines = ""
            for (index, item) in body.enumerated() {
                bodyLines += item.render(indent: indent + 1)
                if index < body.count - 1 { bodyLines += "\n" }
            }
            return "function(\(paramList)) {\n\(bodyLines)\n\(ind)}"

        case .methodShorthand(let params, let body):
            let paramList = params.map { param in
                if case .identifier(let name) = param.expression {
                    return name
                }
                return param.expression.render()
            }.joinedString(separator: ", ")
            var bodyCode = ""
            for (index, stmt) in body.enumerated() {
                bodyCode += stmt.render(indent: indent + 1)
                if index < body.count - 1 {
                    bodyCode += "\n"
                }
            }
            return "(\(paramList)) {\n\(bodyCode)\n\(ind)}"
        case .arrayAccess(let array, let index):
            return "\(array.render(indent: indent))[\(index.render(indent: indent))]"
        case .postIncrement(let name):
            return "\(name)++"
        case .postDecrement(let name):
            return "\(name)--"
        case .optionalChain(let obj, let method, let args):
            var argStrings: [String] = []
            for arg in args { argStrings.append(arg.render()) }
            let argList = argStrings.joinedString(separator: ", ")
            return "\(obj.render())?.\(method)(\(argList))"
        case .nullishCoalesce(let left, let right):
            return "\(left.render(indent: indent)) ?? \(right.render(indent: indent))"
        case .assign(let left, let right):
            return "\(left.render(indent: indent)) = \(right.render(indent: indent))"
        case .compoundAssign(let op, let left, let right):
            return "\(left.render(indent: indent)) \(op)= \(right.render(indent: indent))"
        case .throwExpression(let expr):
            return "throw \(expr.render(indent: indent))"
        case .awaitExpression(let expr):
            return "await \(expr.render(indent: indent))"
        }
    }
}

// MARK: - JSExpression Helpers

/// New instance
public func `new`(_ className: String, _ args: JSExpression...) -> JSExpression {
    .new(className, args)
}

/// Function call - expression version
public func call(_ funcName: String, _ args: JSExpression...) -> JSExpression {
    .call(funcName, args)
}

/// Function call - array expression version
public func call(_ funcName: String, _ args: [JSExpression]) -> JSExpression {
    .call(funcName, args)
}

/// Object literal
public func object(_ props: [String: JSExpression]) -> JSExpression {
    var pairs: [(String, JSExpression)] = []
    for (key, value) in props { pairs.append((key, value)) }
    return .object(pairs)
}

// MARK: - Protocol Conformances

// Conform to JSValue protocol
extension JSExpression {
    public var expression: JSExpression { self }
}

extension JSExpression: ExpressibleByStringLiteral {
    public init(stringLiteral value: String) {
        self = .string(value)
    }
}

extension JSExpression: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: Int) {
        self = .number(Double(value))
    }
}

extension JSExpression: ExpressibleByFloatLiteral {
    public init(floatLiteral value: Double) {
        self = .number(value)
    }
}

extension JSExpression: ExpressibleByBooleanLiteral {
    public init(booleanLiteral value: Bool) {
        self = .bool(value)
    }
}

extension JSExpression: ExpressibleByArrayLiteral {
    public init(arrayLiteral elements: JSExpression...) {
        self = .array(elements)
    }
}

// MARK: - Dynamic Member Lookup

extension JSExpression {
    public subscript(dynamicMember member: String) -> JSExpression {
        .member(self, member)
    }

    /// Support for method calls: expr.method(args)
    public func callAsFunction(_ args: JSExpression...) -> JSExpression {
        // This is called on the result of .member(), which gives us the method name
        // We need to extract the object and method name from self
        guard case .member(let obj, let method) = self else {
            fatalError("callAsFunction can only be used on member expressions")
        }
        return .methodCall(obj, method, args)
    }
}

// MARK: - Operator Overloads
// Operators are defined in JSValue.swift and work for all JSValue types including JSExpression

// MARK: - Convenience Methods

extension JSExpression {
    /// Call this expression as a function
    public func callFunc(_ args: JSExpression...) -> JSExpression {
        guard case .identifier(let name) = self else {
            fatalError("Can only call functions on identifiers")
        }
        return .call(name, args)
    }

    /// Call a method on this expression
    public func method(_ name: String, _ args: JSExpression...) -> JSExpression {
        .methodCall(self, name, args)
    }

    /// Array subscript access - returns a setter for assignment syntax
    public subscript(_ index: JSExpression) -> JSArrayElementSetter {
        JSArrayElementSetter(element: .arrayAccess(self, index))
    }
}

// MARK: - JSValue-accepting Factory Methods

/// These helper functions allow calling JSExpression enum constructors with JSValue types
/// They automatically extract .expression from JSValue conforming types

/// Create member access: obj.property
public func member(_ obj: JSExpression, _ property: String) -> JSExpression {
    JSExpression.member(obj, property)
}

/// Create method call: obj.method(args)
public func methodCall(_ obj: JSExpression, _ method: String, _ args: [JSExpression]) -> JSExpression {
    JSExpression.methodCall(obj, method, args)
}

/// Create binary operation: lhs op rhs
public func binary(_ op: String, _ lhs: JSExpression, _ rhs: JSExpression) -> JSExpression {
    JSExpression.binary(op, lhs, rhs)
}

/// Create unary operation: op operand
public func unary(_ op: String, _ operand: JSExpression) -> JSExpression {
    JSExpression.unary(op, operand)
}

/// Create array access: array[index]
public func arrayAccess(_ array: JSExpression, _ index: JSExpression) -> JSExpression {
    JSExpression.arrayAccess(array, index)
}

/// Create ternary: condition ? trueExpr : falseExpr
public func ternary(_ condition: JSExpression, _ trueExpr: JSExpression, _ falseExpr: JSExpression) -> JSExpression {
    JSExpression.ternary(condition, trueExpr, falseExpr)
}

/// Create optional chain: obj?.method(args)
public func optionalChain(_ obj: JSExpression, _ method: String, _ args: JSExpression...) -> JSExpression {
    JSExpression.optionalChain(obj, method, args)
}

/// Create nullish coalesce: lhs ?? rhs
public func nullishCoalesce(_ lhs: JSExpression, _ rhs: JSExpression) -> JSExpression {
    JSExpression.nullishCoalesce(lhs, rhs)
}

/// Create assignment: target = value
public func assign(_ target: JSExpression, _ value: JSExpression) -> JSExpression {
    JSExpression.assign(target, value)
}

/// Create compound assignment: target op= value
public func compoundAssign(_ op: String, _ target: JSExpression, _ value: JSExpression) -> JSExpression {
    JSExpression.compoundAssign(op, target, value)
}

/// Create throw expression
public func throwExpression(_ expr: JSExpression) -> JSExpression {
    JSExpression.throwExpression(expr)
}

/// Create await expression
public func awaitExpression(_ expr: JSExpression) -> JSExpression {
    JSExpression.awaitExpression(expr)
}

/// Create array literal: [elements]
public func array(_ elements: [JSExpression]) -> JSExpression {
    JSExpression.array(elements)
}

/// Create method call chain
public func methodCallMultiline(_ obj: JSExpression, _ methods: [(String, [JSExpression])]) -> JSExpression {
    JSExpression.methodCallMultiline(obj, methods)
}

/// Create template literal with interpolations
public func templateLiteral(_ template: String, _ interpolations: [(String, JSExpression)]) -> JSExpression {
    JSExpression.templateLiteral(template, interpolations)
}

// MARK: - Global Helpers

// Special values
public let undefined: JSExpression = .undefined
public let null: JSExpression = .null

// String literal helper for beautiful syntax
public func string(_ value: String) -> JSExpression {
    .string(value)
}

// Browser APIs
public let CustomEvent = identifier("CustomEvent")

// Common local variables that need JSExpression type (for old-style JSStatement enum code)
extension JSExpression {
    // Already pre-registered in JSValue.swift as JSIdentifier, but need JSExpression version for old-style code
    public static let elem: JSExpression = .identifier("elem")
    public static let elementID: JSExpression = .identifier("elementID")
    public static let i: JSExpression = .identifier("i")
    public static let memory: JSExpression = .identifier("memory")
    public static let value: JSExpression = .identifier("value")
    public static let selectorPointer: JSExpression = .identifier("selectorPointer")
    public static let selectorLen: JSExpression = .identifier("selectorLen")
    public static let selector: JSExpression = .identifier("selector")
    public static let pointer: JSExpression = .identifier("pointer")
    public static let len: JSExpression = .identifier("len")
    public static let elements: JSExpression = .identifier("elements")
    public static let count: JSExpression = .identifier("count")
    public static let parent: JSExpression = .identifier("parent")
    public static let classPointer: JSExpression = .identifier("classPointer")
    public static let classLen: JSExpression = .identifier("classLen")
    public static let child: JSExpression = .identifier("child")
    public static let bufferSize: JSExpression = .identifier("bufferSize")
    public static let bufferLen: JSExpression = .identifier("bufferLen")
    public static let widthView: JSExpression = .identifier("widthView")
    public static let widthPointer: JSExpression = .identifier("widthPointer")
    public static let view: JSExpression = .identifier("view")
    public static let valuePointer: JSExpression = .identifier("valuePointer")
    public static let valueLen: JSExpression = .identifier("valueLen")
    public static let resultBuffer: JSExpression = .identifier("resultBuffer")
    public static let rect: JSExpression = .identifier("rect")
    public static let parentID: JSExpression = .identifier("parentID")
    public static let namePointer: JSExpression = .identifier("namePointer")
    public static let nameLen: JSExpression = .identifier("nameLen")
    public static let name: JSExpression = .identifier("name")
    public static let heightView: JSExpression = .identifier("heightView")
    public static let heightPointer: JSExpression = .identifier("heightPointer")
    public static let eventPointer: JSExpression = .identifier("eventPointer")
    public static let eventLen: JSExpression = .identifier("eventLen")
    public static let elID: JSExpression = .identifier("elID")
    public static let console: JSExpression = .identifier("console")
    public static let childID: JSExpression = .identifier("childID")
    public static let bufferPointer: JSExpression = .identifier("bufferPointer")
    public static let bbox: JSExpression = .identifier("bbox")
    public static let tagPointer: JSExpression = .identifier("tagPointer")
    public static let tagLen: JSExpression = .identifier("tagLen")
    public static let tag: JSExpression = .identifier("tag")
    public static let propertyPointer: JSExpression = .identifier("propertyPointer")
    public static let propertyLen: JSExpression = .identifier("propertyLen")
    public static let property: JSExpression = .identifier("property")
    public static let found: JSExpression = .identifier("found")
    public static let e: JSExpression = .identifier("e")
    public static let document: JSExpression = .identifier("document")
    public static let deep: JSExpression = .identifier("deep")
    public static let clone: JSExpression = .identifier("clone")
    public static let checked: JSExpression = .identifier("checked")
    public static let callbackID: JSExpression = .identifier("callbackID")
    public static let buffer: JSExpression = .identifier("buffer")
    public static let attrPointer: JSExpression = .identifier("attrPointer")
    public static let attrLen: JSExpression = .identifier("attrLen")
    public static let attr: JSExpression = .identifier("attr")
    public static let event: JSExpression = .identifier("event")
    public static let response: JSExpression = .identifier("response")
    public static let data: JSExpression = .identifier("data")
    public static let err: JSExpression = .identifier("err")
    public static let eventKey: JSExpression = .identifier("eventKey")
    public static let fetchData: JSExpression = .identifier("fetchData")
    public static let fetchError: JSExpression = .identifier("fetchError")
    public static let fetchStatus: JSExpression = .identifier("fetchStatus")
    public static let href: JSExpression = .identifier("href")
    public static let id: JSExpression = .identifier("id")
    public static let jsID: JSExpression = .identifier("jsID")
    public static let key: JSExpression = .identifier("key")
    public static let keyLen: JSExpression = .identifier("keyLen")
    public static let keyPointer: JSExpression = .identifier("keyPointer")
    public static let localStorage: JSExpression = .identifier("localStorage")
    public static let matches: JSExpression = .identifier("matches")
    public static let mql: JSExpression = .identifier("mql")
    public static let ms: JSExpression = .identifier("ms")
    public static let promiseID: JSExpression = .identifier("promiseID")
    public static let query: JSExpression = .identifier("query")
    public static let queryLen: JSExpression = .identifier("queryLen")
    public static let queryPointer: JSExpression = .identifier("queryPointer")
    public static let status: JSExpression = .identifier("status")
    public static let timerID: JSExpression = .identifier("timerID")
    public static let timerMap: JSExpression = .identifier("timerMap")
    public static let u8data: JSExpression = .identifier("u8data")
    public static let url: JSExpression = .identifier("url")
    public static let urlLen: JSExpression = .identifier("urlLen")
    public static let urlPointer: JSExpression = .identifier("urlPointer")
    public static let wasmID: JSExpression = .identifier("wasmID")
    public static let window: JSExpression = .identifier("window")
    public static let eventID: JSExpression = .identifier("eventID")
}

// Helper for await
public func await(_ expr: JSExpression) -> JSExpression {
    awaitExpression(expr)
}

// Helper for typeof
public func typeof(_ expr: JSExpression) -> JSExpression {
    unary("typeof", expr)
}

// Object literal helpers
public func objectMultiline(_ props: [(JSIdentifier, JSExpression)]) -> JSExpression {
    var pairs: [(String, JSExpression)] = []
    for prop in props {
        // Extract the identifier name from the expression
        if case .identifier(let name) = prop.0.expression {
            pairs.append((name, prop.1))
        } else {
            pairs.append((prop.0.expression.render(), prop.1))
        }
    }
    return .objectMultiline(pairs)
}

// Overload for string keys
public func objectMultiline(_ props: [(String, JSExpression)]) -> JSExpression {
    .objectMultiline(props)
}

public func arrowFunction(_ params: [JSIdentifier], _ body: [JSStatement]) -> JSExpression {
    .arrowFunction(params, body.map { AnyJSContent($0) })
}

// MARK: - |= Assignment Operator

/// Property assignment operator: elem.innerHTML |= value → elem.innerHTML = value
public func |= (lhs: JSPropertySetter, rhs: JSExpression) -> JSExpression {
    .assign(lhs.property, rhs)
}

/// Array element assignment operator: view[index] |= value → view[index] = value
public func |= (lhs: JSArrayElementSetter, rhs: JSExpression) -> JSExpression {
    .assign(lhs.element, rhs)
}

/// Variable reassignment operator: variable |= value → variable = value
public func |= (lhs: JSIdentifier, rhs: JSExpression) -> JSExpression {
    .assign(lhs.expression, rhs)
}

/// Post-increment operator: i++
public postfix func ++ (operand: JSIdentifier) -> JSExpression {
    if case .identifier(let name) = operand.expression {
        return .postIncrement(name)
    }
    return .postIncrement(operand.expression.render())
}

/// Nullish coalescing operator: a ?? b
public func ?? (lhs: JSExpression, rhs: JSExpression) -> JSExpression {
    .nullishCoalesce(lhs, rhs)
}

/// Arrow function operator: [params] => body
public func => (lhs: [JSIdentifier], @JSBuilder rhs: () -> [AnyJSContent]) -> JSExpression {
    return .arrowFunction(lhs, rhs())
}
