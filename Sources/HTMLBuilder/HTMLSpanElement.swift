import CSSBuilder
import DOMBuilder

public struct HTMLSpanElement: HTMLElementRenderable, Sendable, CustomStringConvertible {
    public let attributes: [(String, String)]
    let children: [DOMNode]

    public init(@HTMLBuilder content: () -> [DOMNode] = { [] }) {
        self.attributes = []
        self.children = content()
    }

    private init(attributes: [(String, String)], children: [DOMNode]) {
        self.attributes = attributes
        self.children = children
    }

        public func toNode() -> DOMNode {
        .element(ns: .html, tag: "span", attributes: attributes, children: children)
    }

public func render(indent: Int = 0) -> String {
        let attributeString = renderAttributes()
        let openElement = "<span\(attributeString)>"
        let closeElement = "</span>"

        guard !children.isEmpty else {
            return openElement + closeElement
        }

        var inner = ""
        for child in children {
            inner += child.render(indent: 0)
        }
        return openElement + inner + closeElement
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

    public func callAsFunction(@HTMLBuilder content: () -> [DOMNode]) -> HTMLSpanElement {
        HTMLSpanElement(attributes: attributes, children: content())
    }

    public func addingAttribute(_ key: String, _ value: String) -> HTMLSpanElement {
        var newAttributes = attributes
        newAttributes.removeAll { $0.0 == key }
        newAttributes.append((key, value))
        return HTMLSpanElement(attributes: newAttributes, children: children)
    }

}

public func span(@HTMLBuilder content: () -> [DOMNode] = { [] }) -> HTMLSpanElement { HTMLSpanElement(content: content) }
