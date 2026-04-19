import CSSBuilder
import EmbeddedSwiftUtilities
import HTMLBuilder
import WebTypes
import DOMBuilder

public struct SVGLineElement: SVGGraphicsElementRenderable, Sendable {
    public let attributes: [(String, String)]

    public init() {
        self.attributes = []
    }

    private init(attributes: [(String, String)]) {
        self.attributes = attributes
    }

    public func render() -> DOMNode {
        .element(ns: .svg, tag: "line", attributes: attributes, children: [])
    }

    public func addingAttribute(_ key: String, _ value: String) -> SVGLineElement {
        var newAttributes = attributes
        newAttributes.removeAll { $0.0 == key }
        newAttributes.append((key, value))
        return SVGLineElement(attributes: newAttributes)
    }

}

extension SVGLineElement {
    public func x1(_ value: Length) -> SVGLineElement { addingAttribute("x1", value.value) }
    public func x1(_ value: Percentage) -> SVGLineElement { addingAttribute("x1", value.value) }
    public func x1(_ value: Int) -> SVGLineElement { addingAttribute("x1", "\(intToString(value))px") }
    public func x1(_ value: Double) -> SVGLineElement { addingAttribute("x1", "\(doubleToString(value))px") }
    public func x1(_ value: Float) -> SVGLineElement { addingAttribute("x1", "\(doubleToString(Double(value)))px") }

    public func y1(_ value: Length) -> SVGLineElement { addingAttribute("y1", value.value) }
    public func y1(_ value: Percentage) -> SVGLineElement { addingAttribute("y1", value.value) }
    public func y1(_ value: Int) -> SVGLineElement { addingAttribute("y1", "\(intToString(value))px") }
    public func y1(_ value: Double) -> SVGLineElement { addingAttribute("y1", "\(doubleToString(value))px") }
    public func y1(_ value: Float) -> SVGLineElement { addingAttribute("y1", "\(doubleToString(Double(value)))px") }

    public func x2(_ value: Length) -> SVGLineElement { addingAttribute("x2", value.value) }
    public func x2(_ value: Percentage) -> SVGLineElement { addingAttribute("x2", value.value) }
    public func x2(_ value: Int) -> SVGLineElement { addingAttribute("x2", "\(intToString(value))px") }
    public func x2(_ value: Double) -> SVGLineElement { addingAttribute("x2", "\(doubleToString(value))px") }
    public func x2(_ value: Float) -> SVGLineElement { addingAttribute("x2", "\(doubleToString(Double(value)))px") }

    public func y2(_ value: Length) -> SVGLineElement { addingAttribute("y2", value.value) }
    public func y2(_ value: Percentage) -> SVGLineElement { addingAttribute("y2", value.value) }
    public func y2(_ value: Int) -> SVGLineElement { addingAttribute("y2", "\(intToString(value))px") }
    public func y2(_ value: Double) -> SVGLineElement { addingAttribute("y2", "\(doubleToString(value))px") }
    public func y2(_ value: Float) -> SVGLineElement { addingAttribute("y2", "\(doubleToString(Double(value)))px") }
}

public func line() -> SVGLineElement { SVGLineElement() }
