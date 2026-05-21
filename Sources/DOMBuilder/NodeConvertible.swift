/// A generic handshake protocol that allows specialized elements (HTML, SVG)
/// to be flattened into a unified Node representation.
public protocol NodeConvertible: Sendable {
  @DOMBuilder func build() -> Node
}

extension NodeConvertible {
  public func render(indent: Int = 0) -> String {
    build().render(indent: indent)
  }
}

extension Array: NodeConvertible where Element == Node {
  public func build() -> Node {
    DocumentFragment(self)
  }
}

extension Array where Element == Node {
  public var fragment: Node {
    DocumentFragment(self)
  }
}
