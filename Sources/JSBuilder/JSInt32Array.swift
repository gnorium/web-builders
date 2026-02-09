#if !os(WASI)

public struct Int32Array: JSValueProtocol {
    let args: [JSExpression]

    public init(_ args: any JSValueProtocol...) {
        self.args = args.map(\.expression)
    }

    public var expression: JSExpression {
        .new("Int32Array", args)
    }
}

#endif
