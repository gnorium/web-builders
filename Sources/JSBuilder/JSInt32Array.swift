public struct Int32Array: JSValue {
    let args: [JSExpression]

    public init(_ args: JSExpression...) {
        self.args = args
    }

    public var expression: JSExpression {
        .new("Int32Array", args)
    }
}
