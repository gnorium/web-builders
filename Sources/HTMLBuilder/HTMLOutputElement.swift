import CSSBuilder
import WebTypes
import DOMBuilder

public struct HTMLOutputElement: HTMLElementRenderable, Sendable, CustomStringConvertible {
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
        .element(ns: .html, tag: "output", attributes: attributes, children: children)
    }

public func render(indent: Int = 0) -> String {
        let ind = String(repeating: "  ", count: indent)
        let attributeString = renderAttributes()
        let openElement = "<output\(attributeString)>"
        let closeElement = "</output>"

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

    public func callAsFunction(@HTMLBuilder content: () -> [DOMNode]) -> HTMLOutputElement {
        HTMLOutputElement(attributes: attributes, children: content())
    }

    public func addingAttribute(_ key: String, _ value: String) -> HTMLOutputElement {
        var newAttributes = attributes
        newAttributes.removeAll { $0.0 == key }
        newAttributes.append((key, value))
        return HTMLOutputElement(attributes: newAttributes, children: children)
    }

}

extension HTMLOutputElement {
    public func `for`(_ value: String) -> HTMLOutputElement {
        addingAttribute("for", value)
    }

    public func form(_ value: String) -> HTMLOutputElement {
        addingAttribute("form", value)
    }

    public func name(_ value: String) -> HTMLOutputElement {
        addingAttribute("name", value)
    }
}

public func output(@HTMLBuilder content: () -> [DOMNode] = { [] }) -> HTMLOutputElement { HTMLOutputElement(content: content) }
public func output(_ text: String) -> HTMLOutputElement { HTMLOutputElement(text) }
