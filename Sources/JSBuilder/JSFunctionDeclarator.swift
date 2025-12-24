#if !os(WASI)

@dynamicMemberLookup
public struct JSFunctionDeclarator: Sendable {
    let isAsync: Bool

    public subscript(dynamicMember name: String) -> JSFunctionSyntax {
        JSFunctionSyntax(name: name, isAsync: isAsync)
    }
}

/// Global instance for beautiful syntax: func.myFunction("param1", "param2") { ... }
public let `func` = JSFunctionDeclarator(isAsync: false)

/// Global instance for async functions: async.myFunction("param1", "param2") { ... }
public let `async` = JSFunctionDeclarator(isAsync: true)

#endif
