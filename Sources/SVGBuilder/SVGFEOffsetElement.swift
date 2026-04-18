import CSSBuilder
import HTMLBuilder
import WebTypes
import DOMBuilder
import EmbeddedSwiftUtilities

public struct SVGFEOffsetElement: SVGFilterPrimitiveStandardAttributes, Sendable {
    public let attributes: [(String, String)]

    public init() {
        self.attributes = []
    }

    private init(attributes: [(String, String)]) {
        self.attributes = attributes
    }

        public func toNode() -> DOMNode {
        .element(ns: .svg, tag: "feoffset", attributes: attributes, children: [])
    }

public func render(indent: Int = 0) -> String {
        let ind = String(repeating: "  ", count: indent)
        let attributeString = renderAttributes()
        return ind + "<feOffset\(attributeString) />"
    }

    private func renderAttributes() -> String {
        guard !attributes.isEmpty else { return "" }
        return " " + attributes
            .map { "\($0.0)=\"\(escapeHTMLAttributeValue($0.1))\"" }
            .joinedString(separator: " ")
    }

    public func addingAttribute(_ key: String, _ value: String) -> SVGFEOffsetElement {
        var newAttributes = attributes
        newAttributes.removeAll { $0.0 == key }
        newAttributes.append((key, value))
        return SVGFEOffsetElement(attributes: newAttributes)
    }
}

extension SVGFEOffsetElement {
    public func `in`(_ value: SVGFilterInput) -> SVGFEOffsetElement { addingAttribute("in", value.value) }
    public func `in`(_ value: String) -> SVGFEOffsetElement { addingAttribute("in", value) }
    public func dx(_ value: Double) -> SVGFEOffsetElement { addingAttribute("dx", doubleToString(value)) }
    public func dy(_ value: Double) -> SVGFEOffsetElement { addingAttribute("dy", doubleToString(value)) }
}

public func feOffset() -> SVGFEOffsetElement { SVGFEOffsetElement() }
