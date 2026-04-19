import CSSBuilder
import EmbeddedSwiftUtilities
import HTMLBuilder
import WebTypes
import DOMBuilder

public struct SVGRadialGradientElement: SVGElementRenderable, Sendable {
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
        .element(ns: .svg, tag: "radialgradient", attributes: attributes, children: children)
    }

    public func addingAttribute(_ key: String, _ value: String) -> SVGRadialGradientElement {
        var newAttributes = attributes
        newAttributes.removeAll { $0.0 == key }
        newAttributes.append((key, value))
        return SVGRadialGradientElement(attributes: newAttributes, children: children)
    }
}

extension SVGRadialGradientElement {
    public func href(_ value: String) -> SVGRadialGradientElement { addingAttribute("href", value) }
    public func xlinkHref(_ value: String) -> SVGRadialGradientElement { addingAttribute("xlink:href", value) }
    public func gradientUnits(_ value: SVGUnitTypes) -> SVGRadialGradientElement { addingAttribute("gradientUnits", value.rawValue) }
    public func gradientTransform(_ value: String) -> SVGRadialGradientElement { addingAttribute("gradientTransform", value) }
    public func gradientTransform(_ value: SVGTransform) -> SVGRadialGradientElement { addingAttribute("gradientTransform", value.value) }
    public func cx(_ value: Length) -> SVGRadialGradientElement { addingAttribute("cx", value.value) }
    public func cy(_ value: Length) -> SVGRadialGradientElement { addingAttribute("cy", value.value) }
    public func r(_ value: Length) -> SVGRadialGradientElement { addingAttribute("r", value.value) }
    public func fx(_ value: Length) -> SVGRadialGradientElement { addingAttribute("fx", value.value) }
    public func fy(_ value: Length) -> SVGRadialGradientElement { addingAttribute("fy", value.value) }
    public func spreadMethod(_ value: String) -> SVGRadialGradientElement { addingAttribute("spreadMethod", value) }
}

public func radialGradient(@SVGBuilder content: () -> [DOMNode] = { [] }) -> SVGRadialGradientElement { SVGRadialGradientElement(content: content) }
