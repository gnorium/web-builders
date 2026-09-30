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

  /// A `String` value—a variable, a computed label, a database cell—is text
  /// and is escaped. Emitting it as markup let any value carrying angle
  /// brackets close the elements around it: a tool dump containing
  /// `</body></text></TEI>` reparented an entire transcript and stretched the
  /// page to 15,000px.
  ///
  /// Disfavored so that a literal written in the builder resolves to
  /// `HTMLText` below, whose interpolation keeps `"\(em("x")) rest"` as markup.
  @_disfavoredOverload
  public static func buildExpression(_ string: String) -> [DOM.Node] {
    [DOM.Text(string)]
  }

  /// A literal written in the builder: its text is escaped, and an element
  /// interpolated into it—`"\(em("Gnorium")) is …"`—stays markup.
  public static func buildExpression(_ text: HTMLText) -> [DOM.Node] {
    [text]
  }

  public static func buildExpression(_ node: DOM.Node) -> [DOM.Node] {
    [node]
  }

  @_disfavoredOverload
  public static func buildExpression(_ convertible: some DOMNodeConvertible) -> [DOM.Node] {
    [convertible.build()]
  }

  /// Disfavored for the same reason as `String`: `JSON` is also expressible
  /// by a string literal, and a bare literal in the builder is text.
  @_disfavoredOverload
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
