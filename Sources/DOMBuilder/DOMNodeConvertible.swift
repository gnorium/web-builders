/// A generic handshake protocol that allows specialized elements (HTML, SVG)
/// to be flattened into a unified DOMNode representation.
public protocol DOMNodeConvertible: Sendable {
    func toNode() -> DOMNode
}

extension DOMNodeConvertible {
    public func render(indent: Int = 0) -> String {
        toNode().render(indent: indent)
    }
}
