import CSSBuilder
import EmbeddedSwiftUtilities
import HTMLBuilder
import WebTypes
import DOMBuilder

public struct SVGFEColorMatrixElement: SVGFilterPrimitiveStandardAttributes, Sendable {
    public let attributes: [(String, String)]

    public init() {
        self.attributes = []
    }

    private init(attributes: [(String, String)]) {
        self.attributes = attributes
    }

        public func toNode() -> DOMNode {
        .element(ns: .svg, tag: "fecolormatrix", attributes: attributes, children: [])
    }

public func render(indent: Int = 0) -> String {
        let ind = String(repeating: "  ", count: indent)
        let attributeString = renderAttributes()
        return ind + "<feColorMatrix\(attributeString) />"
    }

    private func renderAttributes() -> String {
        guard !attributes.isEmpty else { return "" }
        return " " + attributes
            .map { "\($0.0)=\"\(escapeHTMLAttributeValue($0.1))\"" }
            .joinedString(separator: " ")
    }

    public func addingAttribute(_ key: String, _ value: String) -> SVGFEColorMatrixElement {
        var newAttributes = attributes
        newAttributes.removeAll { $0.0 == key }
        newAttributes.append((key, value))
        return SVGFEColorMatrixElement(attributes: newAttributes)
    }
}

extension SVGFEColorMatrixElement {
    public func `in`(_ value: SVGFilterInput) -> SVGFEColorMatrixElement { addingAttribute("in", value.value) }
    public func `in`(_ value: String) -> SVGFEColorMatrixElement { addingAttribute("in", value) }
    public func type(_ value: String) -> SVGFEColorMatrixElement { addingAttribute("type", value) }
    public func values(_ value: String) -> SVGFEColorMatrixElement { addingAttribute("values", value) }
}

public func feColorMatrix() -> SVGFEColorMatrixElement { SVGFEColorMatrixElement() }
