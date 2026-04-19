#if CLIENT

import EmbeddedSwiftUtilities

#endif

import CSSBuilder
import WebTypes
import DOMBuilder

public struct HTMLOutputElement: HTMLElementRenderable, Sendable, CustomStringConvertible {
    public let attributes: [(String, String)]
    let children: [DOMNode]

    public init(@HTMLBuilder content: () -> [DOMNode] = { [] }) {
        self.attributes = []
        self.children = content()
    }

    public init(_ text: String) {
        self.attributes = []
        self.children = [HTMLText(content: text).render()]
    }

    private init(attributes: [(String, String)], children: [DOMNode]) {
        self.attributes = attributes
        self.children = children
    }

    public func render() -> DOMNode {
        .element(ns: .html, tag: "output", attributes: attributes, children: children)
    }

    public var description: String {
        serialize(indent: 0)
    }

    public func callAsFunction(@HTMLBuilder content: () -> [DOMNode]) -> HTMLOutputElement {
        HTMLOutputElement(attributes: attributes, children: content())
    }

    public func addingAttribute(_ key: String, _ value: String) -> HTMLOutputElement {
        var newAttributes = attributes
        newAttributes.removeAll { $0.0 == key }
        newAttributes.append((key, value))
        return HTMLOutputElement(attributes: newAttributes, children: children)
    }

}

extension HTMLOutputElement {
    public func `for`(_ value: String) -> HTMLOutputElement {
        addingAttribute("for", value)
    }

    public func form(_ value: String) -> HTMLOutputElement {
        addingAttribute("form", value)
    }

    public func name(_ value: String) -> HTMLOutputElement {
        addingAttribute("name", value)
    }
}

public func output(@HTMLBuilder content: () -> [DOMNode] = { [] }) -> HTMLOutputElement { HTMLOutputElement(content: content) }
public func output(_ text: String) -> HTMLOutputElement { HTMLOutputElement(text) }
