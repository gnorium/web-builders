#if !os(WASI)

@dynamicMemberLookup
public struct JSConstDeclarator: Sendable {
    let constName: String

    public subscript(dynamicMember member: String) -> JSConstDeclarator {
        JSConstDeclarator(constName: member)
    }
}

public let const = JSConstDeclarator(constName: "")

#endif
