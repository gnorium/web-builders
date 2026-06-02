import DOMBuilder
import EmbeddedSwiftUtilities
import HTMLBuilder
import WebTypes

@resultBuilder
public struct SVGBuilder {
  public static func buildBlock(_ components: [DOM.Node]...) -> [DOM.Node] {
    var result = [DOM.Node]()
    for component in components {
      result.append(contentsOf: component)
    }
    return result
  }

  public static func buildExpression(_ string: String) -> [DOM.Node] {
    [DOM.Text(string)]
  }

  public static func buildExpression(_ node: DOM.Node) -> [DOM.Node] {
    [node]
  }

  @_disfavoredOverload
  public static func buildExpression(_ convertible: some DOMNodeConvertible) -> [DOM.Node] {
    [convertible.build()]
  }

  public static func buildExpression(_ nodes: [DOM.Node]) -> [DOM.Node] {
    nodes
  }

  public static func buildOptional(_ component: [DOM.Node]?) -> [DOM.Node] {
    component ?? []
  }

  public static func buildEither(first component: [DOM.Node]) -> [DOM.Node] {
    component
  }

  public static func buildEither(second component: [DOM.Node]) -> [DOM.Node] {
    component
  }

  public static func buildArray(_ components: [[DOM.Node]]) -> [DOM.Node] {
    components.flatMap { $0 }
  }

  public static func buildLimitedAvailability(_ component: [DOM.Node]) -> [DOM.Node] {
    component
  }

  public static func render(@SVGBuilder _ content: () -> [DOM.Node]) -> [DOM.Node] {
    content()
  }

  /// Helper for generating raw SVG strings.
  public static func render(@SVGBuilder _ content: () -> [DOM.Node]) -> String {
    let items = content()
    var result = ""
    for (index, item) in items.enumerated() {
      result = "\(result)\(item.render(indent: 0))"
      if index < items.count - 1 {
        result = "\(result)\n"
      }
    }
    return result
  }
}

public func renderSVG(@SVGBuilder _ content: () -> [DOM.Node]) -> String {
  SVGBuilder.render(content)
}
