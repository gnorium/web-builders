
import EmbeddedSwiftUtilities


public indirect enum JSStatement: JSContent {
    case const(JSIdentifier, JSExpression)
    case constDestructure([JSIdentifier], JSExpression) // const { a, b } = expr
    case `let`(JSIdentifier, JSExpression?)
    case `var`(JSIdentifier, JSExpression?)
    case `return`(JSExpression?)
    case expression(JSExpression)
    case function(String, [String], [JSStatement])
    case asyncFunction(String, [String], [JSStatement])
    case comment(String)
    case block([JSStatement])
    case `if`(JSExpression, [JSStatement], [JSStatement]?)
    case `for`(String, JSExpression, String, [JSStatement]) // for (`init`; condition; increment) { body }
    case `while`(JSExpression, [JSStatement]) // while (condition) { body }
    case tryBlock([JSStatement], String?, [JSStatement]) // try { } catch(e) { }
    case iife([JSStatement]) // (function() { })()
    case await(JSExpression) // await expr
    case raw(String)

    public func render() -> JSStatement { self }

    public func serialize(indent: Int = 0) -> String {
        let ind = String(repeating: "  ", count: indent)

        switch self {
        case .const(let name, let value):
            let nameStr = if case .identifier(let n) = name.expression { n } else { name.expression.serialize() }
            return "\(ind)const \(nameStr) = \(value.serialize(indent: indent));"

        case .constDestructure(let names, let expr):
            var nameStrs: [String] = []
            for name in names {
                if case .identifier(let n) = name.expression { nameStrs.append(n) }
                else { nameStrs.append(name.expression.serialize()) }
            }
            let destructure = "{ \(nameStrs.joinedString(separator: ", ")) }"
            return "\(ind)const \(destructure) = \(expr.serialize(indent: indent));"

        case .`let`(let name, let value):
            let nameStr = if case .identifier(let n) = name.expression { n } else { name.expression.serialize() }
            if let value = value {
                return "\(ind)let \(nameStr) = \(value.serialize(indent: indent));"
            }
            return "\(ind)let \(nameStr);"

        case .`var`(let name, let value):
            let nameStr = if case .identifier(let n) = name.expression { n } else { name.expression.serialize() }
            if let value = value {
                return "\(ind)var \(nameStr) = \(value.serialize(indent: indent));"
            }
            return "\(ind)var \(nameStr);"

        case .return(let expr):
            if let expr = expr {
                return "\(ind)return \(expr.serialize(indent: indent));"
            }
            return "\(ind)return;"

        case .expression(let expr):
            return "\(ind)\(expr.serialize(indent: indent));"

        case .function(let name, let params, let body):
            let paramList = params.joinedString(separator: ", ")
            var bodyLines = ""
            for (index, item) in body.enumerated() {
                bodyLines += item.serialize(indent: indent + 1)
                if index < body.count - 1 {
                    bodyLines += "\n"
                }
            }
            return "\(ind)function \(name)(\(paramList)) {\n\(bodyLines)\n\(ind)}"

        case .comment(let text):
            if text.isEmpty {
                return ""
            }
            return "\(ind)// \(text)"

        case .block(let statements):
            var result = ""
            for (index, item) in statements.enumerated() {
                result += item.serialize(indent: indent)
                if index < statements.count - 1 {
                    result += "\n"
                }
            }
            return result

        case .`if`(let condition, let thenBlock, let elseBlock):
            // Single-line if statement (no braces) - but not if the statement is itself an if/block
            if thenBlock.count == 1 && elseBlock == nil {
                // We can't easily check for .if case here because of JSStatement, 
                // but we can just render it and see.
            }

            var result = "\(ind)if (\(condition.serialize())) {\n"
            for (index, item) in thenBlock.enumerated() {
                result += item.serialize(indent: indent + 1)
                if index < thenBlock.count - 1 { result += "\n" }
            }
            result += "\n\(ind)}"
            if let elseBlock = elseBlock {
                result += " else {\n"
                for (index, item) in elseBlock.enumerated() {
                    result += item.serialize(indent: indent + 1)
                    if index < elseBlock.count - 1 { result += "\n" }
                }
                result += "\n\(ind)}"
            }
            return result

        case .asyncFunction(let name, let params, let body):
            let paramList = params.joinedString(separator: ", ")
            var bodyLines = ""
            for (index, item) in body.enumerated() {
                bodyLines += item.serialize(indent: indent + 1)
                if index < body.count - 1 { bodyLines += "\n" }
            }
            return "\(ind)async function \(name)(\(paramList)) {\n\(bodyLines)\n\(ind)}"

		case .`for`(let `init`, let condition, let increment, let body):
            var bodyLines = ""
            for (index, item) in body.enumerated() {
                bodyLines += item.serialize(indent: indent + 1)
                if index < body.count - 1 { bodyLines += "\n" }
            }
			return "\(ind)for (\(`init`); \(condition.serialize()); \(increment)) {\n\(bodyLines)\n\(ind)}"

		case .`while`(let condition, let body):
            var bodyLines = ""
            for (index, item) in body.enumerated() {
                bodyLines += item.serialize(indent: indent + 1)
                if index < body.count - 1 { bodyLines += "\n" }
            }
			return "\(ind)while (\(condition.serialize())) {\n\(bodyLines)\n\(ind)}"

        case .tryBlock(let tryBody, let catchVar, let catchBody):
            var result = "\(ind)try {\n"
            for (index, item) in tryBody.enumerated() {
                result += item.serialize(indent: indent + 1)
                if index < tryBody.count - 1 { result += "\n" }
            }
            result += "\n\(ind)}"
            if let catchVar = catchVar {
                result += " catch (\(catchVar)) {\n"
                for (index, item) in catchBody.enumerated() {
                    result += item.serialize(indent: indent + 1)
                    if index < catchBody.count - 1 { result += "\n" }
                }
                result += "\n\(ind)}"
            }
            return result

        case .iife(let body):
            var bodyLines = ""
            for (index, item) in body.enumerated() {
                bodyLines += item.serialize(indent: indent + 1)
                if index < body.count - 1 { bodyLines += "\n" }
            }
            return "\(ind)(function() {\n\(bodyLines)\n\(ind)})();"

        case .await(let expr):
            return "\(ind)await \(expr.serialize(indent: indent))"
            
        case .raw(let content):
            return ind + content
        }
    }
}

