import WebTypes

/// The shared core result builder for all DOM-like content.
@resultBuilder
public struct DOMBuilder {
  public static func buildBlock(_ components: [Node]...) -> [Node] {
    components.flatMap { $0 }
  }

  public static func buildExpression(_ node: Node) -> [Node] {
    [node]
  }

  public static func buildExpression(_ string: String) -> [Node] {
    [Text(string)]
  }

  public static func buildExpression(_ expression: ()) -> [Node] {
    []
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

  public static func buildFinalResult(_ components: [Node]) -> [Node] {
    components
  }

  public static func buildFinalResult(_ components: [Node]) -> Node {
    if components.count == 1 { return components[0] }
    return DocumentFragment(components)
  }
}
