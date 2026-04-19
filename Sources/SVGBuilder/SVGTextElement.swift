import CSSBuilder
import EmbeddedSwiftUtilities
import HTMLBuilder
import WebTypes
import DOMBuilder

public struct SVGTextElement: SVGGraphicsElementRenderable, Sendable {
    public let attributes: [(String, String)]
    let children: [DOMNode]

    public init(@SVGBuilder content: () -> [DOMNode] = { [] }) {
        self.attributes = []
        self.children = content()
    }

    public init(_ value: String) {
        self.attributes = []
        self.children = [HTMLText(content: value).render()]
    }

    private init(attributes: [(String, String)], children: [DOMNode]) {
        self.attributes = attributes
        self.children = children
    }

    public func render() -> DOMNode {
        .element(ns: .svg, tag: "text", attributes: attributes, children: children)
    }

    public func addingAttribute(_ key: String, _ value: String) -> SVGTextElement {
        var newAttributes = attributes
        newAttributes.removeAll { $0.0 == key }
        newAttributes.append((key, value))
        return SVGTextElement(attributes: newAttributes, children: children)
    }

}

extension SVGTextElement: SVGTextContentElementAttributes {
    public func x(_ value: Length) -> SVGTextElement { addingAttribute("x", value.value) }
    public func x(_ value: Percentage) -> SVGTextElement { addingAttribute("x", value.value) }
    public func x(_ value: Int) -> SVGTextElement { addingAttribute("x", "\(value)px") }
    public func x(_ value: Double) -> SVGTextElement { addingAttribute("x", "\(value)px") }
    public func x(_ value: Float) -> SVGTextElement { addingAttribute("x", "\(value)px") }

    public func y(_ value: Length) -> SVGTextElement { addingAttribute("y", value.value) }
    public func y(_ value: Percentage) -> SVGTextElement { addingAttribute("y", value.value) }
    public func y(_ value: Int) -> SVGTextElement { addingAttribute("y", "\(value)px") }
    public func y(_ value: Double) -> SVGTextElement { addingAttribute("y", "\(value)px") }
    public func y(_ value: Float) -> SVGTextElement { addingAttribute("y", "\(value)px") }

    public func dx(_ value: Length) -> SVGTextElement { addingAttribute("dx", value.value) }
    public func dx(_ value: Percentage) -> SVGTextElement { addingAttribute("dx", value.value) }
    public func dx(_ value: Int) -> SVGTextElement { addingAttribute("dx", "\(value)px") }
    public func dx(_ value: Double) -> SVGTextElement { addingAttribute("dx", "\(value)px") }
    public func dx(_ value: Float) -> SVGTextElement { addingAttribute("dx", "\(value)px") }

    public func dy(_ value: Length) -> SVGTextElement { addingAttribute("dy", value.value) }
    public func dy(_ value: Percentage) -> SVGTextElement { addingAttribute("dy", value.value) }
    public func dy(_ value: Int) -> SVGTextElement { addingAttribute("dy", "\(value)px") }
    public func dy(_ value: Double) -> SVGTextElement { addingAttribute("dy", "\(value)px") }
    public func dy(_ value: Float) -> SVGTextElement { addingAttribute("dy", "\(value)px") }

    public func textLength(_ value: Length) -> SVGTextElement { addingAttribute("textLength", value.value) }
    public func textLength(_ value: Percentage) -> SVGTextElement { addingAttribute("textLength", value.value) }
    public func textLength(_ value: Int) -> SVGTextElement { addingAttribute("textLength", "\(value)px") }
    public func textLength(_ value: Double) -> SVGTextElement { addingAttribute("textLength", "\(value)px") }
    public func textLength(_ value: Float) -> SVGTextElement { addingAttribute("textLength", "\(value)px") }
    public func rotate(_ value: String) -> SVGTextElement { addingAttribute("rotate", value) }
    public func lengthAdjust(_ value: String) -> SVGTextElement { addingAttribute("lengthAdjust", value) }
}

public func text(_ value: String) -> SVGTextElement { SVGTextElement(value) }
public func text(@SVGBuilder _ content: () -> [DOMNode] = { [] }) -> SVGTextElement { SVGTextElement(content: content) }
