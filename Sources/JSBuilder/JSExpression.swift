#if !os(WASI)

import Foundation

@dynamicMemberLookup
public indirect enum JSExpression: Sendable, JSValue, JS {
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
    case arrowFunction([JSIdentifier], [JSStatement])  // (params) => { body }
    case anonymousFunction([JSIdentifier], [JSStatement])  // function(params) { body }
    case methodShorthand([JSIdentifier], [JSStatement])  // ES6 method shorthand: method(params) { body }
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
                return String(Int(n))
            }
            return String(n)
        case .string(let s):
            // Use single quotes if string contains double quotes but no single quotes
            if s.contains("\"") && !s.contains("'") {
                return "'\(s)'"
            }
            // Otherwise use double quotes (escape any double quotes in the string)
            let escaped = s.replacingOccurrences(of: "\"", with: "\\\"")
            return "\"\(escaped)\""
        case .templateLiteral(let template, let interpolations):
            // Template literal: `text ${expr} more text`
            var result = "`\(template)"
            for (placeholder, expr) in interpolations {
                result = result.replacingOccurrences(of: placeholder, with: "${\(expr.render(indent: indent))}")
            }
            return result + "`"
        case .bool(let b):
            return b ? "true" : "false"
        case .null:
            return "null"
        case .array(let elements):
            let items = elements.map { $0.render(indent: indent) }.joined(separator: ", ")
            return "[\(items)]"
        case .object(let props):
            let pairs = props.map { "\($0): \($1.render(indent: indent))" }.joined(separator: ", ")
            return "{ \(pairs) }"
        case .objectMultiline(let props):
            if props.isEmpty {
                return "{}"
            }
            let ind = String(repeating: "  ", count: indent)
            let innerInd = String(repeating: "  ", count: indent + 1)
            var result = "{\n"
            for (key, value) in props {
                // For arrow/anonymous functions, use ES6 method shorthand
                if case .arrowFunction(let params, let body) = value {
                    let paramList = params.map { param in
                        if case .identifier(let name) = param.expression {
                            return name
                        }
                        return param.expression.render()
                    }.joined(separator: ", ")
                    let bodyCode = body.map { $0.render(indent: indent + 2) }.joined(separator: "\n")
                    result += "\(innerInd)\(key)(\(paramList)) {\n\(bodyCode)\n\(innerInd)}"
                } else if case .anonymousFunction(let params, let body) = value {
                    let paramList = params.map { param in
                        if case .identifier(let name) = param.expression {
                            return name
                        }
                        return param.expression.render()
                    }.joined(separator: ", ")
                    let bodyCode = body.map { $0.render(indent: indent + 2) }.joined(separator: "\n")
                    result += "\(innerInd)\(key)(\(paramList)) {\n\(bodyCode)\n\(innerInd)}"
                } else if case .methodShorthand(let params, let body) = value {
                    let paramList = params.map { param in
                        if case .identifier(let name) = param.expression {
                            return name
                        }
                        return param.expression.render()
                    }.joined(separator: ", ")
                    let bodyCode = body.map { $0.render(indent: indent + 2) }.joined(separator: "\n")
                    result += "\(innerInd)\(key)(\(paramList)) {\n\(bodyCode)\n\(innerInd)}"
                } else if case .identifier(let name) = value, name == key {
                    // ES6 property shorthand: when key and value are the same identifier
                    result += "\(innerInd)\(key)"
                } else {
                    // For other values, render with indent context (we're at indent + 1 inside the object)
                    let rendered = value.render(indent: indent + 1)
                    // Quote key if it contains special characters (like hyphens)
                    let needsQuoting = key.contains("-") || key.contains(" ") || !key.first!.isLetter
                    let quotedKey = needsQuoting ? "\"\(key)\"" : key
                    result += "\(innerInd)\(quotedKey): \(rendered)"
                }
                // Add comma and newline (except for last item - but simpler to always add and strip later)
                result += ",\n"
            }
            // Remove trailing comma from last property
            if result.hasSuffix(",\n") {
                result = String(result.dropLast(2)) + "\n"
            }
            result += "\(ind)}"
            return result
        case .new(let className, let args):
            let argList = args.map { $0.render(indent: indent) }.joined(separator: ", ")
            return "new \(className)(\(argList))"
        case .call(let funcName, let args):
            let argList = args.map { $0.render(indent: indent) }.joined(separator: ", ")
            return "\(funcName)(\(argList))"
        case .member(let obj, let prop):
            return "\(obj.render()).\(prop)"
        case .undefined:
            return "undefined"
        case .methodCall(let obj, let method, let args):
            let argList = args.map { $0.render(indent: indent) }.joined(separator: ", ")
            return "\(obj.render(indent: indent)).\(method)(\(argList))"
        case .methodCallMultiline(let obj, let methods):
            // Multi-line method chain: each method on its own line
            var result = obj.render(indent: indent)
            for (method, args) in methods {
                let argList = args.map { $0.render(indent: indent) }.joined(separator: ", ")
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
            let paramNames = params.map { param in
                if case .identifier(let name) = param.expression {
                    return name
                }
                return param.expression.render()
            }
            let paramList: String
            if params.count == 1 {
                paramList = paramNames[0]
            } else {
                paramList = "(\(paramNames.joined(separator: ", ")))"
            }

            // Single expression arrow functions can be inline
            if body.count == 1, case .return(let expr?) = body[0] {
                return "\(paramList) => \(expr.render(indent: indent))"
            }
            // Multi-line arrow functions: body at current indent + 1
            let bodyCode = body.map { $0.render(indent: indent + 1) }.joined(separator: "\n")
            return "\(paramList) => {\n\(bodyCode)\n\(ind)}"
        case .anonymousFunction(let params, let body):
            let paramList = params.map { param in
                if case .identifier(let name) = param.expression {
                    return name
                }
                return param.expression.render()
            }.joined(separator: ", ")
            let bodyCode = body.map { $0.render(indent: 1) }.joined(separator: "\n")
            return "function(\(paramList)) {\n\(bodyCode)\n}"
        case .methodShorthand(let params, let body):
            let paramList = params.map { param in
                if case .identifier(let name) = param.expression {
                    return name
                }
                return param.expression.render()
            }.joined(separator: ", ")
            let bodyCode = body.map { $0.render(indent: 1) }.joined(separator: "\n")
            return "(\(paramList)) {\n\(bodyCode)\n}"
        case .arrayAccess(let array, let index):
            return "\(array.render(indent: indent))[\(index.render(indent: indent))]"
        case .postIncrement(let name):
            return "\(name)++"
        case .postDecrement(let name):
            return "\(name)--"
        case .optionalChain(let obj, let method, let args):
            let argList = args.map { $0.render() }.joined(separator: ", ")
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
public func `new`(_ className: String, _ args: (any JSValue)...) -> JSExpression {
    .new(className, args.map { $0.expression })
}

/// Function call - expression version
public func call(_ funcName: String, _ args: (any JSValue)...) -> JSExpression {
    .call(funcName, args.map { $0.expression })
}

/// Function call - statement version (for use in @JSBuilder blocks)
public func call(_ funcName: String, _ args: any JSValue...) -> JSStatement {
    .expression(.call(funcName, args.map { $0.expression }))
}

/// Function call - array expression version
public func call(_ funcName: String, _ args: [JSExpression]) -> JSExpression {
    .call(funcName, args)
}


/// Object literal
public func object(_ props: [String: JSExpression]) -> JSExpression {
    .object(props.map { ($0, $1) })
}

/// Object literal with JSValue support
public func object(_ props: [String: any JSValue]) -> JSExpression {
    .object(props.map { ($0, $1.expression) })
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
    public func callAsFunction(_ args: any JSValue...) -> JSExpression {
        // This is called on the result of .member(), which gives us the method name
        // We need to extract the object and method name from self
        guard case .member(let obj, let method) = self else {
            fatalError("callAsFunction can only be used on member expressions")
        }
        return .methodCall(obj, method, args.map(\.expression))
    }
}

/// Optional chaining for JSExpression: expr ?| methodName
public func ?| (lhs: JSExpression, rhs: JSIdentifier) -> JSOptionalChainMethod {
    if case .identifier(let methodName) = rhs.expression {
        return JSOptionalChainMethod(object: lhs, method: methodName)
    }
    fatalError("Right side of ?| must be a simple identifier (method name)")
}

/// Helper struct for optional chaining method calls
public struct JSOptionalChainMethod {
    let object: JSExpression
    let method: String

    public func callAsFunction(_ args: any JSValue...) -> JSExpression {
        .optionalChain(object, method, args.map(\.expression))
    }
}

// MARK: - Operator Overloads
// Operators are defined in JSValue.swift and work for all JSValue types including JSExpression

// MARK: - Convenience Methods

extension JSExpression {
    /// Call this expression as a function
    public func callFunc(_ args: (any JSValue)...) -> JSExpression {
        guard case .identifier(let name) = self else {
            fatalError("Can only call functions on identifiers")
        }
        return .call(name, args.map { $0.expression })
    }

    /// Call a method on this expression
    public func method(_ name: String, _ args: (any JSValue)...) -> JSExpression {
        .methodCall(self, name, args.map { $0.expression })
    }

    /// Array subscript access - returns a setter for assignment syntax
    public subscript(_ index: any JSValue) -> JSArrayElementSetter {
        JSArrayElementSetter(element: .arrayAccess(self, index.expression))
    }
}

// MARK: - JSValue-accepting Factory Methods

/// These helper functions allow calling JSExpression enum constructors with JSValue types
/// They automatically extract .expression from JSValue conforming types

/// Create member access: obj.property
public func member(_ obj: any JSValue, _ property: String) -> JSExpression {
    JSExpression.member(obj.expression, property)
}

/// Create method call: obj.method(args)
public func methodCall(_ obj: any JSValue, _ method: String, _ args: [any JSValue]) -> JSExpression {
    JSExpression.methodCall(obj.expression, method, args.map(\.expression))
}

/// Create binary operation: lhs op rhs
public func binary(_ op: String, _ lhs: any JSValue, _ rhs: any JSValue) -> JSExpression {
    JSExpression.binary(op, lhs.expression, rhs.expression)
}

/// Create unary operation: op operand
public func unary(_ op: String, _ operand: any JSValue) -> JSExpression {
    JSExpression.unary(op, operand.expression)
}

/// Create array access: array[index]
public func arrayAccess(_ array: any JSValue, _ index: any JSValue) -> JSExpression {
    JSExpression.arrayAccess(array.expression, index.expression)
}

/// Create ternary: condition ? trueExpr : falseExpr
public func ternary(_ condition: any JSValue, _ trueExpr: any JSValue, _ falseExpr: any JSValue) -> JSExpression {
    JSExpression.ternary(condition.expression, trueExpr.expression, falseExpr.expression)
}

/// Create optional chain: obj?.method(args)
public func optionalChain(_ obj: any JSValue, _ method: String, _ args: any JSValue...) -> JSExpression {
    JSExpression.optionalChain(obj.expression, method, args.map(\.expression))
}

/// Create nullish coalesce: lhs ?? rhs
public func nullishCoalesce(_ lhs: any JSValue, _ rhs: any JSValue) -> JSExpression {
    JSExpression.nullishCoalesce(lhs.expression, rhs.expression)
}

/// Create assignment: target = value
public func assign(_ target: any JSValue, _ value: any JSValue) -> JSExpression {
    JSExpression.assign(target.expression, value.expression)
}

/// Create compound assignment: target op= value
public func compoundAssign(_ op: String, _ target: any JSValue, _ value: any JSValue) -> JSExpression {
    JSExpression.compoundAssign(op, target.expression, value.expression)
}

/// Create throw expression
public func throwExpression(_ expr: any JSValue) -> JSExpression {
    JSExpression.throwExpression(expr.expression)
}

/// Create await expression
public func awaitExpression(_ expr: any JSValue) -> JSExpression {
    JSExpression.awaitExpression(expr.expression)
}

/// Create array literal: [elements]
public func array(_ elements: [any JSValue]) -> JSExpression {
    JSExpression.array(elements.map(\.expression))
}

/// Create method call chain
public func methodCallMultiline(_ obj: any JSValue, _ methods: [(String, [any JSValue])]) -> JSExpression {
    JSExpression.methodCallMultiline(obj.expression, methods.map { ($0.0, $0.1.map(\.expression)) })
}

/// Create template literal with interpolations
public func templateLiteral(_ template: String, _ interpolations: [(String, any JSValue)]) -> JSExpression {
    JSExpression.templateLiteral(template, interpolations.map { ($0.0, $0.1.expression) })
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
    public static let elementId: JSExpression = .identifier("elementId")
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
    public static let parentId: JSExpression = .identifier("parentId")
    public static let namePointer: JSExpression = .identifier("namePointer")
    public static let nameLen: JSExpression = .identifier("nameLen")
    public static let name: JSExpression = .identifier("name")
    public static let heightView: JSExpression = .identifier("heightView")
    public static let heightPointer: JSExpression = .identifier("heightPointer")
    public static let eventPointer: JSExpression = .identifier("eventPointer")
    public static let eventLen: JSExpression = .identifier("eventLen")
    public static let elId: JSExpression = .identifier("elId")
    public static let console: JSExpression = .identifier("console")
    public static let childId: JSExpression = .identifier("childId")
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
    public static let callbackId: JSExpression = .identifier("callbackId")
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
    public static let jsId: JSExpression = .identifier("jsId")
    public static let key: JSExpression = .identifier("key")
    public static let keyLen: JSExpression = .identifier("keyLen")
    public static let keyPointer: JSExpression = .identifier("keyPointer")
    public static let localStorage: JSExpression = .identifier("localStorage")
    public static let matches: JSExpression = .identifier("matches")
    public static let mql: JSExpression = .identifier("mql")
    public static let ms: JSExpression = .identifier("ms")
    public static let promiseId: JSExpression = .identifier("promiseId")
    public static let query: JSExpression = .identifier("query")
    public static let queryLen: JSExpression = .identifier("queryLen")
    public static let queryPointer: JSExpression = .identifier("queryPointer")
    public static let status: JSExpression = .identifier("status")
    public static let timerId: JSExpression = .identifier("timerId")
    public static let timerMap: JSExpression = .identifier("timerMap")
    public static let u8data: JSExpression = .identifier("u8data")
    public static let url: JSExpression = .identifier("url")
    public static let urlLen: JSExpression = .identifier("urlLen")
    public static let urlPointer: JSExpression = .identifier("urlPointer")
    public static let wasmId: JSExpression = .identifier("wasmId")
    public static let window: JSExpression = .identifier("window")
    public static let eventId: JSExpression = .identifier("eventId")
}

// Helper for await
public func await(_ expr: any JSValue) -> JSExpression {
    awaitExpression(expr)
}

// Helper for typeof
public func typeof(_ expr: any JSValue) -> JSExpression {
    unary("typeof", expr)
}

// Object literal helpers
public func objectMultiline(_ props: [(JSIdentifier, JSExpression)]) -> JSExpression {
    .objectMultiline(props.map { (key, value) in
        // Extract the identifier name from the expression
        if case .identifier(let name) = key.expression {
            return (name, value)
        }
        return (key.expression.render(), value)
    })
}

// Overload for string keys
public func objectMultiline(_ props: [(String, JSExpression)]) -> JSExpression {
    .objectMultiline(props)
}

public func arrowFunction(_ params: [JSIdentifier], _ body: [JSStatement]) -> JSExpression {
    .arrowFunction(params, body)
}

// MARK: - |= Assignment Operator

/// Property assignment operator: elem.innerHTML |= value → elem.innerHTML = value
public func |= (lhs: JSPropertySetter, rhs: any JSValue) -> JSExpression {
    .assign(lhs.property, rhs.expression)
}

/// Array element assignment operator: view[index] |= value → view[index] = value
public func |= (lhs: JSArrayElementSetter, rhs: any JSValue) -> JSExpression {
    .assign(lhs.element, rhs.expression)
}

/// Variable reassignment operator: variable |= value → variable = value
public func |= (lhs: JSIdentifier, rhs: any JSValue) -> JSExpression {
    .assign(lhs.expression, rhs.expression)
}

#endif
