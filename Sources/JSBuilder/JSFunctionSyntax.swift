public struct JSFunctionSyntax: Sendable {
    let name: String
    let isAsync: Bool

    public func callAsFunction(_ params: JSIdentifier..., @JSBuilder body: () -> [AnyJSContent]) -> JSStatement {
        let content = body()
        let paramNames = params.map { param in
            if case .identifier(let name) = param.expression {
                return name
            }
            return param.expression.render()
        }
        return isAsync ? .asyncFunction(name, paramNames, content) : .function(name, paramNames, content)
    }
}
