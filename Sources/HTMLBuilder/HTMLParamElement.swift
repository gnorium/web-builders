import CSSBuilder
import WebTypes
import DOMBuilder

public struct HTMLParamElement: HTMLElementRenderable, Sendable, CustomStringConvertible {
    public let attributes: [(String, String)]

    public init() {
        self.attributes = []
    }

    private init(attributes: [(String, String)]) {
        self.attributes = attributes
    }

        public func toNode() -> DOMNode {
        .element(ns: .html, tag: "param", attributes: attributes, children: [])
    }

public func render(indent: Int = 0) -> String {
        let ind = String(repeating: "  ", count: indent)
        let attributeString = renderAttributes()
        return ind + "<param\(attributeString)>"
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

    public func addingAttribute(_ key: String, _ value: String) -> HTMLParamElement {
        var newAttributes = attributes
        newAttributes.removeAll { $0.0 == key }
        newAttributes.append((key, value))
        return HTMLParamElement(attributes: newAttributes)
    }
}

extension HTMLParamElement {
    public func name(_ value: String) -> HTMLParamElement {
        addingAttribute("name", value)
    }

    public func value(_ value: String) -> HTMLParamElement {
        addingAttribute("value", value)
    }
}

public func param() -> HTMLParamElement { HTMLParamElement() }
