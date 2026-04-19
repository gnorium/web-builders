import CSSBuilder
import EmbeddedSwiftUtilities
import HTMLBuilder
import WebTypes
import DOMBuilder

public struct SVGPatternElement: SVGElementRenderable, Sendable {
    public let attributes: [(String, String)]
    let children: [DOMNode]

    public init(@SVGBuilder content: () -> [DOMNode] = { [] }) {
        self.attributes = []
        self.children = content()
    }

    private init(attributes: [(String, String)], children: [DOMNode]) {
        self.attributes = attributes
        self.children = children
    }

    public func render() -> DOMNode {
        .element(ns: .svg, tag: "pattern", attributes: attributes, children: children)
    }

    public func addingAttribute(_ key: String, _ value: String) -> SVGPatternElement {
        var newAttributes = attributes
        newAttributes.removeAll { $0.0 == key }
        newAttributes.append((key, value))
        return SVGPatternElement(attributes: newAttributes, children: children)
    }
}

extension SVGPatternElement {
    public func patternUnits(_ value: SVGUnitTypes) -> SVGPatternElement { addingAttribute("patternUnits", value.rawValue) }
    public func patternContentUnits(_ value: SVGUnitTypes) -> SVGPatternElement { addingAttribute("patternContentUnits", value.rawValue) }
    public func x(_ value: Length) -> SVGPatternElement { addingAttribute("x", value.value) }
    public func x(_ value: Percentage) -> SVGPatternElement { addingAttribute("x", value.value) }
    public func x(_ value: Int) -> SVGPatternElement { addingAttribute("x", "\(intToString(value))px") }
    public func x(_ value: Double) -> SVGPatternElement { addingAttribute("x", "\(doubleToString(value))px") }
    public func x(_ value: Float) -> SVGPatternElement { addingAttribute("x", "\(doubleToString(Double(value)))px") }

    public func y(_ value: Length) -> SVGPatternElement { addingAttribute("y", value.value) }
    public func y(_ value: Percentage) -> SVGPatternElement { addingAttribute("y", value.value) }
    public func y(_ value: Int) -> SVGPatternElement { addingAttribute("y", "\(intToString(value))px") }
    public func y(_ value: Double) -> SVGPatternElement { addingAttribute("y", "\(doubleToString(value))px") }
    public func y(_ value: Float) -> SVGPatternElement { addingAttribute("y", "\(doubleToString(Double(value)))px") }

    public func width(_ value: Length) -> SVGPatternElement { addingAttribute("width", value.value) }
    public func width(_ value: Percentage) -> SVGPatternElement { addingAttribute("width", value.value) }
    public func width(_ value: Int) -> SVGPatternElement { addingAttribute("width", "\(intToString(value))px") }
    public func width(_ value: Double) -> SVGPatternElement { addingAttribute("width", "\(doubleToString(value))px") }
    public func width(_ value: Float) -> SVGPatternElement { addingAttribute("width", "\(doubleToString(Double(value)))px") }

    public func height(_ value: Length) -> SVGPatternElement { addingAttribute("height", value.value) }
    public func height(_ value: Percentage) -> SVGPatternElement { addingAttribute("height", value.value) }
    public func height(_ value: Int) -> SVGPatternElement { addingAttribute("height", "\(intToString(value))px") }
    public func height(_ value: Double) -> SVGPatternElement { addingAttribute("height", "\(doubleToString(value))px") }
    public func height(_ value: Float) -> SVGPatternElement { addingAttribute("height", "\(doubleToString(Double(value)))px") }
    public func viewBox(_ minX: Double, _ minY: Double, _ width: Double, _ height: Double) -> SVGPatternElement {
        addingAttribute("viewBox", "\(doubleToString(minX)) \(doubleToString(minY)) \(doubleToString(width)) \(doubleToString(height))")
    }
}

public func pattern(@SVGBuilder content: () -> [DOMNode] = { [] }) -> SVGPatternElement { SVGPatternElement(content: content) }
