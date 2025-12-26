#if !os(WASI)


public struct TextEncoder: JSValue {
    public init() {}

    public var expression: JSExpression {
        .new("TextEncoder", [])
    }

    public func encode(_ str: any JSValue) -> JSIdentifier {
        JSIdentifier(expression: .methodCall(.new("TextEncoder", []), "encode", [str.expression]))
    }
}


#endif
