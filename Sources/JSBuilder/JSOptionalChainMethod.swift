/// Helper struct for optional chaining method calls
public struct JSOptionalChainMethod {
    let object: JSExpression
    let method: String

    public func callAsFunction(_ args: JSExpression...) -> JSExpression {
        .optionalChain(object, method, args)
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