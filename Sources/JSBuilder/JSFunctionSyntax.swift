#if !os(WASI)

public struct JSFunctionSyntax: Sendable {
    let name: String
    let isAsync: Bool

    public func callAsFunction(_ params: JSIdentifier..., @JSBuilder body: () -> [JS]) -> JSStatement {
        let statements = body().compactMap { $0 as? JSStatement }
        let paramNames = params.map { param in
            if case .identifier(let name) = param.expression {
                return name
            }
            return param.expression.render()
        }
        return isAsync ? .asyncFunction(name, paramNames, statements) : .function(name, paramNames, statements)
    }
}

#endif
