import CSSBuilder
import EmbeddedSwiftUtilities
import HTMLBuilder
import WebTypes
import DOMBuilder

public struct SVGCircleElement: SVGGraphicsElementRenderable, Sendable {
    public let attributes: [(String, String)]

    public init() {
        self.attributes = []
    }

    private init(attributes: [(String, String)]) {
        self.attributes = attributes
    }

    public func render() -> DOMNode {
        .element(ns: .svg, tag: "circle", attributes: attributes, children: [], selfClosing: true)
    }

    public func addingAttribute(_ key: String, _ value: String) -> SVGCircleElement {
        var newAttributes = attributes
        newAttributes.removeAll { $0.0 == key }
        newAttributes.append((key, value))
        return SVGCircleElement(attributes: newAttributes)
    }
}

extension SVGCircleElement {
    @_disfavoredOverload
    public func cx(_ value: Length) -> SVGCircleElement { addingAttribute("cx", value.value) }
    @_disfavoredOverload
    public func cx(_ value: Percentage) -> SVGCircleElement { addingAttribute("cx", value.value) }
    @_disfavoredOverload
    public func cx(_ value: Int) -> SVGCircleElement { addingAttribute("cx", "\(intToString(value))px") }
    @_disfavoredOverload
    public func cx(_ value: Double) -> SVGCircleElement { addingAttribute("cx", "\(doubleToString(value))px") }
    @_disfavoredOverload
    public func cx(_ value: Float) -> SVGCircleElement { addingAttribute("cx", "\(doubleToString(Double(value)))px") }

    @_disfavoredOverload
    public func cy(_ value: Length) -> SVGCircleElement { addingAttribute("cy", value.value) }
    @_disfavoredOverload
    public func cy(_ value: Percentage) -> SVGCircleElement { addingAttribute("cy", value.value) }
    @_disfavoredOverload
    public func cy(_ value: Int) -> SVGCircleElement { addingAttribute("cy", "\(intToString(value))px") }
    @_disfavoredOverload
    public func cy(_ value: Double) -> SVGCircleElement { addingAttribute("cy", "\(doubleToString(value))px") }
    @_disfavoredOverload
    public func cy(_ value: Float) -> SVGCircleElement { addingAttribute("cy", "\(doubleToString(Double(value)))px") }

    @_disfavoredOverload
    public func r(_ value: Length) -> SVGCircleElement { addingAttribute("r", value.value) }
    @_disfavoredOverload
    public func r(_ value: Percentage) -> SVGCircleElement { addingAttribute("r", value.value) }
    @_disfavoredOverload
    public func r(_ value: Int) -> SVGCircleElement { addingAttribute("r", "\(intToString(value))px") }
    @_disfavoredOverload
    public func r(_ value: Double) -> SVGCircleElement { addingAttribute("r", "\(doubleToString(value))px") }
    @_disfavoredOverload
    public func r(_ value: Float) -> SVGCircleElement { addingAttribute("r", "\(doubleToString(Double(value)))px") }
}

public func circle() -> SVGCircleElement { SVGCircleElement() }
