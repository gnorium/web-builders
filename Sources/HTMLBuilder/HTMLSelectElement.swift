#if CLIENT

import EmbeddedSwiftUtilities

#endif

import CSSBuilder
import WebTypes
import DOMBuilder

public struct HTMLSelectElement: HTMLElementRenderable, Sendable, CustomStringConvertible {
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
        .element(ns: .html, tag: "select", attributes: attributes, children: children)
    }

    public var description: String {
        serialize(indent: 0)
    }

    public func callAsFunction(@HTMLBuilder content: () -> [DOMNode]) -> HTMLSelectElement {
        HTMLSelectElement(attributes: attributes, children: content())
    }

    public func addingAttribute(_ key: String, _ value: String) -> HTMLSelectElement {
        var newAttributes = attributes
        newAttributes.removeAll { $0.0 == key }
        newAttributes.append((key, value))
        return HTMLSelectElement(attributes: newAttributes, children: children)
    }

}

extension HTMLSelectElement {
    public func name(_ value: String) -> HTMLSelectElement {
        addingAttribute("name", value)
    }

    public func required(_ value: Bool = true) -> HTMLSelectElement {
        value ? addingAttribute("required", "required") : self
    }

    public func multiple(_ value: Bool = true) -> HTMLSelectElement {
        value ? addingAttribute("multiple", "multiple") : self
    }

    public func autofocus(_ value: Bool = true) -> HTMLSelectElement {
        value ? addingAttribute("autofocus", "autofocus") : self
    }

    public func disabled(_ value: Bool = true) -> HTMLSelectElement {
        value ? addingAttribute("disabled", "disabled") : self
    }
}

public func select(@HTMLBuilder content: () -> [DOMNode] = { [] }) -> HTMLSelectElement { HTMLSelectElement(content: content) }
