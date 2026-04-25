import EmbeddedSwiftUtilities
import JSONImportMapFormat
import JSONLDFormat

@resultBuilder
public struct JSBuilder: Sendable {
  public static func buildBlock(_ components: [JSStatement]...) -> [JSStatement] {
    var result: [JSStatement] = []
    for component in components {
      result.append(contentsOf: component)
    }
    return result
  }

  public static func buildBlock(_ component: [JSStatement]) -> [JSStatement] { component }
  public static func buildArray(_ components: [JSStatement]) -> [JSStatement] { components }
  public static func buildArray(_ components: [[JSStatement]]) -> [JSStatement] {
    components.flatMap { $0 }
  }
  public static func buildOptional(_ component: [JSStatement]?) -> [JSStatement] { component ?? [] }
  public static func buildEither(first component: [JSStatement]) -> [JSStatement] { component }
  public static func buildEither(second component: [JSStatement]) -> [JSStatement] { component }

  public static func buildExpression(_ expression: JSStatement) -> [JSStatement] { [expression] }
  public static func buildExpression(_ expression: JSExpression) -> [JSStatement] {
    [.expression(expression)]
  }
  public static func buildExpression(_ expression: [JSStatement]) -> [JSStatement] { expression }
  public static func buildExpression(_ expression: String) -> [JSStatement] { [.raw(expression)] }
  #if SERVER
    public static func buildExpression(_ expression: JSONLD) -> [JSStatement] {
      [.raw(expression.format())]
    }
    public static func buildExpression(_ expression: JSONImportMap) -> [JSStatement] {
      [.raw(expression.format())]
    }

  #endif

  /// Helper for generating the JavaScript model.
  public static func render(@JSBuilder _ content: () -> [JSStatement]) -> JSStatement {
    .block(content())
  }

  /// Helper for generating raw JavaScript strings.
  public static func build(indent: Int = 0, @JSBuilder _ content: () -> [JSStatement]) -> String {
    let items = content()
    var result = ""
    for (index, item) in items.enumerated() {
      result = "\(result)\(item.build(indent: indent))"
      if index < items.count - 1 {
        result = "\(result)\n"
      }
    }
    return result
  }
}

/// Helper for generating raw JavaScript strings.
public func buildJS(@JSBuilder _ content: () -> [JSStatement]) -> String {
  JSBuilder.build(content)
}
