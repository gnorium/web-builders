import CSSBuilder
import WebTypes
import DOMBuilder

public struct HTMLSelectElement: HTMLElementRenderable, Sendable, CustomStringConvertible {
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
        .element(ns: .html, tag: "select", attributes: attributes, children: children)
    }

public func render(indent: Int = 0) -> String {
        let ind = String(repeating: "  ", count: indent)
        let attributeString = renderAttributes()
        let openElement = "<select\(attributeString)>"
        let closeElement = "</select>"

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

    public func callAsFunction(@HTMLBuilder content: () -> [DOMNode]) -> HTMLSelectElement {
        HTMLSelectElement(attributes: attributes, children: content())
    }

    public func addingAttribute(_ key: String, _ value: String) -> HTMLSelectElement {
        var newAttributes = attributes
        newAttributes.removeAll { $0.0 == key }
        newAttributes.append((key, value))
        return HTMLSelectElement(attributes: newAttributes, children: children)
    }

}

extension HTMLSelectElement {
    public func name(_ value: String) -> HTMLSelectElement {
        addingAttribute("name", value)
    }

    public func required(_ value: Bool = true) -> HTMLSelectElement {
        value ? addingAttribute("required", "required") : self
    }

    public func multiple(_ value: Bool = true) -> HTMLSelectElement {
        value ? addingAttribute("multiple", "multiple") : self
    }

    public func autofocus(_ value: Bool = true) -> HTMLSelectElement {
        value ? addingAttribute("autofocus", "autofocus") : self
    }

    public func disabled(_ value: Bool = true) -> HTMLSelectElement {
        value ? addingAttribute("disabled", "disabled") : self
    }
}

public func select(@HTMLBuilder content: () -> [DOMNode] = { [] }) -> HTMLSelectElement { HTMLSelectElement(content: content) }
