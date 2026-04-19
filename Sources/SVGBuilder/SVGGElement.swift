import CSSBuilder
import CSSOMBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import HTMLBuilder
import WebTypes

public struct SVGGElement: SVGGraphicsElementRenderable, Sendable {
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
        .element(ns: .svg, tag: "g", attributes: attributes, children: children)
    }

    public func addingAttribute(_ key: String, _ value: String) -> SVGGElement {
        var newAttributes = attributes
        newAttributes.removeAll { $0.0 == key }
        newAttributes.append((key, value))
        return SVGGElement(attributes: newAttributes, children: children)
    }

    // MARK: - HTML/SVG Universal Attributes
    public func `class`(_ value: String) -> SVGGElement { addingAttribute("class", value) }
    public func id(_ value: String) -> SVGGElement { addingAttribute("id", value) }

    // MARK: - Transform & Clipping
    public func transform(_ value: String) -> SVGGElement { addingAttribute("transform", value) }
    public func transform(_ value: SVGTransform) -> SVGGElement { addingAttribute("transform", value.value) }
    public func clipPath(_ value: String) -> SVGGElement { addingAttribute("clip-path", value) }

    // MARK: - Style
    public func style(prefix: Bool = true, @CSSBuilder _ content: @Sendable () -> [CSSRule]) -> SVGGElement {
        let (inlineStyle, _) = processStyleBlock(
            cssItems: content(),
            prefix: prefix,
            className: attributes.first(where: { $0.0 == "class" })?.1 ?? "",
            existingStyle: attributes.first(where: { $0.0 == "style" })?.1
        )
        return inlineStyle.isEmpty ? self : addingAttribute("style", inlineStyle)
    }
}

public func g(@SVGBuilder content: () -> [DOMNode] = { [] }) -> SVGGElement { SVGGElement(content: content) }
