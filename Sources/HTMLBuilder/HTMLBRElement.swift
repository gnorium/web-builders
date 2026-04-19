#if CLIENT

import EmbeddedSwiftUtilities

#endif

import CSSBuilder
import DOMBuilder

public struct HTMLBRElement: HTMLElementRenderable, Sendable, CustomStringConvertible {
    public let attributes: [(String, String)]

    public init() {
        self.attributes = []
    }

    private init(attributes: [(String, String)]) {
        self.attributes = attributes
    }

    public func render() -> DOMNode {
        .element(ns: .html, tag: "br", attributes: attributes, children: [])
    }

    public var description: String {
        serialize(indent: 0)
    }

    public func addingAttribute(_ key: String, _ value: String) -> HTMLBRElement {
        var newAttributes = attributes
        newAttributes.removeAll { $0.0 == key }
        newAttributes.append((key, value))
        return HTMLBRElement(attributes: newAttributes)
    }

}

public func br() -> HTMLBRElement { HTMLBRElement() }
