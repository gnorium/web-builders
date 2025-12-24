#if !os(WASI)

public struct Int32Array: JSValue {
    let args: [JSExpression]

    public init(_ args: JSValue...) {
        self.args = args.map(\.expression)
    }

    public var expression: JSExpression {
        .new("Int32Array", args)
    }
}

#endif
