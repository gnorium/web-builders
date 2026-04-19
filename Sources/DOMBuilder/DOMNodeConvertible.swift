/// A generic handshake protocol that allows specialized elements (HTML, SVG)
/// to be flattened into a unified DOMNode representation.
public protocol DOMNodeConvertible: Sendable {
    func render() -> DOMNode
}

extension DOMNodeConvertible {
    public func serialize(indent: Int = 0) -> String {
        render().serialize(indent: indent)
    }
}
