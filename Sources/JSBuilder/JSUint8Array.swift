public struct JSUint8Array: JSValue {
  let args: [JSExpression]

  public init(_ args: JSExpression...) {
    self.args = args
  }

  public var expression: JSExpression {
    .new("Uint8Array", args)
  }
}
