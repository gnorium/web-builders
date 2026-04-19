#if CLIENT

import EmbeddedSwiftUtilities

#endif

import CSSBuilder
import WebTypes
import DOMBuilder

public struct HTMLOptGroupElement: HTMLElementRenderable, Sendable, CustomStringConvertible {
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
        .element(ns: .html, tag: "optgroup", attributes: attributes, children: children)
    }

    public var description: String {
        serialize(indent: 0)
    }

    public func callAsFunction(@HTMLBuilder content: () -> [DOMNode]) -> HTMLOptGroupElement {
        HTMLOptGroupElement(attributes: attributes, children: content())
    }

    public func addingAttribute(_ key: String, _ value: String) -> HTMLOptGroupElement {
        var newAttributes = attributes
        newAttributes.removeAll { $0.0 == key }
        newAttributes.append((key, value))
        return HTMLOptGroupElement(attributes: newAttributes, children: children)
    }

}

extension HTMLOptGroupElement {
    public func label(_ value: String) -> HTMLOptGroupElement {
        addingAttribute("label", value)
    }
}

public func optgroup(@HTMLBuilder content: () -> [DOMNode] = { [] }) -> HTMLOptGroupElement { HTMLOptGroupElement(content: content) }
