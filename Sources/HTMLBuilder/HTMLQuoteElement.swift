import CSSBuilder
import WebTypes
import DOMBuilder

public struct HTMLQuoteElement: HTMLElementRenderable, Sendable, CustomStringConvertible {
    public let attributes: [(String, String)]
    let children: [DOMNode]
    let tagName: String

    public init(tagName: String, @HTMLBuilder content: () -> [DOMNode] = { [] }) {
        self.attributes = []
        self.children = content()
        self.tagName = tagName
    }

    private init(attributes: [(String, String)], children: [DOMNode], tagName: String) {
        self.attributes = attributes
        self.children = children
        self.tagName = tagName
    }

        public func toNode() -> DOMNode {
        .element(ns: .html, tag: "quote", attributes: attributes, children: children)
    }

public func render(indent: Int = 0) -> String {
        let ind = String(repeating: "  ", count: indent)
        let attributeString = renderAttributes()
        let openElement = "<\(tagName)\(attributeString)>"
        let closeElement = "</\(tagName)>"

        guard !children.isEmpty else {
            return ind + openElement + closeElement
        }

        var inner = ""
        var actualChildrenCount = 0
        for child in children {
            let rendered = child.render(indent: indent + 1)
            if !rendered.isEmpty {
                if actualChildrenCount > 0 { inner += "\n" }
                inner += rendered
                actualChildrenCount += 1
            }
        }

        return "\(ind)\(openElement)\n\(inner)\n\(ind)\(closeElement)"
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

    public func callAsFunction(@HTMLBuilder content: () -> [DOMNode]) -> HTMLQuoteElement {
        HTMLQuoteElement(attributes: attributes, children: content(), tagName: tagName)
    }

    public func addingAttribute(_ key: String, _ value: String) -> HTMLQuoteElement {
        var newAttributes = attributes
        newAttributes.removeAll { $0.0 == key }
        newAttributes.append((key, value))
        return HTMLQuoteElement(attributes: newAttributes, children: children, tagName: tagName)
    }

}

extension HTMLQuoteElement {
    public func cite(_ value: String) -> HTMLQuoteElement {
        addingAttribute("cite", value)
    }
}

public func blockquote(@HTMLBuilder content: () -> [DOMNode] = { [] }) -> HTMLQuoteElement {
    HTMLQuoteElement(tagName: "blockquote", content: content)
}

public func q(@HTMLBuilder content: () -> [DOMNode] = { [] }) -> HTMLQuoteElement {
    HTMLQuoteElement(tagName: "q", content: content)
}
