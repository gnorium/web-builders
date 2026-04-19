#if SERVER

import Foundation

#endif

import CSSBuilder
import EmbeddedSwiftUtilities
import HTMLBuilder
import WebTypes
import DOMBuilder

public struct SVGImageElement: SVGGraphicsElementRenderable, Sendable {
    public let attributes: [(String, String)]

    public init() {
        self.attributes = []
    }

    private init(attributes: [(String, String)]) {
        self.attributes = attributes
    }

    public func render() -> DOMNode {
        .element(ns: .svg, tag: "image", attributes: attributes, children: [])
    }

    public func addingAttribute(_ key: String, _ value: String) -> SVGImageElement {
        var newAttributes = attributes
        newAttributes.removeAll { $0.0 == key }
        newAttributes.append((key, value))
        return SVGImageElement(attributes: newAttributes)
    }

}

extension SVGImageElement {
    public func href(_ value: String) -> SVGImageElement { addingAttribute("href", value) }
    public func xlinkHref(_ value: String) -> SVGImageElement { addingAttribute("xlink:href", value) }
    public func xlinkhref(_ value: String) -> SVGImageElement { addingAttribute("xlink:href", value) }
    public func x(_ value: Length) -> SVGImageElement { addingAttribute("x", value.value) }
    public func x(_ value: Percentage) -> SVGImageElement { addingAttribute("x", value.value) }
    public func x(_ value: Int) -> SVGImageElement { addingAttribute("x", "\(intToString(value))px") }
    public func x(_ value: Double) -> SVGImageElement { addingAttribute("x", "\(doubleToString(value))px") }
    public func x(_ value: Float) -> SVGImageElement { addingAttribute("x", "\(doubleToString(Double(value)))px") }

    public func y(_ value: Length) -> SVGImageElement { addingAttribute("y", value.value) }
    public func y(_ value: Percentage) -> SVGImageElement { addingAttribute("y", value.value) }
    public func y(_ value: Int) -> SVGImageElement { addingAttribute("y", "\(intToString(value))px") }
    public func y(_ value: Double) -> SVGImageElement { addingAttribute("y", "\(doubleToString(value))px") }
    public func y(_ value: Float) -> SVGImageElement { addingAttribute("y", "\(doubleToString(Double(value)))px") }

    public func width(_ value: Length) -> SVGImageElement { addingAttribute("width", value.value) }
    public func width(_ value: Percentage) -> SVGImageElement { addingAttribute("width", value.value) }
    public func width(_ value: Int) -> SVGImageElement { addingAttribute("width", "\(intToString(value))px") }
    public func width(_ value: Double) -> SVGImageElement { addingAttribute("width", "\(doubleToString(value))px") }
    public func width(_ value: Float) -> SVGImageElement { addingAttribute("width", "\(doubleToString(Double(value)))px") }

    public func height(_ value: Length) -> SVGImageElement { addingAttribute("height", value.value) }
    public func height(_ value: Percentage) -> SVGImageElement { addingAttribute("height", value.value) }
    public func height(_ value: Int) -> SVGImageElement { addingAttribute("height", "\(intToString(value))px") }
    public func height(_ value: Double) -> SVGImageElement { addingAttribute("height", "\(doubleToString(value))px") }
    public func height(_ value: Float) -> SVGImageElement { addingAttribute("height", "\(doubleToString(Double(value)))px") }
    public func preserveAspectRatio(_ value: String) -> SVGImageElement { addingAttribute("preserveAspectRatio", value) }
}

public func image() -> SVGImageElement { SVGImageElement() }
