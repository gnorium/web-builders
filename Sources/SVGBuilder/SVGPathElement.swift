import CSSBuilder
import CSSOMBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import HTMLBuilder
import WebTypes

public struct SVGPathElement: SVGGraphicsElementRenderable, Sendable {
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
        .element(ns: .svg, tag: "path", attributes: attributes, children: children)
    }

    public func addingAttribute(_ key: String, _ value: String) -> SVGPathElement {
        var newAttributes = attributes
        newAttributes.removeAll { $0.0 == key }
        newAttributes.append((key, value))
        return SVGPathElement(attributes: newAttributes, children: children)
    }

}

extension SVGPathElement {
    public func d(_ value: String) -> SVGPathElement { addingAttribute("d", value) }
    
    public func d(_ commands: SVGPath.Definition.Command...) -> SVGPathElement {
        d(commands)
    }

    public func d(_ commands: [SVGPath.Definition.Command]) -> SVGPathElement {
        var value = ""
        for (index, cmd) in commands.enumerated() {
            value += cmd.pathString
            if index < commands.count - 1 {
                value += " "
            }
        }
        return addingAttribute("d", value)
    }

    public func pathLength(_ value: Double) -> SVGPathElement { addingAttribute("pathLength", doubleToString(value)) }

    // MARK: - HTML/SVG Universal Attributes
    public func `class`(_ value: String) -> SVGPathElement { addingAttribute("class", value) }
    public func id(_ value: String) -> SVGPathElement { addingAttribute("id", value) }

    // MARK: - Presentation Attributes
    public func fill(_ value: String) -> SVGPathElement { addingAttribute("fill", value) }
    public func fill(_ value: SVGPaint) -> SVGPathElement { addingAttribute("fill", value.value) }
    public func fillRule(_ value: SVGFillRule) -> SVGPathElement { addingAttribute("fill-rule", value.rawValue) }

    // MARK: - Style
    public func style(prefix: Bool = true, @CSSBuilder _ content: @Sendable () -> [CSSRule]) -> SVGPathElement {
        let (inlineStyle, _) = processStyleBlock(
            cssItems: content(),
            prefix: prefix,
            className: attributes.first(where: { $0.0 == "class" })?.1 ?? "",
            existingStyle: attributes.first(where: { $0.0 == "style" })?.1
        )
        return inlineStyle.isEmpty ? self : addingAttribute("style", inlineStyle)
    }
}

public func path(@SVGBuilder content: () -> [DOMNode] = { [] }) -> SVGPathElement { SVGPathElement(content: content) }
