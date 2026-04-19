#if CLIENT

import EmbeddedSwiftUtilities

#endif

import CSSBuilder
import WebTypes
import DOMBuilder

public struct HTMLObjectElement: HTMLElementRenderable, Sendable, CustomStringConvertible {
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
        .element(ns: .html, tag: "object", attributes: attributes, children: children)
    }

    public var description: String {
        serialize(indent: 0)
    }

    public func callAsFunction(@HTMLBuilder content: () -> [DOMNode]) -> HTMLObjectElement {
        HTMLObjectElement(attributes: attributes, children: content())
    }

    public func addingAttribute(_ key: String, _ value: String) -> HTMLObjectElement {
        var newAttributes = attributes
        newAttributes.removeAll { $0.0 == key }
        newAttributes.append((key, value))
        return HTMLObjectElement(attributes: newAttributes, children: children)
    }

}

extension HTMLObjectElement {
    public func data(_ value: String) -> HTMLObjectElement {
        addingAttribute("data", value)
    }

    public func type(_ value: String) -> HTMLObjectElement {
        addingAttribute("type", value)
    }

    public func name(_ value: String) -> HTMLObjectElement {
        addingAttribute("name", value)
    }

    public func usemap(_ value: String) -> HTMLObjectElement {
        addingAttribute("usemap", value)
    }

    public func form(_ value: String) -> HTMLObjectElement {
        addingAttribute("form", value)
    }

    public func width(_ value: Int) -> HTMLObjectElement {
        addingAttribute("width", "\(value)")
    }

    public func height(_ value: Int) -> HTMLObjectElement {
        addingAttribute("height", "\(value)")
    }
}

public func object(@HTMLBuilder content: () -> [DOMNode] = { [] }) -> HTMLObjectElement { HTMLObjectElement(content: content) }
