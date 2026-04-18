import CSSBuilder
import HTMLBuilder
import WebTypes
import DOMBuilder
import EmbeddedSwiftUtilities

public struct SVGLinearGradientElement: SVGElementRenderable, Sendable {
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

        public func toNode() -> DOMNode {
        .element(ns: .svg, tag: "lineargradient", attributes: attributes, children: children)
    }

public func render(indent: Int = 0) -> String {
        let ind = String(repeating: "  ", count: indent)
        let attributeString = renderAttributes()
        let openElement = "<linearGradient\(attributeString)>"
        let closeElement = "</linearGradient>"

        guard !children.isEmpty else {
            return ind + openElement + closeElement
        }

        var inner = ""
        var actualChildrenCount = 0
        for child in children {
            let rendered = child.render(indent: indent + 1)
            if !rendered.isEmpty {
                if actualChildrenCount > 0 { inner += "\n" }
                inner += rendered
                actualChildrenCount += 1
            }
        }

        return "\(ind)\(openElement)\n\(inner)\n\(ind)\(closeElement)"
    }

    private func renderAttributes() -> String {
        guard !attributes.isEmpty else { return "" }
        return " " + attributes
            .map { "\($0.0)=\"\(escapeHTMLAttributeValue($0.1))\"" }
            .joinedString(separator: " ")
    }

    public func addingAttribute(_ key: String, _ value: String) -> SVGLinearGradientElement {
        var newAttributes = attributes
        newAttributes.removeAll { $0.0 == key }
        newAttributes.append((key, value))
        return SVGLinearGradientElement(attributes: newAttributes, children: children)
    }
}

extension SVGLinearGradientElement {
    public func href(_ value: String) -> SVGLinearGradientElement { addingAttribute("href", value) }
    public func xlinkHref(_ value: String) -> SVGLinearGradientElement { addingAttribute("xlink:href", value) }
    public func gradientUnits(_ value: SVGUnitTypes) -> SVGLinearGradientElement { addingAttribute("gradientUnits", value.rawValue) }
    public func gradientTransform(_ value: String) -> SVGLinearGradientElement { addingAttribute("gradientTransform", value) }
    public func gradientTransform(_ value: SVGTransform) -> SVGLinearGradientElement { addingAttribute("gradientTransform", value.value) }
    public func x1(_ value: Length) -> SVGLinearGradientElement { addingAttribute("x1", value.value) }
    public func x1(_ value: Percentage) -> SVGLinearGradientElement { addingAttribute("x1", value.value) }
    public func x1(_ value: LengthPercentage) -> SVGLinearGradientElement { addingAttribute("x1", value.value) }

    public func y1(_ value: Length) -> SVGLinearGradientElement { addingAttribute("y1", value.value) }
    public func y1(_ value: Percentage) -> SVGLinearGradientElement { addingAttribute("y1", value.value) }
    public func y1(_ value: LengthPercentage) -> SVGLinearGradientElement { addingAttribute("y1", value.value) }

    public func x2(_ value: Length) -> SVGLinearGradientElement { addingAttribute("x2", value.value) }
    public func x2(_ value: Percentage) -> SVGLinearGradientElement { addingAttribute("x2", value.value) }
    public func x2(_ value: LengthPercentage) -> SVGLinearGradientElement { addingAttribute("x2", value.value) }

    public func y2(_ value: Length) -> SVGLinearGradientElement { addingAttribute("y2", value.value) }
    public func y2(_ value: Percentage) -> SVGLinearGradientElement { addingAttribute("y2", value.value) }
    public func y2(_ value: LengthPercentage) -> SVGLinearGradientElement { addingAttribute("y2", value.value) }
    public func spreadMethod(_ value: String) -> SVGLinearGradientElement { addingAttribute("spreadMethod", value) }
}

public func linearGradient(@SVGBuilder content: () -> [DOMNode] = { [] }) -> SVGLinearGradientElement { SVGLinearGradientElement(content: content) }
