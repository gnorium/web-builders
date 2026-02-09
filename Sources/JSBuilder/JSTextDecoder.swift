#if !os(WASI)


public struct TextDecoder: JSValueProtocol {
	public init() {}

    public var expression: JSExpression {
        .new("TextDecoder", [])
    }

    public func decode(_ bytes: any JSValueProtocol) -> JSIdentifier {
        JSIdentifier(expression: .methodCall(.new("TextDecoder", []), "decode", [bytes.expression]))
    }
}


#endif
