import CSSBuilder
import EmbeddedSwiftUtilities
import HTMLBuilder
import WebTypes
import DOMBuilder

public struct SVGFETurbulenceElement: SVGFilterPrimitiveStandardAttributes, Sendable {
    public let attributes: [(String, String)]

    public init() {
        self.attributes = []
    }

    private init(attributes: [(String, String)]) {
        self.attributes = attributes
    }

    public func render() -> DOMNode {
        .element(ns: .svg, tag: "feTurbulence", attributes: attributes, children: [])
    }

    public func addingAttribute(_ key: String, _ value: String) -> SVGFETurbulenceElement {
        var newAttributes = attributes
        newAttributes.removeAll { $0.0 == key }
        newAttributes.append((key, value))
        return SVGFETurbulenceElement(attributes: newAttributes)
    }
}

extension SVGFETurbulenceElement {
    public func baseFrequency(_ value: Double) -> SVGFETurbulenceElement { addingAttribute("baseFrequency", doubleToString(value)) }
    public func baseFrequency(_ x: Double, _ y: Double) -> SVGFETurbulenceElement {
        addingAttribute("baseFrequency", "\(doubleToString(x)) \(doubleToString(y))")
    }
    public func numOctaves(_ value: Int) -> SVGFETurbulenceElement { addingAttribute("numOctaves", intToString(value)) }
    public func seed(_ value: Double) -> SVGFETurbulenceElement { addingAttribute("seed", doubleToString(value)) }
    public func stitchTiles(_ value: String) -> SVGFETurbulenceElement { addingAttribute("stitchTiles", value) }
    public func type(_ value: String) -> SVGFETurbulenceElement { addingAttribute("type", value) }
}

public func feTurbulence() -> SVGFETurbulenceElement { SVGFETurbulenceElement() }
