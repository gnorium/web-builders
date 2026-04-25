#if CLIENT
  import EmbeddedSwiftUtilities
#endif

public struct TextEncoder: JSValue {
  public init() {}

  public var expression: JSExpression {
    .new("TextEncoder", [])
  }

  public func encode(_ str: JSExpression) -> JSIdentifier {
    identifier("\(self.expression.build()).encode(\(str.build()))")
  }
}
