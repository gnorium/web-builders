#if !os(WASI)

@dynamicMemberLookup
public struct JSVarDeclarator: Sendable, JS {
    public let name: String

    public subscript(dynamicMember member: String) -> JSVarDeclarator {
        JSVarDeclarator(name: member)
    }

    public func render(indent: Int) -> String {
        JSStatement.`var`(JSIdentifier(name), nil).render(indent: indent)
    }
}

public let `var` = JSVarDeclarator(name: "")

#endif
