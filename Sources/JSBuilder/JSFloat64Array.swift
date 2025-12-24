#if !os(WASI)

public struct JSFloat64Array: JSValue {
    let args: [JSExpression]

    public init(_ args: JSValue...) {
        self.args = args.map(\.expression)
    }

    public var expression: JSExpression {
        .new("Float64Array", args)
    }
}

#endif
