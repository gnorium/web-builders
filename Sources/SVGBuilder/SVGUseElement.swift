import CSSBuilder
import EmbeddedSwiftUtilities
import HTMLBuilder
import WebTypes
import DOMBuilder

public struct SVGUseElement: SVGGraphicsElementRenderable, Sendable {
    public let attributes: [(String, String)]

    public init() {
        self.attributes = []
    }

    private init(attributes: [(String, String)]) {
        self.attributes = attributes
    }

        public func toNode() -> DOMNode {
        .element(ns: .svg, tag: "use", attributes: attributes, children: [])
    }

public func render(indent: Int = 0) -> String {
        let ind = String(repeating: "  ", count: indent)
        let attributeString = renderAttributes()
        return ind + "<use\(attributeString) />"
    }

    private func renderAttributes() -> String {
        guard !attributes.isEmpty else { return "" }
        return " " + attributes
            .map { "\($0.0)=\"\(escapeHTMLAttributeValue($0.1))\"" }
            .joinedString(separator: " ")
    }

    public func addingAttribute(_ key: String, _ value: String) -> SVGUseElement {
        var newAttributes = attributes
        newAttributes.removeAll { $0.0 == key }
        newAttributes.append((key, value))
        return SVGUseElement(attributes: newAttributes)
    }

}

extension SVGUseElement {
    public func href(_ value: String) -> SVGUseElement { addingAttribute("href", value) }
    public func xlinkHref(_ value: String) -> SVGUseElement { addingAttribute("xlink:href", value) }
    public func xlinkhref(_ value: String) -> SVGUseElement { addingAttribute("xlink:href", value) }
    public func x(_ value: Length) -> SVGUseElement { addingAttribute("x", value.value) }
    public func x(_ value: Percentage) -> SVGUseElement { addingAttribute("x", value.value) }
    public func x(_ value: Int) -> SVGUseElement { addingAttribute("x", "\(intToString(value))px") }
    public func x(_ value: Double) -> SVGUseElement { addingAttribute("x", "\(doubleToString(value))px") }
    public func x(_ value: Float) -> SVGUseElement { addingAttribute("x", "\(doubleToString(Double(value)))px") }

    public func y(_ value: Length) -> SVGUseElement { addingAttribute("y", value.value) }
    public func y(_ value: Percentage) -> SVGUseElement { addingAttribute("y", value.value) }
    public func y(_ value: Int) -> SVGUseElement { addingAttribute("y", "\(intToString(value))px") }
    public func y(_ value: Double) -> SVGUseElement { addingAttribute("y", "\(doubleToString(value))px") }
    public func y(_ value: Float) -> SVGUseElement { addingAttribute("y", "\(doubleToString(Double(value)))px") }

    public func width(_ value: Length) -> SVGUseElement { addingAttribute("width", value.value) }
    public func width(_ value: Percentage) -> SVGUseElement { addingAttribute("width", value.value) }
    public func width(_ value: Int) -> SVGUseElement { addingAttribute("width", "\(intToString(value))px") }
    public func width(_ value: Double) -> SVGUseElement { addingAttribute("width", "\(doubleToString(value))px") }
    public func width(_ value: Float) -> SVGUseElement { addingAttribute("width", "\(doubleToString(Double(value)))px") }

    public func height(_ value: Length) -> SVGUseElement { addingAttribute("height", value.value) }
    public func height(_ value: Percentage) -> SVGUseElement { addingAttribute("height", value.value) }
    public func height(_ value: Int) -> SVGUseElement { addingAttribute("height", "\(intToString(value))px") }
    public func height(_ value: Double) -> SVGUseElement { addingAttribute("height", "\(doubleToString(value))px") }
    public func height(_ value: Float) -> SVGUseElement { addingAttribute("height", "\(doubleToString(Double(value)))px") }
}

public func use() -> SVGUseElement { SVGUseElement() }
