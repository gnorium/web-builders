import CSSBuilder
import HTMLBuilder
import WebTypes
import DOMBuilder
import EmbeddedSwiftUtilities

public struct SVGFEGaussianBlurElement: SVGFilterPrimitiveStandardAttributes, Sendable {
    public let attributes: [(String, String)]

    public init() {
        self.attributes = []
    }

    private init(attributes: [(String, String)]) {
        self.attributes = attributes
    }

    public func render() -> DOMNode {
        .element(ns: .svg, tag: "feGaussianBlur", attributes: attributes, children: [])
    }

    public func addingAttribute(_ key: String, _ value: String) -> SVGFEGaussianBlurElement {
        var newAttributes = attributes
        newAttributes.removeAll { $0.0 == key }
        newAttributes.append((key, value))
        return SVGFEGaussianBlurElement(attributes: newAttributes)
    }
}

extension SVGFEGaussianBlurElement {
    public func `in`(_ value: SVGFilterInput) -> SVGFEGaussianBlurElement { addingAttribute("in", value.value) }
    public func `in`(_ value: String) -> SVGFEGaussianBlurElement { addingAttribute("in", value) }
    public func stdDeviation(_ value: Double) -> SVGFEGaussianBlurElement { addingAttribute("stdDeviation", doubleToString(value)) }
    public func stdDeviation(_ x: Double, _ y: Double) -> SVGFEGaussianBlurElement {
        addingAttribute("stdDeviation", "\(doubleToString(x)) \(doubleToString(y))")
    }
}

public func feGaussianBlur() -> SVGFEGaussianBlurElement { SVGFEGaussianBlurElement() }
