import CSSBuilder
import EmbeddedSwiftUtilities
import HTMLBuilder
import WebTypes
import DOMBuilder

public struct SVGFilterElement: SVGElementRenderable, Sendable {
    public let attributes: [(String, String)]
    let children: [DOMNode]

    public init(@SVGBuilder content: () -> [DOMNode] = { [] }) {
        self.attributes = []
        self.children = content()
    }

    private init(attributes: [(String, String)], children: [DOMNode]) {
        self.attributes = attributes
        self.children = children
    }

    public func render() -> DOMNode {
        .element(ns: .svg, tag: "filter", attributes: attributes, children: children)
    }

    public func addingAttribute(_ key: String, _ value: String) -> SVGFilterElement {
        var newAttributes = attributes
        newAttributes.removeAll { $0.0 == key }
        newAttributes.append((key, value))
        return SVGFilterElement(attributes: newAttributes, children: children)
    }
}

extension SVGFilterElement {
    public func filterUnits(_ value: SVGUnitTypes) -> SVGFilterElement { addingAttribute("filterUnits", value.rawValue) }
    public func primitiveUnits(_ value: SVGUnitTypes) -> SVGFilterElement { addingAttribute("primitiveUnits", value.rawValue) }
    public func x(_ value: Length) -> SVGFilterElement { addingAttribute("x", value.value) }
    public func x(_ value: Percentage) -> SVGFilterElement { addingAttribute("x", value.value) }
    public func x(_ value: Int) -> SVGFilterElement { addingAttribute("x", "\(value)px") }
    public func x(_ value: Double) -> SVGFilterElement { addingAttribute("x", "\(value)px") }
    public func x(_ value: Float) -> SVGFilterElement { addingAttribute("x", "\(value)px") }

    public func y(_ value: Length) -> SVGFilterElement { addingAttribute("y", value.value) }
    public func y(_ value: Percentage) -> SVGFilterElement { addingAttribute("y", value.value) }
    public func y(_ value: Int) -> SVGFilterElement { addingAttribute("y", "\(value)px") }
    public func y(_ value: Double) -> SVGFilterElement { addingAttribute("y", "\(value)px") }
    public func y(_ value: Float) -> SVGFilterElement { addingAttribute("y", "\(value)px") }

    public func width(_ value: Length) -> SVGFilterElement { addingAttribute("width", value.value) }
    public func width(_ value: Percentage) -> SVGFilterElement { addingAttribute("width", value.value) }
    public func width(_ value: Int) -> SVGFilterElement { addingAttribute("width", "\(value)px") }
    public func width(_ value: Double) -> SVGFilterElement { addingAttribute("width", "\(value)px") }
    public func width(_ value: Float) -> SVGFilterElement { addingAttribute("width", "\(value)px") }

    public func height(_ value: Length) -> SVGFilterElement { addingAttribute("height", value.value) }
    public func height(_ value: Percentage) -> SVGFilterElement { addingAttribute("height", value.value) }
    public func height(_ value: Int) -> SVGFilterElement { addingAttribute("height", "\(value)px") }
    public func height(_ value: Double) -> SVGFilterElement { addingAttribute("height", "\(value)px") }
    public func height(_ value: Float) -> SVGFilterElement { addingAttribute("height", "\(value)px") }
}

public func filter(@SVGBuilder content: () -> [DOMNode] = { [] }) -> SVGFilterElement { SVGFilterElement(content: content) }
