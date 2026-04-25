import DOMBuilder
import EmbeddedSwiftUtilities
import HTMLBuilder
import WebTypes

@resultBuilder
public struct SVGBuilder {
  public static func buildBlock(_ components: [Node]...) -> [Node] {
    var result = [Node]()
    for component in components {
      result.append(contentsOf: component)
    }
    return result
  }

  public static func buildExpression(_ string: String) -> [Node] {
    [Text(string)]
  }

  public static func buildExpression(_ node: Node) -> [Node] {
    [node]
  }

  @_disfavoredOverload
  public static func buildExpression(_ convertible: some NodeConvertible) -> [Node] {
    [convertible.render()]
  }

  public static func buildExpression(_ nodes: [Node]) -> [Node] {
    nodes
  }

  public static func buildOptional(_ component: [Node]?) -> [Node] {
    component ?? []
  }

  public static func buildEither(first component: [Node]) -> [Node] {
    component
  }

  public static func buildEither(second component: [Node]) -> [Node] {
    component
  }

  public static func buildArray(_ components: [[Node]]) -> [Node] {
    components.flatMap { $0 }
  }

  public static func buildLimitedAvailability(_ component: [Node]) -> [Node] {
    component
  }

  public static func render(@SVGBuilder _ content: () -> [Node]) -> [Node] {
    content()
  }

  /// Helper for generating raw SVG strings.
  public static func build(@SVGBuilder _ content: () -> [Node]) -> String {
    let items = content()
    var result = ""
    for (index, item) in items.enumerated() {
      result = "\(result)\(item.build(indent: 0))"
      if index < items.count - 1 {
        result = "\(result)\n"
      }
    }
    return result
  }
}

public func buildSVG(@SVGBuilder _ content: () -> [Node]) -> String {
  SVGBuilder.build(content)
}
