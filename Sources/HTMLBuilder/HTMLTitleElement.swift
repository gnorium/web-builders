#if CLIENT

import EmbeddedSwiftUtilities

#endif

import CSSBuilder
import WebTypes
import DOMBuilder

public struct HTMLTitleElement: HTMLElementRenderable, Sendable, CustomStringConvertible {
    public let attributes: [(String, String)]
    public let content: String

    public init(_ content: String) {
        self.attributes = []
        self.content = content
    }

    private init(attributes: [(String, String)], content: String) {
        self.attributes = attributes
        self.content = content
    }

    public func render() -> DOMNode {
        .element(ns: .html, tag: "title", attributes: attributes, children: [.text(content)])
    }

    private func renderAttributes() -> String {
        guard !attributes.isEmpty else { return "" }
        return " " + attributes
            .map { "\($0.0)=\"\(escapeHTMLAttributeValue($0.1))\"" }
            .joinedString(separator: " ")
    }

    public var description: String {
        serialize(indent: 0)
    }

    public func addingAttribute(_ key: String, _ value: String) -> HTMLTitleElement {
        var newAttributes = attributes
        newAttributes.removeAll { $0.0 == key }
        newAttributes.append((key, value))
        return HTMLTitleElement(attributes: newAttributes, content: content)
    }
}

public func title(_ content: String) -> HTMLTitleElement { HTMLTitleElement(content) }
public func title(_ content: () -> String) -> HTMLTitleElement { HTMLTitleElement(content()) }
