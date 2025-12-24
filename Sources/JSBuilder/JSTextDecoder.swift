#if !os(WASI)


public struct TextDecoder: JSValue {
	public init() {}

    public var expression: JSExpression {
        .new("TextDecoder", [])
    }

    public func decode(_ bytes: JSValue) -> JSIdentifier {
        JSIdentifier(expression: .methodCall(.new("TextDecoder", []), "decode", [bytes.expression]))
    }
}


#endif
