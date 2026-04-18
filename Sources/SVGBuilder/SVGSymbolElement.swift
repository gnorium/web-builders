import CSSBuilder
import HTMLBuilder
import WebTypes
import DOMBuilder
import EmbeddedSwiftUtilities

public struct SVGSymbolElement: SVGElementRenderable, Sendable {
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
        .element(ns: .svg, tag: "symbol", attributes: attributes, children: children)
    }

public func render(indent: Int = 0) -> String {
        let ind = String(repeating: "  ", count: indent)
        let attributeString = renderAttributes()
        let openElement = "<symbol\(attributeString)>"
        let closeElement = "</symbol>"

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

    public func addingAttribute(_ key: String, _ value: String) -> SVGSymbolElement {
        var newAttributes = attributes
        newAttributes.removeAll { $0.0 == key }
        newAttributes.append((key, value))
        return SVGSymbolElement(attributes: newAttributes, children: children)
    }
}

extension SVGSymbolElement {
    public func viewBox(_ minX: Double, _ minY: Double, _ width: Double, _ height: Double) -> SVGSymbolElement {
        addingAttribute("viewBox", "\(doubleToString(minX)) \(doubleToString(minY)) \(doubleToString(width)) \(doubleToString(height))")
    }

    public func viewBox(_ minX: Int, _ minY: Int, _ width: Int, _ height: Int) -> SVGSymbolElement {
        addingAttribute("viewBox", "\(intToString(minX)) \(intToString(minY)) \(intToString(width)) \(intToString(height))")
    }

    public func preserveAspectRatio(_ value: String) -> SVGSymbolElement { addingAttribute("preserveAspectRatio", value) }
}

public func symbol(@SVGBuilder _ content: () -> [DOMNode] = { [] }) -> SVGSymbolElement { SVGSymbolElement(content: content) }
