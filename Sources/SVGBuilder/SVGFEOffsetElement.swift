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

    public func render() -> DOMNode {
        .element(ns: .svg, tag: "feOffset", attributes: attributes, children: [])
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
