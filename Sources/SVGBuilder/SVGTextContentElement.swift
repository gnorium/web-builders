import CSSBuilder
import HTMLBuilder
import WebTypes
import DOMBuilder
import EmbeddedSwiftUtilities

/// Shared attributes for text-content elements like text, tspan, etc.
public protocol SVGTextContentElementAttributes: SVGElementRenderable {
    func x(_ value: Length) -> Self
    func x(_ value: Percentage) -> Self
    func x(_ value: Int) -> Self
    func x(_ value: Double) -> Self
    func x(_ value: Float) -> Self

    func y(_ value: Length) -> Self
    func y(_ value: Percentage) -> Self
    func y(_ value: Int) -> Self
    func y(_ value: Double) -> Self
    func y(_ value: Float) -> Self

    func dx(_ value: Length) -> Self
    func dx(_ value: Percentage) -> Self
    func dx(_ value: Int) -> Self
    func dx(_ value: Double) -> Self
    func dx(_ value: Float) -> Self

    func dy(_ value: Length) -> Self
    func dy(_ value: Percentage) -> Self
    func dy(_ value: Int) -> Self
    func dy(_ value: Double) -> Self
    func dy(_ value: Float) -> Self

    func rotate(_ value: String) -> Self

    func textLength(_ value: Length) -> Self
    func textLength(_ value: Percentage) -> Self
    func textLength(_ value: Int) -> Self
    func textLength(_ value: Double) -> Self
    func textLength(_ value: Float) -> Self

    func lengthAdjust(_ value: String) -> Self
}

public struct SVGTSpanElement: SVGGraphicsElementRenderable, Sendable {
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
        .element(ns: .svg, tag: "textcontent", attributes: attributes, children: children)
    }

    public func addingAttribute(_ key: String, _ value: String) -> SVGTSpanElement {
        var newAttributes = attributes
        newAttributes.removeAll { $0.0 == key }
        newAttributes.append((key, value))
        return SVGTSpanElement(attributes: newAttributes, children: children)
    }

}

extension SVGTSpanElement: SVGTextContentElementAttributes {
    public func x(_ value: Length) -> SVGTSpanElement { addingAttribute("x", value.value) }
    public func x(_ value: Percentage) -> SVGTSpanElement { addingAttribute("x", value.value) }
    public func x(_ value: Int) -> SVGTSpanElement { addingAttribute("x", "\(value)px") }
    public func x(_ value: Double) -> SVGTSpanElement { addingAttribute("x", "\(value)px") }
    public func x(_ value: Float) -> SVGTSpanElement { addingAttribute("x", "\(value)px") }

    public func y(_ value: Length) -> SVGTSpanElement { addingAttribute("y", value.value) }
    public func y(_ value: Percentage) -> SVGTSpanElement { addingAttribute("y", value.value) }
    public func y(_ value: Int) -> SVGTSpanElement { addingAttribute("y", "\(value)px") }
    public func y(_ value: Double) -> SVGTSpanElement { addingAttribute("y", "\(value)px") }
    public func y(_ value: Float) -> SVGTSpanElement { addingAttribute("y", "\(value)px") }

    public func dx(_ value: Length) -> SVGTSpanElement { addingAttribute("dx", value.value) }
    public func dx(_ value: Percentage) -> SVGTSpanElement { addingAttribute("dx", value.value) }
    public func dx(_ value: Int) -> SVGTSpanElement { addingAttribute("dx", "\(value)px") }
    public func dx(_ value: Double) -> SVGTSpanElement { addingAttribute("dx", "\(value)px") }
    public func dx(_ value: Float) -> SVGTSpanElement { addingAttribute("dx", "\(value)px") }

    public func dy(_ value: Length) -> SVGTSpanElement { addingAttribute("dy", value.value) }
    public func dy(_ value: Percentage) -> SVGTSpanElement { addingAttribute("dy", value.value) }
    public func dy(_ value: Int) -> SVGTSpanElement { addingAttribute("dy", "\(value)px") }
    public func dy(_ value: Double) -> SVGTSpanElement { addingAttribute("dy", "\(value)px") }
    public func dy(_ value: Float) -> SVGTSpanElement { addingAttribute("dy", "\(value)px") }

    public func textLength(_ value: Length) -> SVGTSpanElement { addingAttribute("textLength", value.value) }
    public func textLength(_ value: Percentage) -> SVGTSpanElement { addingAttribute("textLength", value.value) }
    public func textLength(_ value: Int) -> SVGTSpanElement { addingAttribute("textLength", "\(value)px") }
    public func textLength(_ value: Double) -> SVGTSpanElement { addingAttribute("textLength", "\(value)px") }
    public func textLength(_ value: Float) -> SVGTSpanElement { addingAttribute("textLength", "\(value)px") }
    public func rotate(_ value: String) -> SVGTSpanElement { addingAttribute("rotate", value) }
    public func lengthAdjust(_ value: String) -> SVGTSpanElement { addingAttribute("lengthAdjust", value) }
}

public func tspan(_ value: String) -> SVGTSpanElement { SVGTSpanElement(value) }
public func tspan(@SVGBuilder _ content: () -> [DOMNode] = { [] }) -> SVGTSpanElement { SVGTSpanElement(content: content) }