// MARK: - JSStatement Helpers

/// Create const declaration (deprecated - use const.name |= value)
public func const(_ name: JSIdentifier, _ value: JSExpression) -> JSStatement {
    .const(name, value)
}

/// Create let declaration (deprecated - use let.name |= value)
public func `let`(_ name: JSIdentifier, _ value: JSExpression? = nil) -> JSStatement {
    .let(name, value)
}

/// Create var declaration (deprecated - use var.name |= value)
public func `var`(_ name: JSIdentifier, _ value: JSExpression? = nil) -> JSStatement {
    .var(name, value)
}

/// Create return statement
public func `return`(_ expr: JSExpression? = nil) -> JSStatement {
    .return(expr)
}

/// Create function
public func function(_ name: String, _ params: [JSIdentifier], @JSBuilder _ content: () -> [JSStatement]) -> JSStatement {
    var paramNames: [String] = []
    for param in params {
        if case .identifier(let name) = param.expression { paramNames.append(name) }
        else { paramNames.append(param.expression.serialize()) }
    }
    return .function(name, paramNames, content())
}

/// Comment
public func comment(_ text: String) -> JSStatement {
    .comment(text)
}

/// Blank line (empty comment)
public func blankLine() -> JSStatement {
    .comment("")
}

/// Convert any JSValue to an expression statement
public func expr(_ value: JSExpression) -> JSStatement {
    .expression(value)
}

// MARK: - Additional JSStatement Helpers

/// Create if statement with else block
public func `if`(_ condition: JSExpression, @JSBuilder thenBlock: () -> [JSStatement], @JSBuilder elseBlock: () -> [JSStatement]) -> JSStatement {
    return .if(condition, thenBlock(), elseBlock())
}

