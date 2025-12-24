#if !os(WASI)

import Foundation

public indirect enum JSStatement: JS {
    case const(JSIdentifier, JSValue)
    case constDestructure([JSIdentifier], JSExpression) // const { a, b } = expr
    case `let`(JSIdentifier, JSValue?)
    case `var`(JSIdentifier, JSValue?)
    case `return`(JSExpression?)
    case expression(JSExpression)
    case function(String, [String], [JSStatement])
    case asyncFunction(String, [String], [JSStatement])
    case comment(String)
    case block([JSStatement])
    case `if`(JSValue, [JSStatement], [JSStatement]?)
    case `for`(String, JSValue, String, [JSStatement]) // for (`init`; condition; increment) { body }
    case `while`(JSValue, [JSStatement]) // while (condition) { body }
    case tryBlock([JSStatement], String?, [JSStatement]) // try { } catch(e) { }
    case iife([JSStatement]) // (function() { })()
    case await(JSExpression) // await expr

    public func render(indent: Int = 0) -> String {
        let ind = String(repeating: "  ", count: indent)

        switch self {
        case .const(let name, let value):
            let nameStr = if case .identifier(let n) = name.expression { n } else { name.expression.render() }
            return "\(ind)const \(nameStr) = \(value.expression.render(indent: indent));"

        case .constDestructure(let names, let expr):
            let nameStrs = names.map { name in
                if case .identifier(let n) = name.expression { return n }
                return name.expression.render()
            }
            let destructure = "{ \(nameStrs.joined(separator: ", ")) }"
            return "\(ind)const \(destructure) = \(expr.render(indent: indent));"

        case .`let`(let name, let value):
            let nameStr = if case .identifier(let n) = name.expression { n } else { name.expression.render() }
            if let value = value {
                return "\(ind)let \(nameStr) = \(value.expression.render(indent: indent));"
            }
            return "\(ind)let \(nameStr);"

        case .`var`(let name, let value):
            let nameStr = if case .identifier(let n) = name.expression { n } else { name.expression.render() }
            if let value = value {
                return "\(ind)var \(nameStr) = \(value.expression.render(indent: indent));"
            }
            return "\(ind)var \(nameStr);"

        case .return(let expr):
            if let expr = expr {
                return "\(ind)return \(expr.render(indent: indent));"
            }
            return "\(ind)return;"

        case .expression(let expr):
            return "\(ind)\(expr.render(indent: indent));"

        case .function(let name, let params, let body):
            let paramList = params.joined(separator: ", ")
            let bodyLines = body.map { $0.render(indent: indent + 1) }.joined(separator: "\n")
            return "\(ind)function \(name)(\(paramList)) {\n\(bodyLines)\n\(ind)}"

        case .comment(let text):
            if text.isEmpty {
                return ""
            }
            return "\(ind)// \(text)"

        case .block(let statements):
            return statements.map { $0.render(indent: indent) }.joined(separator: "\n")

        case .`if`(let condition, let thenBlock, let elseBlock):
            // Single-line if statement (no braces) - but not if the statement is itself an if/block
            if thenBlock.count == 1 && elseBlock == nil {
                if case .`if` = thenBlock[0] {
                    // Don't use single-line for nested if statements
                } else if case .block = thenBlock[0] {
                    // Don't use single-line for blocks
                } else {
                    return "\(ind)if (\(condition.expression.render())) \(thenBlock[0].render(indent: 0))".replacingOccurrences(of: "\n", with: " ")
                }
            }

            var result = "\(ind)if (\(condition.expression.render())) {\n"
            result += thenBlock.map { $0.render(indent: indent + 1) }.joined(separator: "\n")
            result += "\n\(ind)}"
            if let elseBlock = elseBlock {
                // Check if else block is a single if statement (else-if pattern)
                if elseBlock.count == 1, case .`if` = elseBlock[0] {
                    result += " else "
                    // Render the if statement without the indent prefix (we already have the else)
                    let ifStatement = elseBlock[0].render(indent: indent)
                    if ifStatement.hasPrefix(ind) {
                        result += String(ifStatement.dropFirst(ind.count))
                    } else {
                        result += ifStatement
                    }
                } else {
                    result += " else {\n"
                    result += elseBlock.map { $0.render(indent: indent + 1) }.joined(separator: "\n")
                    result += "\n\(ind)}"
                }
            }
            return result

        case .asyncFunction(let name, let params, let body):
            let paramList = params.joined(separator: ", ")
            let bodyLines = body.map { $0.render(indent: indent + 1) }.joined(separator: "\n")
            return "\(ind)async function \(name)(\(paramList)) {\n\(bodyLines)\n\(ind)}"

		case .`for`(let `init`, let condition, let increment, let body):
            let bodyLines = body.map { $0.render(indent: indent + 1) }.joined(separator: "\n")
			return "\(ind)for (\(`init`); \(condition.expression.render()); \(increment)) {\n\(bodyLines)\n\(ind)}"

		case .`while`(let condition, let body):
            let bodyLines = body.map { $0.render(indent: indent + 1) }.joined(separator: "\n")
			return "\(ind)while (\(condition.expression.render())) {\n\(bodyLines)\n\(ind)}"

        case .tryBlock(let tryBody, let catchVar, let catchBody):
            var result = "\(ind)try {\n"
            result += tryBody.map { $0.render(indent: indent + 1) }.joined(separator: "\n")
            result += "\n\(ind)}"
            if let catchVar = catchVar {
                result += " catch (\(catchVar)) {\n"
                result += catchBody.map { $0.render(indent: indent + 1) }.joined(separator: "\n")
                result += "\n\(ind)}"
            }
            return result

        case .iife(let body):
            let bodyLines = body.map { $0.render(indent: indent + 1) }.joined(separator: "\n")
            return "\(ind)(function() {\n\(bodyLines)\n\(ind)})();"

        case .await(let expr):
            return "\(ind)await \(expr.render(indent: indent))"
        }
    }
}

