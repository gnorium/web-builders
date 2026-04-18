import CSSBuilder
import WebTypes
import DOMBuilder

public struct HTMLLegendElement: HTMLElementRenderable, Sendable, CustomStringConvertible {
    public let attributes: [(String, String)]
    let children: [DOMNode]

    public init(@HTMLBuilder content: () -> [DOMNode] = { [] }) {
        self.attributes = []
        self.children = content()
    }

    public init(_ text: String) {
        self.attributes = []
        self.children = [HTMLText(content: text).toNode()]
    }

    private init(attributes: [(String, String)], children: [DOMNode]) {
        self.attributes = attributes
        self.children = children
    }

        public func toNode() -> DOMNode {
        .element(ns: .html, tag: "legend", attributes: attributes, children: children)
    }

public func render(indent: Int = 0) -> String {
        let ind = String(repeating: "  ", count: indent)
        let attributeString = renderAttributes()
        let openElement = "<legend\(attributeString)>"
        let closeElement = "</legend>"

        guard !children.isEmpty else {
            return ind + openElement + closeElement
        }

        var inner = ""
        for child in children {
            inner += child.render(indent: 0)
        }
        
        return ind + openElement + inner + closeElement
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

    public func callAsFunction(@HTMLBuilder content: () -> [DOMNode]) -> HTMLLegendElement {
        HTMLLegendElement(attributes: attributes, children: content())
    }

    public func addingAttribute(_ key: String, _ value: String) -> HTMLLegendElement {
        var newAttributes = attributes
        newAttributes.removeAll { $0.0 == key }
        newAttributes.append((key, value))
        return HTMLLegendElement(attributes: newAttributes, children: children)
    }

}

public func legend(@HTMLBuilder content: () -> [DOMNode] = { [] }) -> HTMLLegendElement { HTMLLegendElement(content: content) }
public func legend(_ text: String) -> HTMLLegendElement { HTMLLegendElement(text) }
