#if CLIENT

import EmbeddedSwiftUtilities

#endif

import CSSBuilder
import WebTypes
import DOMBuilder

public struct HTMLBaseElement: HTMLElementRenderable, Sendable, CustomStringConvertible {
    public let attributes: [(String, String)]

    public init() {
        self.attributes = []
    }

    private init(attributes: [(String, String)]) {
        self.attributes = attributes
    }

    public func render() -> DOMNode {
        .element(ns: .html, tag: "base", attributes: attributes, children: [])
    }

    public var description: String {
        serialize(indent: 0)
    }

    public func addingAttribute(_ key: String, _ value: String) -> HTMLBaseElement {
        var newAttributes = attributes
        newAttributes.removeAll { $0.0 == key }
        newAttributes.append((key, value))
        return HTMLBaseElement(attributes: newAttributes)
    }
}

extension HTMLBaseElement {
    public func href(_ value: String) -> HTMLBaseElement {
        addingAttribute("href", value)
    }

    public func target(_ value: String) -> HTMLBaseElement {
        addingAttribute("target", value)
    }
    
    public func target(_ value: HTMLTarget) -> HTMLBaseElement {
        addingAttribute("target", value.rawValue)
    }
}

public func base() -> HTMLBaseElement { HTMLBaseElement() }
