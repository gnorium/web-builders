import CSSBuilder
import WebTypes
import DOMBuilder
import EmbeddedSwiftUtilities

public struct HTMLMeterElement: HTMLElementRenderable, Sendable, CustomStringConvertible {
    public let attributes: [(String, String)]
    let children: [DOMNode]

    public init(@HTMLBuilder content: () -> [DOMNode] = { [] }) {
        self.attributes = []
        self.children = content()
    }

    private init(attributes: [(String, String)], children: [DOMNode]) {
        self.attributes = attributes
        self.children = children
    }

        public func toNode() -> DOMNode {
        .element(ns: .html, tag: "meter", attributes: attributes, children: children)
    }

public func render(indent: Int = 0) -> String {
        let ind = String(repeating: "  ", count: indent)
        let attributeString = renderAttributes()
        let openElement = "<meter\(attributeString)>"
        let closeElement = "</meter>"

        guard !children.isEmpty else {
            return ind + openElement + closeElement
        }

        var inner = ""
        for child in children {
            inner += child.render(indent: 0)
        }
        
        return ind + openElement + inner + closeElement
    }

    private func renderAttributes() -> String {
        guard !attributes.isEmpty else { return "" }
        return " " + attributes
            .map { "\($0.0)=\"\(escapeHTMLAttributeValue($0.1))\"" }
            .joinedString(separator: " ")
    }

    public var description: String {
        render(indent: 0)
    }

    public func callAsFunction(@HTMLBuilder content: () -> [DOMNode]) -> HTMLMeterElement {
        HTMLMeterElement(attributes: attributes, children: content())
    }

    public func addingAttribute(_ key: String, _ value: String) -> HTMLMeterElement {
        var newAttributes = attributes
        newAttributes.removeAll { $0.0 == key }
        newAttributes.append((key, value))
        return HTMLMeterElement(attributes: newAttributes, children: children)
    }

}

extension HTMLMeterElement {
    public func value(_ value: Double) -> HTMLMeterElement {
        addingAttribute("value", doubleToString(value))
    }

    public func min(_ value: Double) -> HTMLMeterElement {
        addingAttribute("min", doubleToString(value))
    }

    public func max(_ value: Double) -> HTMLMeterElement {
        addingAttribute("max", doubleToString(value))
    }

    public func low(_ value: Double) -> HTMLMeterElement {
        addingAttribute("low", doubleToString(value))
    }

    public func high(_ value: Double) -> HTMLMeterElement {
        addingAttribute("high", doubleToString(value))
    }

    public func optimum(_ value: Double) -> HTMLMeterElement {
        addingAttribute("optimum", doubleToString(value))
    }
}

public func meter(@HTMLBuilder content: () -> [DOMNode] = { [] }) -> HTMLMeterElement { HTMLMeterElement(content: content) }
