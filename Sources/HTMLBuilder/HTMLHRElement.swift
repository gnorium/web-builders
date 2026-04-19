#if CLIENT

import EmbeddedSwiftUtilities

#endif

import CSSBuilder
import DOMBuilder

public struct HTMLHRElement: HTMLElementRenderable, Sendable, CustomStringConvertible {
    public let attributes: [(String, String)]

    public init() {
        self.attributes = []
    }

    private init(attributes: [(String, String)]) {
        self.attributes = attributes
    }

    public func render() -> DOMNode {
        .element(ns: .html, tag: "hr", attributes: attributes, children: [])
    }

    public var description: String {
        serialize(indent: 0)
    }

    public func addingAttribute(_ key: String, _ value: String) -> HTMLHRElement {
        var newAttributes = attributes
        newAttributes.removeAll { $0.0 == key }
        newAttributes.append((key, value))
        return HTMLHRElement(attributes: newAttributes)
    }

}

public func hr() -> HTMLHRElement { HTMLHRElement() }
