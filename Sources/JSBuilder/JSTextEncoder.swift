#if !os(WASI)


public struct TextEncoder: JSValueProtocol {
    public init() {}

    public var expression: JSExpression {
        .new("TextEncoder", [])
    }

    public func encode(_ str: any JSValueProtocol) -> JSIdentifier {
        JSIdentifier(expression: .methodCall(.new("TextEncoder", []), "encode", [str.expression]))
    }
}


#endif
