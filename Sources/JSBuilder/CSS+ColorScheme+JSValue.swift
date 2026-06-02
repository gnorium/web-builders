import WebTypes

extension CSS.ColorScheme: JSValue {
  public var expression: JSExpression {
    .string(rawValue)
  }
}