// MARK: - JSStatement Helpers

/// Create const declaration (deprecated - use const.name |= value)
public func const(_ name: JSIdentifier, _ value: any JSValue) -> JSStatement {
    .const(name, value)
}

/// Create let declaration (deprecated - use let.name |= value)
public func `let`(_ name: JSIdentifier, _ value: (any JSValue)? = nil) -> JSStatement {
    .let(name, value)
}

/// Create var declaration (deprecated - use var.name |= value)
public func `var`(_ name: JSIdentifier, _ value: (any JSValue)? = nil) -> JSStatement {
    .var(name, value)
}

/// Create return statement
public func `return`(_ expr: (any JSValue)? = nil) -> JSStatement {
    .return(expr?.expression)
}

/// Create function
public func function(_ name: String, _ params: [JSIdentifier], @JSBuilder _ body: () -> [JS]) -> JSStatement {
    let statements = body().compactMap { $0 as? JSStatement }
    let paramNames = params.map { param in
        if case .identifier(let name) = param.expression {
            return name
        }
        return param.expression.render()
    }
    return .function(name, paramNames, statements)
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
public func expr(_ value: any JSValue) -> JSStatement {
    .expression(value.expression)
}

// MARK: - Additional JSStatement Helpers

/// Create if statement with else block
public func `if`(_ condition: any JSValue, @JSBuilder then thenBlock: () -> [JS], @JSBuilder else elseBlock: () -> [JS]) -> JSStatement {
    let thenStatements = thenBlock().compactMap { $0 as? JSStatement }
    let elseStatements = elseBlock().compactMap { $0 as? JSStatement }
    return .if(condition, thenStatements, elseStatements)
}

/// Create if statement without else block
public func `if`(_ condition: any JSValue, @JSBuilder then thenBlock: () -> [JS]) -> JSStatement {
    let thenStatements = thenBlock().compactMap { $0 as? JSStatement }
    return .if(condition, thenStatements, nil)
}

/// Create async function
public func asyncFunction(_ name: String, _ params: [JSIdentifier], @JSBuilder _ body: () -> [JS]) -> JSStatement {
    let statements = body().compactMap { $0 as? JSStatement }
    let paramNames = params.map { param in
        if case .identifier(let name) = param.expression {
            return name
        }
        return param.expression.render()
    }
    return .asyncFunction(name, paramNames, statements)
}

/// Try-catch intermediate for beautiful chaining syntax
public struct JSTryCatch {
    let tryStatements: [JSStatement]

    public func `catch`(_ catchVar: String, @JSBuilder _ catchBody: () -> [JS]) -> JSStatement {
        let catchStatements = catchBody().compactMap { $0 as? JSStatement }
        return .tryBlock(tryStatements, catchVar, catchStatements)
    }

    public func `catch`(_ catchVar: JSIdentifier, @JSBuilder _ catchBody: () -> [JS]) -> JSStatement {
        let catchStatements = catchBody().compactMap { $0 as? JSStatement }
        if case .identifier(let varName) = catchVar.expression {
            return .tryBlock(tryStatements, varName, catchStatements)
        }
        return .tryBlock(tryStatements, catchVar.expression.render(), catchStatements)
    }
}

/// Create try-catch block with beautiful syntax: `try` { ... }.catch("e") { ... }
public func `try`(@JSBuilder _ body: () -> [JS]) -> JSTryCatch {
    let tryStatements = body().compactMap { $0 as? JSStatement }
    return JSTryCatch(tryStatements: tryStatements)
}

/// Create try-catch block (function call syntax with labeled argument)
public func `try`(@JSBuilder _ body: () -> [JS], catch catchVar: String, @JSBuilder _ catchBody: () -> [JS]) -> JSStatement {
    let tryStatements = body().compactMap { $0 as? JSStatement }
    let catchStatements = catchBody().compactMap { $0 as? JSStatement }
    return .tryBlock(tryStatements, catchVar, catchStatements)
}

/// Create IIFE (Immediately Invoked Function Expression)
public func iife(@JSBuilder _ body: () -> [JS]) -> JSStatement {
    let statements = body().compactMap { $0 as? JSStatement }
    return .iife(statements)
}

/// Create for loop with string syntax (deprecated - use DSL version)
public func `for`(_ initializer: String, _ condition: any JSValue, _ increment: String, @JSBuilder _ body: () -> [JS]) -> JSStatement {
    let statements = body().compactMap { $0 as? JSStatement }
    return .for(initializer, condition, increment, statements)
}

/// Create for loop with beautiful DSL: `for`(let.i |= 0, i < count, i++) { ... }
public func `for`(_ initializer: JSStatement, _ condition: any JSValue, _ increment: any JSValue, @JSBuilder _ body: () -> [JS]) -> JSStatement {
    let statements = body().compactMap { $0 as? JSStatement }
    let initString = initializer.render(indent: 0).trimmingCharacters(in: .whitespacesAndNewlines).replacingOccurrences(of: ";", with: "")
    let incrementString = increment.expression.render(indent: 0)
    return .for(initString, condition, incrementString, statements)
}

/// Create while loop: `while`(condition) { ... }
public func `while`(_ condition: any JSValue, @JSBuilder _ body: () -> [JS]) -> JSStatement {
    let statements = body().compactMap { $0 as? JSStatement }
    return .while(condition, statements)
}

public func constDestructure(_ names: [JSIdentifier], _ value: any JSValue) -> JSStatement {
    .constDestructure(names, value.expression)
}

public func call(_ funcName: String, _ args: [any JSValue]) -> JSStatement {
    .expression(.call(funcName, args.map(\.expression)))
}

public func `throw`(_ expr: any JSValue) -> JSStatement {
    .expression(.throwExpression(expr.expression))
}

public func |= (lhs: JSConstDeclarator, rhs: any JSValue) -> JSStatement {
	.const(JSIdentifier(lhs.constName), rhs)
}

public func |= (lhs: JSLetDeclarator, rhs: any JSValue) -> JSStatement {
	.`let`(JSIdentifier(lhs.letName), rhs)
}

public func |= (lhs: JSVarDeclarator, rhs: any JSValue) -> JSStatement {
	.`var`(JSIdentifier(lhs.name), rhs)
}

#endif
