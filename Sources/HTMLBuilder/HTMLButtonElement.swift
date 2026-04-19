#if CLIENT

import EmbeddedSwiftUtilities

#endif

import CSSBuilder
import WebTypes
import DOMBuilder

public struct HTMLButtonElement: HTMLElementRenderable, Sendable, CustomStringConvertible {
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
        .element(ns: .html, tag: "button", attributes: attributes, children: children)
    }

    public var description: String {
        serialize(indent: 0)
    }

    public func callAsFunction(@HTMLBuilder content: () -> [DOMNode]) -> HTMLButtonElement {
        HTMLButtonElement(attributes: attributes, children: content())
    }

    public func addingAttribute(_ key: String, _ value: String) -> HTMLButtonElement {
        var newAttributes = attributes
        newAttributes.removeAll { $0.0 == key }
        newAttributes.append((key, value))
        return HTMLButtonElement(attributes: newAttributes, children: children)
    }

}

extension HTMLButtonElement {
    public func type(_ value: String) -> HTMLButtonElement {
        addingAttribute("type", value)
    }

    public func type(_ value: HTMLButton.`Type`) -> HTMLButtonElement {
        addingAttribute("type", value.rawValue)
    }

    public func name(_ value: String) -> HTMLButtonElement {
        addingAttribute("name", value)
    }

    public func value(_ value: String) -> HTMLButtonElement {
        addingAttribute("value", value)
    }

    public func disabled(_ value: Bool = true) -> HTMLButtonElement {
        value ? addingAttribute("disabled", "disabled") : self
    }
}

public func button(@HTMLBuilder content: () -> [DOMNode] = { [] }) -> HTMLButtonElement { HTMLButtonElement(content: content) }
public func button(_ text: String) -> HTMLButtonElement { HTMLButtonElement { HTMLText(content: text) } }
