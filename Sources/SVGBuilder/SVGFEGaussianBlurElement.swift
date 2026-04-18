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

        public func toNode() -> DOMNode {
        .element(ns: .svg, tag: "fegaussianblur", attributes: attributes, children: [])
    }

public func render(indent: Int = 0) -> String {
        let ind = String(repeating: "  ", count: indent)
        let attributeString = renderAttributes()
        return ind + "<feGaussianBlur\(attributeString) />"
    }

    private func renderAttributes() -> String {
        guard !attributes.isEmpty else { return "" }
        return " " + attributes
            .map { "\($0.0)=\"\(escapeHTMLAttributeValue($0.1))\"" }
            .joinedString(separator: " ")
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
