#if CLIENT

import EmbeddedSwiftUtilities

#endif

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

    public func render() -> DOMNode {
        .element(ns: .html, tag: "olist", attributes: attributes, children: children)
    }

    public var description: String {
        serialize(indent: 0)
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
