#if CLIENT

import EmbeddedSwiftUtilities

#endif

import CSSBuilder
import WebTypes
import DOMBuilder

public struct HTMLFormElement: HTMLElementRenderable, Sendable, CustomStringConvertible {
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
        .element(ns: .html, tag: "form", attributes: attributes, children: children)
    }

    public var description: String {
        serialize(indent: 0)
    }

    public func callAsFunction(@HTMLBuilder content: () -> [DOMNode]) -> HTMLFormElement {
        HTMLFormElement(attributes: attributes, children: content())
    }

    public func addingAttribute(_ key: String, _ value: String) -> HTMLFormElement {
        var newAttributes = attributes
        newAttributes.removeAll { $0.0 == key }
        newAttributes.append((key, value))
        return HTMLFormElement(attributes: newAttributes, children: children)
    }

}

extension HTMLFormElement {
    public func action(_ value: String) -> HTMLFormElement {
        addingAttribute("action", value)
    }

    public func method(_ value: String) -> HTMLFormElement {
        addingAttribute("method", value)
    }

    public func method(_ value: HTTPMethod) -> HTMLFormElement {
        addingAttribute("method", value.rawValue)
    }

    public func enctype(_ value: String) -> HTMLFormElement {
        addingAttribute("enctype", value)
    }

    public func target(_ value: String) -> HTMLFormElement {
        addingAttribute("target", value)
    }

    public func name(_ value: String) -> HTMLFormElement {
        addingAttribute("name", value)
    }

    public func autocomplete(_ value: String) -> HTMLFormElement {
        addingAttribute("autocomplete", value)
    }
}

public func form(@HTMLBuilder content: () -> [DOMNode] = { [] }) -> HTMLFormElement { HTMLFormElement(content: content) }
