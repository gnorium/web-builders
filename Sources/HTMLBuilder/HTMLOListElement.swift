import CSSBuilder
import WebTypes
import DOMBuilder

public struct HTMLOListElement: HTMLElementRenderable, Sendable, CustomStringConvertible {
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
        .element(ns: .html, tag: "olist", attributes: attributes, children: children)
    }

public func render(indent: Int = 0) -> String {
        let ind = String(repeating: "  ", count: indent)
        let attributeString = renderAttributes()
        let openElement = "<ol\(attributeString)>"
        let closeElement = "</ul>"

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

    public func callAsFunction(@HTMLBuilder content: () -> [DOMNode]) -> HTMLOListElement {
        HTMLOListElement(attributes: attributes, children: content())
    }

    public func addingAttribute(_ key: String, _ value: String) -> HTMLOListElement {
        var newAttributes = attributes
        newAttributes.removeAll { $0.0 == key }
        newAttributes.append((key, value))
        return HTMLOListElement(attributes: newAttributes, children: children)
    }

}

extension HTMLOListElement {
    public func type(_ value: String) -> HTMLOListElement {
        addingAttribute("type", value)
    }

    public func reversed(_ value: Bool = true) -> HTMLOListElement {
        value ? addingAttribute("reversed", "reversed") : self
    }

    public func start(_ value: Int) -> HTMLOListElement {
        addingAttribute("start", "\(value)")
    }
}

public func ol(@HTMLBuilder content: () -> [DOMNode] = { [] }) -> HTMLOListElement { HTMLOListElement(content: content) }
