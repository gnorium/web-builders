import DOMBuilder
import WebTypes

public protocol HTMLContent: DOMNodeConvertible {
  var nodeType: HTML.NodeType { get }
  var textContent: String? { get }
}

extension HTMLContent {
  public var nodeType: HTML.NodeType { .elementNode }
  /// Content a node carries of itself—nil for everything but a text node.
  ///
  /// On the client `DOM.Element` also has a `textContent: String` that asks the
  /// live DOM. Writing `element.textContent ?? ""` there types the expression as
  /// Optional and so selects THIS default, which answers nil for every element:
  /// a streamed reasoning block lost everything written before its latest chunk
  /// because the appender read the text so far and was told there was none.
  /// Client code reads `element.textContent` with no `??`.
  public var textContent: String? { nil }
}

extension DOM.Node: HTMLContent {
  public var inferredTextContent: String? { (self as? DOM.Text)?.content }
}
