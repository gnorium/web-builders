import WebTypes

/// A generic handshake protocol that allows specialized elements (HTML, SVG)
/// to be flattened into a unified Node representation.
public protocol DOMNodeConvertible: Sendable {
  @DOMBuilder func build() -> DOM.Node
}

extension DOMNodeConvertible {
  public func render(indent: Int = 0) -> String {
    build().render(indent: indent)
  }
}

extension Array: DOMNodeConvertible where Element == DOM.Node {
  public func build() -> DOM.Node {
    DOM.DocumentFragment(self)
  }
}

extension Array where Element == DOM.Node {
  public var fragment: DOM.Node {
    DOM.DocumentFragment(self)
  }
}
