import DOMBuilder
import WebTypes

public protocol HTMLContent: DOMNodeConvertible {
  var nodeType: HTML.NodeType { get }
  var textContent: String? { get }
}

extension HTMLContent {
  public var nodeType: HTML.NodeType { .elementNode }
  public var textContent: String? { nil }
}

extension DOM.Node: HTMLContent {
  public var inferredTextContent: String? { (self as? DOM.Text)?.content }
}
