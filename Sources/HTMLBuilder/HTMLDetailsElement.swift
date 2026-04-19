#if CLIENT

import EmbeddedSwiftUtilities

#endif

import CSSBuilder
import WebTypes
import DOMBuilder

public struct HTMLDetailsElement: HTMLElementRenderable, Sendable, CustomStringConvertible {
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
        .element(ns: .html, tag: "details", attributes: attributes, children: children)
    }

    public var description: String {
        serialize(indent: 0)
    }

    public func callAsFunction(@HTMLBuilder content: () -> [DOMNode]) -> HTMLDetailsElement {
        HTMLDetailsElement(attributes: attributes, children: content())
    }

    public func addingAttribute(_ key: String, _ value: String) -> HTMLDetailsElement {
        var newAttributes = attributes
        newAttributes.removeAll { $0.0 == key }
        newAttributes.append((key, value))
        return HTMLDetailsElement(attributes: newAttributes, children: children)
    }

}

extension HTMLDetailsElement {
    public func open(_ value: Bool = true) -> HTMLDetailsElement {
        value ? addingAttribute("open", "open") : self
    }
}

public func details(@HTMLBuilder content: () -> [DOMNode] = { [] }) -> HTMLDetailsElement { HTMLDetailsElement(content: content) }

public struct HTMLSummaryElement: HTMLElementRenderable, Sendable, CustomStringConvertible {
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
        .element(ns: .html, tag: "details", attributes: attributes, children: children)
    }

    public var description: String {
        serialize(indent: 0)
    }

    public func addingAttribute(_ key: String, _ value: String) -> HTMLSummaryElement {
        var newAttributes = attributes
        newAttributes.removeAll { $0.0 == key }
        newAttributes.append((key, value))
        return HTMLSummaryElement(attributes: newAttributes, children: children)
    }

}

public func summary(@HTMLBuilder content: () -> [DOMNode] = { [] }) -> HTMLSummaryElement { HTMLSummaryElement(content: content) }
public func summary(_ text: String) -> HTMLSummaryElement { HTMLSummaryElement(text) }
