import WebTypes

extension CSS.Display.Outside: JSValue {
  public var expression: JSExpression {
    .string(rawValue)
  }
}

extension CSS.Display.Inside: JSValue {
  public var expression: JSExpression {
    .string(rawValue)
  }
}

extension CSS.Display.Legacy: JSValue {
  public var expression: JSExpression {
    .string(rawValue)
  }
}
