import CSSBuilder
import EmbeddedSwiftUtilities
import HTMLBuilder
import WebTypes
import DOMBuilder

public struct SVGEllipseElement: SVGGraphicsElementRenderable, Sendable {
    public let attributes: [(String, String)]

    public init() {
        self.attributes = []
    }

    private init(attributes: [(String, String)]) {
        self.attributes = attributes
    }

    public func render() -> DOMNode {
        .element(ns: .svg, tag: "ellipse", attributes: attributes, children: [])
    }

    public func addingAttribute(_ key: String, _ value: String) -> SVGEllipseElement {
        var newAttributes = attributes
        newAttributes.removeAll { $0.0 == key }
        newAttributes.append((key, value))
        return SVGEllipseElement(attributes: newAttributes)
    }

}

extension SVGEllipseElement {
    public func cx(_ value: Length) -> SVGEllipseElement { addingAttribute("cx", value.value) }
    public func cx(_ value: Percentage) -> SVGEllipseElement { addingAttribute("cx", value.value) }
    public func cx(_ value: Int) -> SVGEllipseElement { addingAttribute("cx", "\(intToString(value))px") }
    public func cx(_ value: Double) -> SVGEllipseElement { addingAttribute("cx", "\(doubleToString(value))px") }
    public func cx(_ value: Float) -> SVGEllipseElement { addingAttribute("cx", "\(doubleToString(Double(value)))px") }

    public func cy(_ value: Length) -> SVGEllipseElement { addingAttribute("cy", value.value) }
    public func cy(_ value: Percentage) -> SVGEllipseElement { addingAttribute("cy", value.value) }
    public func cy(_ value: Int) -> SVGEllipseElement { addingAttribute("cy", "\(intToString(value))px") }
    public func cy(_ value: Double) -> SVGEllipseElement { addingAttribute("cy", "\(doubleToString(value))px") }
    public func cy(_ value: Float) -> SVGEllipseElement { addingAttribute("cy", "\(doubleToString(Double(value)))px") }

    public func rx(_ value: Length) -> SVGEllipseElement { addingAttribute("rx", value.value) }
    public func rx(_ value: Percentage) -> SVGEllipseElement { addingAttribute("rx", value.value) }
    public func rx(_ value: Int) -> SVGEllipseElement { addingAttribute("rx", "\(intToString(value))px") }
    public func rx(_ value: Double) -> SVGEllipseElement { addingAttribute("rx", "\(doubleToString(value))px") }
    public func rx(_ value: Float) -> SVGEllipseElement { addingAttribute("rx", "\(doubleToString(Double(value)))px") }

    public func ry(_ value: Length) -> SVGEllipseElement { addingAttribute("ry", value.value) }
    public func ry(_ value: Percentage) -> SVGEllipseElement { addingAttribute("ry", value.value) }
    public func ry(_ value: Int) -> SVGEllipseElement { addingAttribute("ry", "\(intToString(value))px") }
    public func ry(_ value: Double) -> SVGEllipseElement { addingAttribute("ry", "\(doubleToString(value))px") }
    public func ry(_ value: Float) -> SVGEllipseElement { addingAttribute("ry", "\(doubleToString(Double(value)))px") }
}

public func ellipse() -> SVGEllipseElement { SVGEllipseElement() }
