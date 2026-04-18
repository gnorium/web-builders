import CSSBuilder
import WebTypes
import DOMBuilder

public struct HTMLObjectElement: HTMLElementRenderable, Sendable, CustomStringConvertible {
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
        .element(ns: .html, tag: "object", attributes: attributes, children: children)
    }

public func render(indent: Int = 0) -> String {
        let ind = String(repeating: "  ", count: indent)
        let attributeString = renderAttributes()
        let openElement = "<object\(attributeString)>"
        let closeElement = "</object>"

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

    public func callAsFunction(@HTMLBuilder content: () -> [DOMNode]) -> HTMLObjectElement {
        HTMLObjectElement(attributes: attributes, children: content())
    }

    public func addingAttribute(_ key: String, _ value: String) -> HTMLObjectElement {
        var newAttributes = attributes
        newAttributes.removeAll { $0.0 == key }
        newAttributes.append((key, value))
        return HTMLObjectElement(attributes: newAttributes, children: children)
    }

}

extension HTMLObjectElement {
    public func data(_ value: String) -> HTMLObjectElement {
        addingAttribute("data", value)
    }

    public func type(_ value: String) -> HTMLObjectElement {
        addingAttribute("type", value)
    }

    public func name(_ value: String) -> HTMLObjectElement {
        addingAttribute("name", value)
    }

    public func usemap(_ value: String) -> HTMLObjectElement {
        addingAttribute("usemap", value)
    }

    public func form(_ value: String) -> HTMLObjectElement {
        addingAttribute("form", value)
    }

    public func width(_ value: Int) -> HTMLObjectElement {
        addingAttribute("width", "\(value)")
    }

    public func height(_ value: Int) -> HTMLObjectElement {
        addingAttribute("height", "\(value)")
    }
}

public func object(@HTMLBuilder content: () -> [DOMNode] = { [] }) -> HTMLObjectElement { HTMLObjectElement(content: content) }
