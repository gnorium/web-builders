/// A generic handshake protocol that allows specialized elements (HTML, SVG)
/// to be flattened into a unified Node representation.
public protocol NodeConvertible: Sendable {
  @DOMBuilder func render() -> Node
}

extension NodeConvertible {
  public func build(indent: Int = 0) -> String {
    render().build(indent: indent)
  }
}

extension Array: NodeConvertible where Element == Node {
  public func render() -> Node {
    DocumentFragment(self)
  }
}

extension Array where Element == Node {
  public var fragment: Node {
    DocumentFragment(self)
  }
}
