import CSSBuilder
import WebTypes
import DOMBuilder
import EmbeddedSwiftUtilities

public struct HTMLMeterElement: HTMLElementRenderable, Sendable, CustomStringConvertible {
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
        .element(ns: .html, tag: "meter", attributes: attributes, children: children)
    }

    public var description: String {
        serialize(indent: 0)
    }

    public func callAsFunction(@HTMLBuilder content: () -> [DOMNode]) -> HTMLMeterElement {
        HTMLMeterElement(attributes: attributes, children: content())
    }

    public func addingAttribute(_ key: String, _ value: String) -> HTMLMeterElement {
        var newAttributes = attributes
        newAttributes.removeAll { $0.0 == key }
        newAttributes.append((key, value))
        return HTMLMeterElement(attributes: newAttributes, children: children)
    }

}

extension HTMLMeterElement {
    public func value(_ value: Double) -> HTMLMeterElement {
        addingAttribute("value", doubleToString(value))
    }

    public func min(_ value: Double) -> HTMLMeterElement {
        addingAttribute("min", doubleToString(value))
    }

    public func max(_ value: Double) -> HTMLMeterElement {
        addingAttribute("max", doubleToString(value))
    }

    public func low(_ value: Double) -> HTMLMeterElement {
        addingAttribute("low", doubleToString(value))
    }

    public func high(_ value: Double) -> HTMLMeterElement {
        addingAttribute("high", doubleToString(value))
    }

    public func optimum(_ value: Double) -> HTMLMeterElement {
        addingAttribute("optimum", doubleToString(value))
    }
}

public func meter(@HTMLBuilder content: () -> [DOMNode] = { [] }) -> HTMLMeterElement { HTMLMeterElement(content: content) }
