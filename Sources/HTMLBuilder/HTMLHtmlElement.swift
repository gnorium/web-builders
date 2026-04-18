import CSSBuilder
import WebTypes
import DOMBuilder

public struct HTMLHtmlElement: HTMLElementRenderable, Sendable, CustomStringConvertible {
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
        .element(ns: .html, tag: "html", attributes: attributes, children: children)
    }

public func render(indent: Int = 0) -> String {
        let attributeString = renderAttributes()
        let openElement = "<html\(attributeString)>"
        let closeElement = "</html>"

        guard !children.isEmpty else {
            return "<!DOCTYPE html>\n" + openElement + closeElement
        }

        var inner = ""
        for (index, child) in children.enumerated() {
            inner += child.render(indent: indent + 1)
            if index < children.count - 1 {
                inner += "\n"
            }
        }

        return "<!DOCTYPE html>\n\(openElement)\n\(inner)\n\(closeElement)"
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

    public func callAsFunction(@HTMLBuilder content: () -> [DOMNode]) -> HTMLHtmlElement {
        HTMLHtmlElement(attributes: attributes, children: content())
    }

    public func addingAttribute(_ key: String, _ value: String) -> HTMLHtmlElement {
        var newAttributes = attributes
        newAttributes.removeAll { $0.0 == key }
        newAttributes.append((key, value))
        return HTMLHtmlElement(attributes: newAttributes, children: children)
    }

}

extension HTMLHtmlElement {
    public func lang(_ value: String) -> HTMLHtmlElement {
        addingAttribute("lang", value)
    }
}

public func html(@HTMLBuilder content: () -> [DOMNode] = { [] }) -> HTMLHtmlElement { HTMLHtmlElement(content: content) }
