#if !os(WASI)

@dynamicMemberLookup
public struct JSNew: Sendable {
    public subscript(dynamicMember className: String) -> JSConstructorCall {
        JSConstructorCall(className: className)
    }
}

public let new = JSNew()

#endif
