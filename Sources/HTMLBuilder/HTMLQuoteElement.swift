#if CLIENT

import EmbeddedSwiftUtilities

#endif

import CSSBuilder
import WebTypes
import DOMBuilder

public struct HTMLQuoteElement: HTMLElementRenderable, Sendable, CustomStringConvertible {
    public let attributes: [(String, String)]
    let children: [DOMNode]
    let tagName: String

    public init(tagName: String, @HTMLBuilder content: () -> [DOMNode] = { [] }) {
        self.attributes = []
        self.children = content()
        self.tagName = tagName
    }

    private init(attributes: [(String, String)], children: [DOMNode], tagName: String) {
        self.attributes = attributes
        self.children = children
        self.tagName = tagName
    }

    public func render() -> DOMNode {
        .element(ns: .html, tag: "quote", attributes: attributes, children: children)
    }

    public var description: String {
        serialize(indent: 0)
    }

    public func callAsFunction(@HTMLBuilder content: () -> [DOMNode]) -> HTMLQuoteElement {
        HTMLQuoteElement(attributes: attributes, children: content(), tagName: tagName)
    }

    public func addingAttribute(_ key: String, _ value: String) -> HTMLQuoteElement {
        var newAttributes = attributes
        newAttributes.removeAll { $0.0 == key }
        newAttributes.append((key, value))
        return HTMLQuoteElement(attributes: newAttributes, children: children, tagName: tagName)
    }

}

extension HTMLQuoteElement {
    public func cite(_ value: String) -> HTMLQuoteElement {
        addingAttribute("cite", value)
    }
}

public func blockquote(@HTMLBuilder content: () -> [DOMNode] = { [] }) -> HTMLQuoteElement {
    HTMLQuoteElement(tagName: "blockquote", content: content)
}

public func q(@HTMLBuilder content: () -> [DOMNode] = { [] }) -> HTMLQuoteElement {
    HTMLQuoteElement(tagName: "q", content: content)
}
