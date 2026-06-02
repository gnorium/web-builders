import WebTypes

extension CSS.Keyword.None: JSValue {
  public var expression: JSExpression {
    .string(rawValue)
  }
}

extension CSS.Keyword.Auto: JSValue {
  public var expression: JSExpression {
    .string(rawValue)
  }
}

extension CSS.Keyword.All: JSValue {
  public var expression: JSExpression {
    .string(rawValue)
  }
}

extension CSS.Keyword.Length: JSValue {
  public var expression: JSExpression {
    .string(rawValue)
  }
}

extension CSS.Keyword.Global: JSValue {
  public var expression: JSExpression {
    .string(rawValue)
  }
}
