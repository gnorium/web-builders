import EmbeddedSwiftUtilities
import WebTypes

@resultBuilder
public struct XMLBuilder {
  public static func buildBlock(_ components: [XML.Element]...) -> [XML.Element] {
    var result = [XML.Element]()
    for c in components { result.append(contentsOf: c) }
    return result
  }

  public static func buildExpression(_ element: XML.Element) -> [XML.Element] { [element] }

  public static func buildExpression(_ string: String) -> [XML.Element] { [XML.Text(string)] }
  public static func buildExpression(_ elements: [XML.Element]) -> [XML.Element] { elements }
  public static func buildArray(_ components: [[XML.Element]]) -> [XML.Element] { components.flatMap { $0 } }
  public static func buildOptional(_ component: [XML.Element]?) -> [XML.Element] { component ?? [] }
}

public func element(_ name: String, attributes: [(String, String)] = [], @XMLBuilder _ content: () -> [XML.Element] = { [] }) -> XML.Element {
  let el = XML.Element(name: name, attributes: attributes)
  el.children = content()
  return el
}

public func element(_ name: String, text: String) -> XML.Element {
  XML.Element(name: name, text: text)
}

public func element(_ name: String, attributes: [(String, String)] = [], text: String) -> XML.Element {
  XML.Element(name: name, attributes: attributes, text: text)
}
