#if CLIENT

import EmbeddedSwiftUtilities

#endif

import CSSBuilder
import WebTypes
import DOMBuilder

public struct HTMLUListElement: HTMLElementRenderable, Sendable, CustomStringConvertible {
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

    public func render() -> DOMNode {
        .element(ns: .html, tag: "ulist", attributes: attributes, children: children)
    }

    public var description: String {
        serialize(indent: 0)
    }

    public func callAsFunction(@HTMLBuilder content: () -> [DOMNode]) -> HTMLUListElement {
        HTMLUListElement(attributes: attributes, children: content())
    }

    public func addingAttribute(_ key: String, _ value: String) -> HTMLUListElement {
        var newAttributes = attributes
        newAttributes.removeAll { $0.0 == key }
        newAttributes.append((key, value))
        return HTMLUListElement(attributes: newAttributes, children: children)
    }

}

public func ul(@HTMLBuilder content: () -> [DOMNode] = { [] }) -> HTMLUListElement { HTMLUListElement(content: content) }
