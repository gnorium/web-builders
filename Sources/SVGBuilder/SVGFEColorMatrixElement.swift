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

    public func render() -> DOMNode {
        .element(ns: .svg, tag: "feColorMatrix", attributes: attributes, children: [])
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
