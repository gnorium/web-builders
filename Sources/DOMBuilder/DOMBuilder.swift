import WebTypes

/// The shared core result builder for all DOM-like content.
@resultBuilder
public struct DOMBuilder {
  public static func buildBlock(_ components: [DOM.Node]...) -> [DOM.Node] {
    components.flatMap { $0 }
  }

  public static func buildExpression(_ node: DOM.Node) -> [DOM.Node] {
    [node]
  }

  public static func buildExpression(_ string: String) -> [DOM.Node] {
    [DOM.Text(string)]
  }

  public static func buildExpression(_ expression: ()) -> [DOM.Node] {
    []
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

  public static func buildFinalResult(_ components: [DOM.Node]) -> [DOM.Node] {
    components
  }

  public static func buildFinalResult(_ components: [DOM.Node]) -> DOM.Node {
    if components.count == 1 { return components[0] }
    return DOM.DocumentFragment(components)
  }
}
