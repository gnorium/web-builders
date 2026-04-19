#if CLIENT

import EmbeddedSwiftUtilities

#endif

import CSSBuilder
import WebTypes
import DOMBuilder

public struct HTMLParamElement: HTMLElementRenderable, Sendable, CustomStringConvertible {
    public let attributes: [(String, String)]

    public init() {
        self.attributes = []
    }

    private init(attributes: [(String, String)]) {
        self.attributes = attributes
    }

    public func render() -> DOMNode {
        .element(ns: .html, tag: "param", attributes: attributes, children: [])
    }

    public var description: String {
        serialize(indent: 0)
    }

    public func addingAttribute(_ key: String, _ value: String) -> HTMLParamElement {
        var newAttributes = attributes
        newAttributes.removeAll { $0.0 == key }
        newAttributes.append((key, value))
        return HTMLParamElement(attributes: newAttributes)
    }
}

extension HTMLParamElement {
    public func name(_ value: String) -> HTMLParamElement {
        addingAttribute("name", value)
    }

    public func value(_ value: String) -> HTMLParamElement {
        addingAttribute("value", value)
    }
}

public func param() -> HTMLParamElement { HTMLParamElement() }
