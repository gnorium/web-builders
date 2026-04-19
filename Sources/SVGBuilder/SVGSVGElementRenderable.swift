import CSSBuilder
import HTMLBuilder
import WebTypes
import EmbeddedSwiftUtilities
import DOMBuilder

public struct SVGSVGElementRenderable: SVGGraphicsElementRenderable, HTMLContent, Sendable {
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
        .element(ns: .svg, tag: "svg", attributes: attributes, children: children)
    }

    public func serialize(indent: Int = 0) -> String {
        let ind = String(repeating: "  ", count: indent)
        let attributeString = serializeAttributes()
        let openElement = "<svg\(attributeString)>"
        let closeElement = "</svg>"

        guard !children.isEmpty else {
            return ind + openElement + closeElement
        }

        var inner = ""
        var actualChildrenCount = 0
        for child in children {
            let rendered = child.serialize(indent: indent + 1)
            if !rendered.isEmpty {
                if actualChildrenCount > 0 { inner += "\n" }
                inner += rendered
                actualChildrenCount += 1
            }
        }

        return "\(ind)\(openElement)\n\(inner)\n\(ind)\(closeElement)"
    }

    private func serializeAttributes() -> String {
        guard !attributes.isEmpty else { return "" }
        return " " + attributes
            .map { "\($0.0)=\"\(escapeHTMLAttributeValue($0.1))\"" }
            .joinedString(separator: " ")
    }

    public func addingAttribute(_ key: String, _ value: String) -> SVGSVGElementRenderable {
        var newAttributes = attributes
        newAttributes.removeAll { $0.0 == key }
        newAttributes.append((key, value))
        return SVGSVGElementRenderable(attributes: newAttributes, children: children)
    }
}

extension SVGSVGElementRenderable {
    public func viewBox(_ minX: Double, _ minY: Double, _ width: Double, _ height: Double) -> SVGSVGElementRenderable {
        addingAttribute("viewBox", "\(doubleToString(minX)) \(doubleToString(minY)) \(doubleToString(width)) \(doubleToString(height))")
    }

    public func viewBox(_ minX: Int, _ minY: Int, _ width: Int, _ height: Int) -> SVGSVGElementRenderable {
        addingAttribute("viewBox", "\(intToString(minX)) \(intToString(minY)) \(intToString(width)) \(intToString(height))")
    }

    @_disfavoredOverload
    public func width(_ value: Length) -> SVGSVGElementRenderable { addingAttribute("width", value.value) }
    @_disfavoredOverload
    public func width(_ value: Percentage) -> SVGSVGElementRenderable { addingAttribute("width", value.value) }
    @_disfavoredOverload
    public func width(_ value: Int) -> SVGSVGElementRenderable { addingAttribute("width", "\(intToString(value))px") }
    @_disfavoredOverload
    public func width(_ value: Double) -> SVGSVGElementRenderable { addingAttribute("width", "\(doubleToString(value))px") }
    @_disfavoredOverload
    public func width(_ value: Float) -> SVGSVGElementRenderable { addingAttribute("width", "\(doubleToString(Double(value)))px") }

    @_disfavoredOverload
    public func height(_ value: Length) -> SVGSVGElementRenderable { addingAttribute("height", value.value) }
    @_disfavoredOverload
    public func height(_ value: Percentage) -> SVGSVGElementRenderable { addingAttribute("height", value.value) }
    @_disfavoredOverload
    public func height(_ value: Int) -> SVGSVGElementRenderable { addingAttribute("height", "\(intToString(value))px") }
    @_disfavoredOverload
    public func height(_ value: Double) -> SVGSVGElementRenderable { addingAttribute("height", "\(doubleToString(value))px") }
    @_disfavoredOverload
    public func height(_ value: Float) -> SVGSVGElementRenderable { addingAttribute("height", "\(doubleToString(Double(value)))px") }

    public func preserveAspectRatio(_ value: String) -> SVGSVGElementRenderable { addingAttribute("preserveAspectRatio", value) }

    // MARK: - Specialized Attributes
    public func stopColor(_ value: String) -> SVGSVGElementRenderable { addingAttribute("stop-color", value) }
    public func gradientUnits(_ value: String) -> SVGSVGElementRenderable { addingAttribute("gradientUnits", value) }

