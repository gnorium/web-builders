import DOMBuilder
import EmbeddedSwiftUtilities
import JSONFormat
import JSONImportMapFormat
import JSONLDFormat
import WebTypes

@resultBuilder
public struct HTMLBuilder {
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

  public static func buildExpression(_ json: JSON) -> [Node] {
    [Text(json.format(), isRaw: true)]
  }

  public static func buildExpression(_ jsonLD: JSONLD) -> [Node] {
    [Text(jsonLD.format(), isRaw: true)]
  }

  public static func buildExpression(_ importMap: JSONImportMap) -> [Node] {
    [Text(importMap.format(), isRaw: true)]
  }

  public static func buildExpression(_ nodes: [Node]) -> [Node] {
    nodes
  }

  public static func buildExpression<T: HTMLContent>(_ contents: [T]) -> [Node] {
    contents.map { $0.render() }
  }

  public static func buildExpression(_ content: some HTMLContent) -> [Node] {
    [content.render()]
  }
  
  public static func buildExpression(_ expression: ()) -> [Node] {
    []
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

  public static func render(@HTMLBuilder _ content: () -> [Node]) -> [Node] {
    content()
  }

  /// Helper for generating raw HTML strings.
  public static func build(@HTMLBuilder _ content: () -> [Node]) -> String {
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

public func buildHTML(@HTMLBuilder _ content: () -> [Node]) -> String {
  HTMLBuilder.build(content)
}
