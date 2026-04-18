import CSSBuilder
import WebTypes
import DOMBuilder

public struct HTMLStyleElement: HTMLElementRenderable, Sendable, CustomStringConvertible {
    public let attributes: [(String, String)]
    let cssItems: [AnyCSSContent]

    public init(@CSSBuilder content: () -> [AnyCSSContent] = { [] }) {
        self.attributes = []
        self.cssItems = content()
    }

    public init(css: String) {
        self.attributes = []
        self.cssItems = [AnyCSSContent(render: { _, _ in css }, cssRuleType: { .styleRule })]
    }

    private init(attributes: [(String, String)], cssItems: [AnyCSSContent]) {
        self.attributes = attributes
        self.cssItems = cssItems
    }

        public func toNode() -> DOMNode {
        .element(ns: .html, tag: "style", attributes: attributes, children: [])
    }

public func render(indent: Int = 0) -> String {
        let ind = String(repeating: "  ", count: indent)
        let attributeString = renderAttributes()
        let openElement = "<style\(attributeString)>"
        let closeElement = "</style>"

        guard !cssItems.isEmpty else {
            return ind + openElement + closeElement
        }

        var cssCode = ""
        for (index, item) in cssItems.enumerated() {
            cssCode += item.render(prefix: "", indent: indent + 1)
            if index < cssItems.count - 1 {
                cssCode += "\n"
            }
        }

        return "\(ind)\(openElement)\n\(cssCode)\n\(ind)\(closeElement)"
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

    public func addingAttribute(_ key: String, _ value: String) -> HTMLStyleElement {
        var newAttributes = attributes
        newAttributes.removeAll { $0.0 == key }
        newAttributes.append((key, value))
        return HTMLStyleElement(attributes: newAttributes, cssItems: cssItems)
    }

}

extension HTMLStyleElement {
    public func media(_ value: String) -> HTMLStyleElement {
        addingAttribute("media", value)
    }

    public func type(_ value: String) -> HTMLStyleElement {
        addingAttribute("type", value)
    }
}

public func style(@CSSBuilder _ content: () -> [AnyCSSContent] = { [] }) -> HTMLStyleElement { HTMLStyleElement(content: content) }

public func style(_ content: String) -> HTMLStyleElement { HTMLStyleElement(css: content) }
