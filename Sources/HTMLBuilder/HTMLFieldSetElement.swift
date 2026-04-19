#if CLIENT

import EmbeddedSwiftUtilities

#endif

import CSSBuilder
import WebTypes
import DOMBuilder

public struct HTMLFieldSetElement: HTMLElementRenderable, Sendable, CustomStringConvertible {
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
        .element(ns: .html, tag: "fieldset", attributes: attributes, children: children)
    }

    public var description: String {
        serialize(indent: 0)
    }

    public func callAsFunction(@HTMLBuilder content: () -> [DOMNode]) -> HTMLFieldSetElement {
        HTMLFieldSetElement(attributes: attributes, children: content())
    }

    public func addingAttribute(_ key: String, _ value: String) -> HTMLFieldSetElement {
        var newAttributes = attributes
        newAttributes.removeAll { $0.0 == key }
        newAttributes.append((key, value))
        return HTMLFieldSetElement(attributes: newAttributes, children: children)
    }

}

extension HTMLFieldSetElement {
    public func disabled(_ value: Bool = true) -> HTMLFieldSetElement {
        value ? addingAttribute("disabled", "disabled") : self
    }

    public func name(_ value: String) -> HTMLFieldSetElement {
        addingAttribute("name", value)
    }
}

public func fieldset(@HTMLBuilder content: () -> [DOMNode] = { [] }) -> HTMLFieldSetElement { HTMLFieldSetElement(content: content) }
