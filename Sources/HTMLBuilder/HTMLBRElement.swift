import CSSBuilder
import DOMBuilder

public struct HTMLBRElement: HTMLElementRenderable, Sendable, CustomStringConvertible {
    public let attributes: [(String, String)]

    public init() {
        self.attributes = []
    }

    private init(attributes: [(String, String)]) {
        self.attributes = attributes
    }

        public func toNode() -> DOMNode {
        .element(ns: .html, tag: "br", attributes: attributes, children: [])
    }

public func render(indent: Int = 0) -> String {
        let attributeString = renderAttributes()
        return "<br\(attributeString)>"
    }

    private func renderAttributes() -> String {
        guard !attributes.isEmpty else { return "" }
        return " " + attributes
            .map { "\($0.0)=\"\(escapeHTMLAttributeValue($0.1))\"" }
            .joinedString(separator: " ")
    }

    public var description: String {
        render(indent: 0)
    }

    public func addingAttribute(_ key: String, _ value: String) -> HTMLBRElement {
        var newAttributes = attributes
        newAttributes.removeAll { $0.0 == key }
        newAttributes.append((key, value))
        return HTMLBRElement(attributes: newAttributes)
    }

}

public func br() -> HTMLBRElement { HTMLBRElement() }
