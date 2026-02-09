#if !os(WASI)


public struct JSUint8Array: JSValueProtocol {
    let args: [JSExpression]

    public init(_ args: any JSValueProtocol...) {
        self.args = args.map(\.expression)
    }

    public var expression: JSExpression {
        .new("Uint8Array", args)
    }
}


#endif
