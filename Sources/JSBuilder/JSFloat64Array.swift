public struct JSFloat64Array: JSValue {
  let args: [JSExpression]

  public init(_ args: JSExpression...) {
    self.args = args
  }

  public var expression: JSExpression {
    .new("Float64Array", args)
  }
}
