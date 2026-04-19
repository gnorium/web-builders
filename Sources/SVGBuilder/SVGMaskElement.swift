import CSSBuilder
import EmbeddedSwiftUtilities
import HTMLBuilder
import WebTypes
import DOMBuilder

public struct SVGMaskElement: SVGElementRenderable, Sendable {
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
        .element(ns: .svg, tag: "mask", attributes: attributes, children: children)
    }

    public func addingAttribute(_ key: String, _ value: String) -> SVGMaskElement {
        var newAttributes = attributes
        newAttributes.removeAll { $0.0 == key }
        newAttributes.append((key, value))
        return SVGMaskElement(attributes: newAttributes, children: children)
    }
}

extension SVGMaskElement {
    public func maskUnits(_ value: SVGUnitTypes) -> SVGMaskElement { addingAttribute("maskUnits", value.rawValue) }
    public func maskContentUnits(_ value: SVGUnitTypes) -> SVGMaskElement { addingAttribute("maskContentUnits", value.rawValue) }
    public func x(_ value: Length) -> SVGMaskElement { addingAttribute("x", value.value) }
    public func x(_ value: Percentage) -> SVGMaskElement { addingAttribute("x", value.value) }
    public func x(_ value: Int) -> SVGMaskElement { addingAttribute("x", "\(value)px") }
    public func x(_ value: Double) -> SVGMaskElement { addingAttribute("x", "\(value)px") }
    public func x(_ value: Float) -> SVGMaskElement { addingAttribute("x", "\(value)px") }

    public func y(_ value: Length) -> SVGMaskElement { addingAttribute("y", value.value) }
    public func y(_ value: Percentage) -> SVGMaskElement { addingAttribute("y", value.value) }
    public func y(_ value: Int) -> SVGMaskElement { addingAttribute("y", "\(value)px") }
    public func y(_ value: Double) -> SVGMaskElement { addingAttribute("y", "\(value)px") }
    public func y(_ value: Float) -> SVGMaskElement { addingAttribute("y", "\(value)px") }

    public func width(_ value: Length) -> SVGMaskElement { addingAttribute("width", value.value) }
    public func width(_ value: Percentage) -> SVGMaskElement { addingAttribute("width", value.value) }
    public func width(_ value: Int) -> SVGMaskElement { addingAttribute("width", "\(value)px") }
    public func width(_ value: Double) -> SVGMaskElement { addingAttribute("width", "\(value)px") }
    public func width(_ value: Float) -> SVGMaskElement { addingAttribute("width", "\(value)px") }

    public func height(_ value: Length) -> SVGMaskElement { addingAttribute("height", value.value) }
    public func height(_ value: Percentage) -> SVGMaskElement { addingAttribute("height", value.value) }
    public func height(_ value: Int) -> SVGMaskElement { addingAttribute("height", "\(value)px") }
    public func height(_ value: Double) -> SVGMaskElement { addingAttribute("height", "\(value)px") }
    public func height(_ value: Float) -> SVGMaskElement { addingAttribute("height", "\(value)px") }
}

public func mask(@SVGBuilder content: () -> [DOMNode] = { [] }) -> SVGMaskElement { SVGMaskElement(content: content) }
