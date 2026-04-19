#if CLIENT

import EmbeddedSwiftUtilities

#endif

import CSSBuilder
import WebTypes
import DOMBuilder

public struct HTMLSourceElement: HTMLElementRenderable, Sendable, CustomStringConvertible {
    public let attributes: [(String, String)]

    public init() {
        self.attributes = []
    }

    private init(attributes: [(String, String)]) {
        self.attributes = attributes
    }

    public func render() -> DOMNode {
        .element(ns: .html, tag: "source", attributes: attributes, children: [])
    }

    public var description: String {
        serialize(indent: 0)
    }

    public func addingAttribute(_ key: String, _ value: String) -> HTMLSourceElement {
        var newAttributes = attributes
        newAttributes.removeAll { $0.0 == key }
        newAttributes.append((key, value))
        return HTMLSourceElement(attributes: newAttributes)
    }

}

extension HTMLSourceElement {
    public func src(_ value: String) -> HTMLSourceElement {
        addingAttribute("src", value)
    }

    public func type(_ value: String) -> HTMLSourceElement {
        addingAttribute("type", value)
    }

    public func srcset(_ value: String) -> HTMLSourceElement {
        addingAttribute("srcset", value)
    }

    public func sizes(_ value: String) -> HTMLSourceElement {
        addingAttribute("sizes", value)
    }

    public func media(_ value: String) -> HTMLSourceElement {
        addingAttribute("media", value)
    }
}

public func source() -> HTMLSourceElement { HTMLSourceElement() }
