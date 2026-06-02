import DOMBuilder
import EmbeddedSwiftUtilities
import JSONFormat
import JSONImportMapFormat
import JSONLDFormat
import WebTypes

@resultBuilder
public struct HTMLBuilder {
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

  public static func buildExpression(_ json: JSON) -> [DOM.Node] {
    [DOM.Text(json.format(), isRaw: true)]
  }

  public static func buildExpression(_ jsonLD: JSONLD) -> [DOM.Node] {
    [DOM.Text(jsonLD.format(), isRaw: true)]
  }

  public static func buildExpression(_ importMap: JSONImportMap) -> [DOM.Node] {
    [DOM.Text(importMap.format(), isRaw: true)]
  }

  public static func buildExpression(_ nodes: [DOM.Node]) -> [DOM.Node] {
    nodes
  }

  public static func buildExpression<T: HTMLContent>(_ contents: [T]) -> [DOM.Node] {
    contents.map { $0.build() }
  }

  public static func buildExpression(_ content: some HTMLContent) -> [DOM.Node] {
    [content.build()]
  }
  
  public static func buildExpression(_ expression: ()) -> [DOM.Node] {
    []
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

  public static func render(@HTMLBuilder _ content: () -> [DOM.Node]) -> [DOM.Node] {
    content()
  }

  /// Helper for generating raw HTML strings.
  public static func render(@HTMLBuilder _ content: () -> [DOM.Node]) -> String {
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

public func renderHTML(@HTMLBuilder _ content: () -> [DOM.Node]) -> String {
  HTMLBuilder.render(content)
}
