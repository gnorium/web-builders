import DOMBuilder
import WebTypes

public protocol HTMLContent: NodeConvertible {
  var nodeType: HTMLNodeType { get }
  var textContent: String? { get }
}

extension HTMLContent {
  public var nodeType: HTMLNodeType { .elementNode }
  public var textContent: String? { nil }
}

extension Node: HTMLContent {
  public var inferredTextContent: String? { (self as? Text)?.content }
}
