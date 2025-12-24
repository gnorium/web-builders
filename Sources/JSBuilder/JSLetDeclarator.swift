#if !os(WASI)

@dynamicMemberLookup
public struct JSLetDeclarator: Sendable, JS {
    let letName: String

    public subscript(dynamicMember member: String) -> JSLetDeclarator {
        JSLetDeclarator(letName: member)
    }

    public func render(indent: Int) -> String {
        JSStatement.`let`(JSIdentifier(letName), nil).render(indent: indent)
    }
}

public let `let` = JSLetDeclarator(letName: "")

#endif