    // MARK: - Numeric Overloads
    public func x(_ value: Int) -> SVGSVGElementRenderable { addingAttribute("x", intToString(value)) }
    public func x(_ value: Double) -> SVGSVGElementRenderable { addingAttribute("x", doubleToString(value)) }
    public func x(_ value: Percentage) -> SVGSVGElementRenderable { addingAttribute("x", value.value) }
    public func y(_ value: Int) -> SVGSVGElementRenderable { addingAttribute("y", intToString(value)) }
    public func y(_ value: Double) -> SVGSVGElementRenderable { addingAttribute("y", doubleToString(value)) }
    public func y(_ value: Percentage) -> SVGSVGElementRenderable { addingAttribute("y", value.value) }
    public func cx(_ value: Int) -> SVGSVGElementRenderable { addingAttribute("cx", intToString(value)) }
    public func cx(_ value: Double) -> SVGSVGElementRenderable { addingAttribute("cx", doubleToString(value)) }
    public func cx(_ value: Percentage) -> SVGSVGElementRenderable { addingAttribute("cx", value.value) }
    public func cy(_ value: Int) -> SVGSVGElementRenderable { addingAttribute("cy", intToString(value)) }
    public func cy(_ value: Double) -> SVGSVGElementRenderable { addingAttribute("cy", doubleToString(value)) }
    public func cy(_ value: Percentage) -> SVGSVGElementRenderable { addingAttribute("cy", value.value) }
    public func r(_ value: Int) -> SVGSVGElementRenderable { addingAttribute("r", intToString(value)) }
    public func r(_ value: Double) -> SVGSVGElementRenderable { addingAttribute("r", doubleToString(value)) }
    public func r(_ value: Percentage) -> SVGSVGElementRenderable { addingAttribute("r", value.value) }
    public func rx(_ value: Int) -> SVGSVGElementRenderable { addingAttribute("rx", intToString(value)) }
    public func rx(_ value: Double) -> SVGSVGElementRenderable { addingAttribute("rx", doubleToString(value)) }
    public func rx(_ value: Percentage) -> SVGSVGElementRenderable { addingAttribute("rx", value.value) }
    public func ry(_ value: Int) -> SVGSVGElementRenderable { addingAttribute("ry", intToString(value)) }
    public func ry(_ value: Double) -> SVGSVGElementRenderable { addingAttribute("ry", doubleToString(value)) }
    public func ry(_ value: Percentage) -> SVGSVGElementRenderable { addingAttribute("ry", value.value) }
    public func offset(_ value: String) -> SVGSVGElementRenderable { addingAttribute("offset", value) }
    public func offset(_ value: Double) -> SVGSVGElementRenderable { addingAttribute("offset", doubleToString(value)) }
    public func offset(_ value: Percentage) -> SVGSVGElementRenderable { addingAttribute("offset", value.value) }

    public func gradientTransform(_ value: String) -> SVGSVGElementRenderable { addingAttribute("gradientTransform", value) }
    public func gradientTransform(_ value: SVGTransform) -> SVGSVGElementRenderable { addingAttribute("gradientTransform", value.value) }

    // MARK: - HTML/SVG Universal Attributes
    public func `class`(_ value: String) -> SVGSVGElementRenderable { addingAttribute("class", value) }
    public func id(_ value: String) -> SVGSVGElementRenderable { addingAttribute("id", value) }

    // MARK: - XML Namespace Attributes
    public func xmlns(_ value: String) -> SVGSVGElementRenderable { addingAttribute("xmlns", value) }
    public func xmlnsXlink(_ value: String) -> SVGSVGElementRenderable { addingAttribute("xmlns:xlink", value) }
    public func xmlSpace(_ value: String) -> SVGSVGElementRenderable { addingAttribute("xml:space", value) }
    public func xmlSpace(_ value: SVGXMLSpace) -> SVGSVGElementRenderable { addingAttribute("xml:space", value.rawValue) }

    // MARK: - Graphics Attributes
    public func fillRule(_ value: SVGFillRule) -> SVGSVGElementRenderable { addingAttribute("fill-rule", value.rawValue) }
    public func clipRule(_ value: SVGFillRule) -> SVGSVGElementRenderable { addingAttribute("clip-rule", value.rawValue) }
    public func strokeLinecap(_ value: SVGStrokeLinecap) -> SVGSVGElementRenderable { addingAttribute("stroke-linecap", value.rawValue) }
    public func strokeMiterlimit(_ value: Double) -> SVGSVGElementRenderable { addingAttribute("stroke-miterlimit", doubleToString(value)) }
}

public func svg(@SVGBuilder _ content: () -> [DOMNode] = { [] }) -> SVGSVGElementRenderable { SVGSVGElementRenderable(content: content) }

// MARK: - HTML Integration
extension HTMLBuilder {
    public static func buildExpression(_ expression: SVGSVGElementRenderable) -> [DOMNode] {
        [expression.render()]
    }
}
