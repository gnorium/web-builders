#if CLIENT

import EmbeddedSwiftUtilities

#endif

import CSSBuilder
import WebTypes
import DOMBuilder

public struct HTMLTimeElement: HTMLElementRenderable, Sendable, CustomStringConvertible {
    public let attributes: [(String, String)]
    let children: [DOMNode]

    public init(@HTMLBuilder content: () -> [DOMNode] = { [] }) {
        self.attributes = []
        self.children = content()
    }

    public init(_ text: String) {
        self.attributes = []
        self.children = [.text(text)]
    }

    private init(attributes: [(String, String)], children: [DOMNode]) {
        self.attributes = attributes
        self.children = children
    }

    public func render() -> DOMNode {
        .element(ns: .html, tag: "time", attributes: attributes, children: children)
    }

    public var description: String {
        serialize(indent: 0)
    }

    public func callAsFunction(@HTMLBuilder content: () -> [DOMNode]) -> HTMLTimeElement {
        HTMLTimeElement(attributes: attributes, children: content())
    }

    public func addingAttribute(_ key: String, _ value: String) -> HTMLTimeElement {
        var newAttributes = attributes
        newAttributes.removeAll { $0.0 == key }
        newAttributes.append((key, value))
        return HTMLTimeElement(attributes: newAttributes, children: children)
    }

}

extension HTMLTimeElement {
    public func datetime(_ value: String) -> HTMLTimeElement {
        addingAttribute("datetime", value)
    }
}

public func time(@HTMLBuilder content: () -> [DOMNode] = { [] }) -> HTMLTimeElement { HTMLTimeElement(content: content) }
public func time(_ text: String) -> HTMLTimeElement { HTMLTimeElement(text) }
