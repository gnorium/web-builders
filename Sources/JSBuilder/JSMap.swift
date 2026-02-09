#if !os(WASI)

public struct Map: JSValueProtocol {
    public init() {}

    public var expression: JSExpression {
        .new("Map", [])
    }
}

#endif
