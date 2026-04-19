import CSSBuilder
import EmbeddedSwiftUtilities
import WebTypes
import DOMBuilder

public struct HTMLProgressElement: HTMLElementRenderable, Sendable, CustomStringConvertible {
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
        .element(ns: .html, tag: "progress", attributes: attributes, children: children)
    }

    public var description: String {
        serialize(indent: 0)
    }

    public func callAsFunction(@HTMLBuilder content: () -> [DOMNode]) -> HTMLProgressElement {
        HTMLProgressElement(attributes: attributes, children: content())
    }

    public func addingAttribute(_ key: String, _ value: String) -> HTMLProgressElement {
        var newAttributes = attributes
        newAttributes.removeAll { $0.0 == key }
        newAttributes.append((key, value))
        return HTMLProgressElement(attributes: newAttributes, children: children)
    }

}

extension HTMLProgressElement {
    public func value(_ value: Double) -> HTMLProgressElement {
        addingAttribute("value", doubleToString(value))
    }

    public func max(_ value: Double) -> HTMLProgressElement {
        addingAttribute("max", doubleToString(value))
    }
}

public func progress(@HTMLBuilder content: () -> [DOMNode] = { [] }) -> HTMLProgressElement { HTMLProgressElement(content: content) }
