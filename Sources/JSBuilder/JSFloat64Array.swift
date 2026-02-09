#if !os(WASI)

public struct JSFloat64Array: JSValueProtocol {
    let args: [JSExpression]

    public init(_ args: any JSValueProtocol...) {
        self.args = args.map(\.expression)
    }

    public var expression: JSExpression {
        .new("Float64Array", args)
    }
}

#endif
