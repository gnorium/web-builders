#if CLIENT

import EmbeddedSwiftUtilities

#endif

import CSSBuilder
import WebTypes
import DOMBuilder

public struct HTMLEmbedElement: HTMLElementRenderable, Sendable, CustomStringConvertible {
    public let attributes: [(String, String)]

    public init() {
        self.attributes = []
    }

    private init(attributes: [(String, String)]) {
        self.attributes = attributes
    }

    public func render() -> DOMNode {
        .element(ns: .html, tag: "embed", attributes: attributes, children: [])
    }

    public var description: String {
        serialize(indent: 0)
    }

    public func addingAttribute(_ key: String, _ value: String) -> HTMLEmbedElement {
        var newAttributes = attributes
        newAttributes.removeAll { $0.0 == key }
        newAttributes.append((key, value))
        return HTMLEmbedElement(attributes: newAttributes)
    }

}

extension HTMLEmbedElement {
    public func src(_ value: String) -> HTMLEmbedElement {
        addingAttribute("src", value)
    }

    public func type(_ value: String) -> HTMLEmbedElement {
        addingAttribute("type", value)
    }

    public func width(_ value: Int) -> HTMLEmbedElement {
        addingAttribute("width", "\(value)")
    }

    public func height(_ value: Int) -> HTMLEmbedElement {
        addingAttribute("height", "\(value)")
    }
}

public func embed() -> HTMLEmbedElement { HTMLEmbedElement() }
