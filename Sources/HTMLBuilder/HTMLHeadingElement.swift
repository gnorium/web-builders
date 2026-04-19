#if CLIENT

import EmbeddedSwiftUtilities

#endif

import CSSBuilder
import WebTypes
import DOMBuilder

public struct HTMLHeadingElement: HTMLElementRenderable, Sendable, CustomStringConvertible {
    public let attributes: [(String, String)]
    let children: [DOMNode]
    let level: Int

    public init(level: Int, @HTMLBuilder content: () -> [DOMNode] = { [] }) {
        self.attributes = []
        self.children = content()
        self.level = level
    }

    public init(level: Int, _ text: String) {
        self.attributes = []
        self.children = [HTMLText(content: text).render()]
        self.level = level
    }

    private init(attributes: [(String, String)], children: [DOMNode], level: Int) {
        self.attributes = attributes
        self.children = children
        self.level = level
    }

    public func render() -> DOMNode {
        .element(ns: .html, tag: "h1", attributes: attributes, children: children)
    }

    public var description: String {
        serialize(indent: 0)
    }

    public func callAsFunction(@HTMLBuilder content: () -> [DOMNode]) -> HTMLHeadingElement {
        HTMLHeadingElement(attributes: attributes, children: content(), level: level)
    }

    public func addingAttribute(_ key: String, _ value: String) -> HTMLHeadingElement {
        var newAttributes = attributes
        newAttributes.removeAll { $0.0 == key }
        newAttributes.append((key, value))
        return HTMLHeadingElement(attributes: newAttributes, children: children, level: level)
    }

}

public func h1(@HTMLBuilder content: () -> [DOMNode] = { [] }) -> HTMLHeadingElement { HTMLHeadingElement(level: 1, content: content) }
public func h1(_ text: String) -> HTMLHeadingElement { HTMLHeadingElement(level: 1, text) }

public func h2(@HTMLBuilder content: () -> [DOMNode] = { [] }) -> HTMLHeadingElement { HTMLHeadingElement(level: 2, content: content) }
public func h2(_ text: String) -> HTMLHeadingElement { HTMLHeadingElement(level: 2, text) }

public func h3(@HTMLBuilder content: () -> [DOMNode] = { [] }) -> HTMLHeadingElement { HTMLHeadingElement(level: 3, content: content) }
public func h3(_ text: String) -> HTMLHeadingElement { HTMLHeadingElement(level: 3, text) }

public func h4(@HTMLBuilder content: () -> [DOMNode] = { [] }) -> HTMLHeadingElement { HTMLHeadingElement(level: 4, content: content) }
public func h4(_ text: String) -> HTMLHeadingElement { HTMLHeadingElement(level: 4, text) }

public func h5(@HTMLBuilder content: () -> [DOMNode] = { [] }) -> HTMLHeadingElement { HTMLHeadingElement(level: 5, content: content) }
public func h5(_ text: String) -> HTMLHeadingElement { HTMLHeadingElement(level: 5, text) }

public func h6(@HTMLBuilder content: () -> [DOMNode] = { [] }) -> HTMLHeadingElement { HTMLHeadingElement(level: 6, content: content) }
public func h6(_ text: String) -> HTMLHeadingElement { HTMLHeadingElement(level: 6, text) }
