#if !os(WASI)

public struct Map: JSValue {
    public init() {}

    public var expression: JSExpression {
        .new("Map", [])
    }
}

#endif
