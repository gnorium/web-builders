#if CLIENT
  import EmbeddedSwiftUtilities
#endif

public struct TextDecoder: JSValue {
  public init() {}

  public var expression: JSExpression {
    .new("TextDecoder", [])
  }

  public func decode(_ bytes: JSExpression) -> JSIdentifier {
    identifier("\(self.expression.build()).decode(\(bytes.build()))")
  }
}
