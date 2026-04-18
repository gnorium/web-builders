import CSSBuilder
import WebTypes
import DOMBuilder

public struct HTMLTextAreaElement: HTMLElementRenderable, Sendable, CustomStringConvertible {
    public let attributes: [(String, String)]
    let content: String

    public init(_ content: String = "") {
        self.attributes = []
        self.content = content
    }

    private init(attributes: [(String, String)], content: String) {
        self.attributes = attributes
        self.content = content
    }

        public func toNode() -> DOMNode {
        .element(ns: .html, tag: "textarea", attributes: attributes, children: [])
    }

public func render(indent: Int = 0) -> String {
        let ind = String(repeating: "  ", count: indent)
        let attributeString = renderAttributes()
        return ind + "<textarea\(attributeString)>\(content)</textarea>"
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

    public func addingAttribute(_ key: String, _ value: String) -> HTMLTextAreaElement {
        var newAttributes = attributes
        newAttributes.removeAll { $0.0 == key }
        newAttributes.append((key, value))
        return HTMLTextAreaElement(attributes: newAttributes, content: content)
    }

}

extension HTMLTextAreaElement {
    public func name(_ value: String) -> HTMLTextAreaElement {
        addingAttribute("name", value)
    }

    public func rows(_ value: Int) -> HTMLTextAreaElement {
        addingAttribute("rows", "\(value)")
    }

    public func cols(_ value: Int) -> HTMLTextAreaElement {
        addingAttribute("cols", "\(value)")
    }

    public func placeholder(_ value: String) -> HTMLTextAreaElement {
        addingAttribute("placeholder", value)
    }

    public func required(_ value: Bool = true) -> HTMLTextAreaElement {
        value ? addingAttribute("required", "required") : self
    }

    public func readonly(_ value: Bool = true) -> HTMLTextAreaElement {
        value ? addingAttribute("readonly", "readonly") : self
    }

    public func disabled(_ value: Bool = true) -> HTMLTextAreaElement {
        value ? addingAttribute("disabled", "disabled") : self
    }
}

public func textarea(_ content: String = "") -> HTMLTextAreaElement { HTMLTextAreaElement(content) }
