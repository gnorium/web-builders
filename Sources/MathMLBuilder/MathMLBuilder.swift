import DOMBuilder
import WebTypes

/// Builds a MathML element's children: MathML elements, and, inside a token
/// element (`mi`, `mn`, `mo`, `ms`, `mtext`), text and HTML phrasing content.
@resultBuilder
public struct MathMLBuilder {
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
}
