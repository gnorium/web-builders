#if CLIENT

import EmbeddedSwiftUtilities

#endif

import CSSBuilder
import WebTypes
import DOMBuilder

public struct HTMLTableSectionElement: HTMLElementRenderable, Sendable, CustomStringConvertible {
    let name: String
    public let attributes: [(String, String)]
    let children: [DOMNode]

    public init(name: String, @HTMLBuilder content: () -> [DOMNode] = { [] }) {
        self.name = name
        self.attributes = []
        self.children = content()
    }

    private init(name: String, attributes: [(String, String)], children: [DOMNode]) {
        self.name = name
        self.attributes = attributes
        self.children = children
    }

    public func render() -> DOMNode {
        .element(ns: .html, tag: "tablesection", attributes: attributes, children: children)
    }

    public var description: String {
        serialize(indent: 0)
    }

    public func callAsFunction(@HTMLBuilder content: () -> [DOMNode]) -> HTMLTableSectionElement {
        HTMLTableSectionElement(name: name, attributes: attributes, children: content())
    }

    public func addingAttribute(_ key: String, _ value: String) -> HTMLTableSectionElement {
        var newAttributes = attributes
        newAttributes.removeAll { $0.0 == key }
        newAttributes.append((key, value))
        return HTMLTableSectionElement(name: name, attributes: newAttributes, children: children)
    }

}

public func thead(@HTMLBuilder content: () -> [DOMNode] = { [] }) -> HTMLTableSectionElement { HTMLTableSectionElement(name: "thead", content: content) }
public func tbody(@HTMLBuilder content: () -> [DOMNode] = { [] }) -> HTMLTableSectionElement { HTMLTableSectionElement(name: "tbody", content: content) }
public func tfoot(@HTMLBuilder content: () -> [DOMNode] = { [] }) -> HTMLTableSectionElement { HTMLTableSectionElement(name: "tfoot", content: content) }