/// Create if statement without else block
public func `if`(_ condition: JSExpression, @JSBuilder thenBlock: () -> [JSStatement]) -> JSStatement {
    return .if(condition, thenBlock(), nil)
}

/// Create async function
public func asyncFunction(_ name: String, _ params: [JSIdentifier], @JSBuilder _ content: () -> [JSStatement]) -> JSStatement {
    var paramNames: [String] = []
    for param in params {
        if case .identifier(let name) = param.expression { paramNames.append(name) }
        else { paramNames.append(param.expression.serialize()) }
    }
    return .asyncFunction(name, paramNames, content())
}

/// Try-catch intermediate for beautiful chaining syntax
public struct JSTryCatch {
    let tryStatements: [JSStatement]

    public func `catch`(_ catchVar: String, @JSBuilder catchBody: () -> [JSStatement]) -> JSStatement {
        return .tryBlock(tryStatements, catchVar, catchBody())
    }

    public func `catch`(_ catchVar: JSIdentifier, @JSBuilder catchBody: () -> [JSStatement]) -> JSStatement {
        if case .identifier(let varName) = catchVar.expression {
            return .tryBlock(tryStatements, varName, catchBody())
        }
        return .tryBlock(tryStatements, catchVar.expression.serialize(), catchBody())
    }
}

/// Create try-catch block with beautiful syntax: `try` { ... }.catch("e") { ... }
public func `try`(@JSBuilder body: () -> [JSStatement]) -> JSTryCatch {
    return JSTryCatch(tryStatements: body())
}

/// Create try-catch block (function call syntax with labeled argument)
public func `try`(@JSBuilder body: () -> [JSStatement], catch catchVar: String, @JSBuilder catchBody: () -> [JSStatement]) -> JSStatement {
    return .tryBlock(body(), catchVar, catchBody())
}

/// Create IIFE (Immediately Invoked Function Expression)
public func iife(@JSBuilder body: () -> [JSStatement]) -> JSStatement {
    return .iife(body())
}

/// Create for loop with string syntax (deprecated - use DSL version)
public func `for`(_ initializer: String, _ condition: JSExpression, _ increment: String, @JSBuilder body: () -> [JSStatement]) -> JSStatement {
    return .for(initializer, condition, increment, body())
}

/// Create for loop with beautiful DSL: `for`(let.i |= 0, i < count, i++) { ... }
public func `for`(_ initializer: JSStatement, _ condition: JSExpression, _ increment: JSExpression, @JSBuilder body: () -> [JSStatement]) -> JSStatement {
    let rawInit = initializer.serialize(indent: 0)
    let initString = stringReplace(stringTrim(rawInit), ";", "")
    let incrementString = increment.serialize(indent: 0)
    return .for(initString, condition, incrementString, body())
}

/// Create while loop: `while`(condition) { ... }
public func `while`(_ condition: JSExpression, @JSBuilder body: () -> [JSStatement]) -> JSStatement {
    return .while(condition, body())
}

public func constDestructure(_ names: [JSIdentifier], _ value: JSExpression) -> JSStatement {
    .constDestructure(names, value)
}

public func call(_ funcName: String, _ args: [JSExpression]) -> JSStatement {
    .expression(.call(funcName, args))
}

public func `throw`(_ expr: JSExpression) -> JSStatement {
    .expression(.throwExpression(expr))
}

public func |= (lhs: JSConstDeclarator, rhs: JSExpression) -> JSStatement {
	.const(JSIdentifier(lhs.constName), rhs)
}

public func |= (lhs: JSLetDeclarator, rhs: JSExpression) -> JSStatement {
	.`let`(JSIdentifier(lhs.letName), rhs)
}

public func |= (lhs: JSVarDeclarator, rhs: JSExpression) -> JSStatement {
	.`var`(JSIdentifier(lhs.name), rhs)
}

/// Function call - statement version (for use in @JSBuilder blocks)
public func call(_ funcName: String, _ args: JSExpression...) -> JSStatement {
    .expression(.call(funcName, args))
}
