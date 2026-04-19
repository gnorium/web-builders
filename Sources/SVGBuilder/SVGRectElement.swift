import CSSBuilder
import CSSOMBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import HTMLBuilder
import WebTypes

public struct SVGRectElement: SVGGraphicsElementRenderable, Sendable {
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
        .element(ns: .svg, tag: "rect", attributes: attributes, children: children)
    }

    public func addingAttribute(_ key: String, _ value: String) -> SVGRectElement {
        var newAttributes = attributes
        newAttributes.removeAll { $0.0 == key }
        newAttributes.append((key, value))
        return SVGRectElement(attributes: newAttributes, children: children)
    }
}

extension SVGRectElement {
    public func x(_ value: Length) -> SVGRectElement { addingAttribute("x", value.value) }
    public func x(_ value: Percentage) -> SVGRectElement { addingAttribute("x", value.value) }
    public func x(_ value: Int) -> SVGRectElement { addingAttribute("x", "\(intToString(value))px") }
    public func x(_ value: Double) -> SVGRectElement { addingAttribute("x", "\(doubleToString(value))px") }
    public func x(_ value: Float) -> SVGRectElement { addingAttribute("x", "\(doubleToString(Double(value)))px") }

    public func y(_ value: Length) -> SVGRectElement { addingAttribute("y", value.value) }
    public func y(_ value: Percentage) -> SVGRectElement { addingAttribute("y", value.value) }
    public func y(_ value: Int) -> SVGRectElement { addingAttribute("y", "\(intToString(value))px") }
    public func y(_ value: Double) -> SVGRectElement { addingAttribute("y", "\(doubleToString(value))px") }
    public func y(_ value: Float) -> SVGRectElement { addingAttribute("y", "\(doubleToString(Double(value)))px") }

    @_disfavoredOverload
    public func width(_ value: Length) -> SVGRectElement { addingAttribute("width", value.value) }
    @_disfavoredOverload
    public func width(_ value: Percentage) -> SVGRectElement { addingAttribute("width", value.value) }
    @_disfavoredOverload
    public func width(_ value: Int) -> SVGRectElement { addingAttribute("width", "\(intToString(value))px") }
    @_disfavoredOverload
    public func width(_ value: Double) -> SVGRectElement { addingAttribute("width", "\(doubleToString(value))px") }
    @_disfavoredOverload
    public func width(_ value: Float) -> SVGRectElement { addingAttribute("width", "\(doubleToString(Double(value)))px") }

    @_disfavoredOverload
    public func height(_ value: Length) -> SVGRectElement { addingAttribute("height", value.value) }
    @_disfavoredOverload
    public func height(_ value: Percentage) -> SVGRectElement { addingAttribute("height", value.value) }
    @_disfavoredOverload
    public func height(_ value: Int) -> SVGRectElement { addingAttribute("height", "\(intToString(value))px") }
    @_disfavoredOverload
    public func height(_ value: Double) -> SVGRectElement { addingAttribute("height", "\(doubleToString(value))px") }
    @_disfavoredOverload
    public func height(_ value: Float) -> SVGRectElement { addingAttribute("height", "\(doubleToString(Double(value)))px") }

    public func rx(_ value: Length) -> SVGRectElement { addingAttribute("rx", value.value) }
    public func rx(_ value: Percentage) -> SVGRectElement { addingAttribute("rx", value.value) }
    public func rx(_ value: Int) -> SVGRectElement { addingAttribute("rx", "\(intToString(value))px") }
    public func rx(_ value: Double) -> SVGRectElement { addingAttribute("rx", "\(doubleToString(value))px") }
    public func rx(_ value: Float) -> SVGRectElement { addingAttribute("rx", "\(doubleToString(Double(value)))px") }

    public func ry(_ value: Length) -> SVGRectElement { addingAttribute("ry", value.value) }
    public func ry(_ value: Percentage) -> SVGRectElement { addingAttribute("ry", value.value) }
    public func ry(_ value: Int) -> SVGRectElement { addingAttribute("ry", "\(intToString(value))px") }
    public func ry(_ value: Double) -> SVGRectElement { addingAttribute("ry", "\(doubleToString(value))px") }
    public func ry(_ value: Float) -> SVGRectElement { addingAttribute("ry", "\(doubleToString(Double(value)))px") }

    // MARK: - HTML/SVG Universal Attributes
    public func `class`(_ value: String) -> SVGRectElement { addingAttribute("class", value) }
    public func id(_ value: String) -> SVGRectElement { addingAttribute("id", value) }

    // MARK: - Presentation Attributes
    public func fill(_ value: String) -> SVGRectElement { addingAttribute("fill", value) }
    public func fill(_ value: SVGPaint) -> SVGRectElement { addingAttribute("fill", value.value) }
    public func clipPath(_ value: String) -> SVGRectElement { addingAttribute("clip-path", value) }

    // MARK: - Style
    public func style(prefix: Bool = true, @CSSBuilder _ content: @Sendable () -> [CSSRule]) -> SVGRectElement {
        let (inlineStyle, _) = processStyleBlock(
            cssItems: content(),
            prefix: prefix,
            className: attributes.first(where: { $0.0 == "class" })?.1 ?? "",
            existingStyle: attributes.first(where: { $0.0 == "style" })?.1
        )
        return inlineStyle.isEmpty ? self : addingAttribute("style", inlineStyle)
    }
}

public func rect(@SVGBuilder content: () -> [DOMNode] = { [] }) -> SVGRectElement { SVGRectElement(content: content) }
