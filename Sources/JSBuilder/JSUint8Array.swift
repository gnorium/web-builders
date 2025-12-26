#if !os(WASI)


public struct JSUint8Array: JSValue {
    let args: [JSExpression]

    public init(_ args: any JSValue...) {
        self.args = args.map(\.expression)
    }

    public var expression: JSExpression {
        .new("Uint8Array", args)
    }
}


#endif
