import CSSBuilder
import EmbeddedSwiftUtilities
import HTMLBuilder
import WebTypes
import DOMBuilder

public struct SVGAnimateTransformElement: SVGElementRenderable, Sendable {
    public let attributes: [(String, String)]

    public init() {
        self.attributes = []
    }

    private init(attributes: [(String, String)]) {
        self.attributes = attributes
    }

    public func render() -> DOMNode {
        .element(ns: .svg, tag: "animateTransform", attributes: attributes, children: [])
    }

    public func addingAttribute(_ key: String, _ value: String) -> SVGAnimateTransformElement {
        var newAttributes = attributes
        newAttributes.removeAll { $0.0 == key }
        newAttributes.append((key, value))
        return SVGAnimateTransformElement(attributes: newAttributes)
    }
}

extension SVGAnimateTransformElement {
    public func attributeName(_ value: String) -> SVGAnimateTransformElement { addingAttribute("attributeName", value) }
    public func attributeName(_ name: SVGAttributeName) -> SVGAnimateTransformElement { addingAttribute("attributeName", name.rawValue) }
    
    public func type(_ value: String) -> SVGAnimateTransformElement { addingAttribute("type", value) }
    public func type(_ type: SVGAnimateTransform.`Type`) -> SVGAnimateTransformElement { addingAttribute("type", type.rawValue) }
    
    public func from(_ value: String) -> SVGAnimateTransformElement { addingAttribute("from", value) }
    public func from(_ values: Double...) -> SVGAnimateTransformElement { addingAttribute("from", stringJoin(values.map { doubleToString($0) }, separator: " ")) }
    
    public func to(_ value: String) -> SVGAnimateTransformElement { addingAttribute("to", value) }
    public func to(_ values: Double...) -> SVGAnimateTransformElement { addingAttribute("to", stringJoin(values.map { doubleToString($0) }, separator: " ")) }
    
    public func dur(_ value: String) -> SVGAnimateTransformElement { addingAttribute("dur", value) }
    public func dur(_ value: CSSTime) -> SVGAnimateTransformElement { addingAttribute("dur", value.value) }
    
    public func repeatCount(_ value: String) -> SVGAnimateTransformElement { addingAttribute("repeatCount", value) }
    public func repeatCount(_ count: SVGAnimate.RepeatCount) -> SVGAnimateTransformElement { addingAttribute("repeatCount", count.value) }
    
    public func begin(_ value: String) -> SVGAnimateTransformElement { addingAttribute("begin", value) }
    public func begin(_ begin: SVGAnimate.Begin) -> SVGAnimateTransformElement { addingAttribute("begin", begin.rawValue) }
}

public func animateTransform() -> SVGAnimateTransformElement { SVGAnimateTransformElement() }
