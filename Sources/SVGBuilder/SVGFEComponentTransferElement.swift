import CSSBuilder
import EmbeddedSwiftUtilities
import HTMLBuilder
import WebTypes
import DOMBuilder

public struct SVGFEComponentTransferElement: SVGFilterPrimitiveStandardAttributes, Sendable {
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
        .element(ns: .svg, tag: "fecomponenttransfer", attributes: attributes, children: children)
    }

public func render(indent: Int = 0) -> String {
        let ind = String(repeating: "  ", count: indent)
        let attributeString = renderAttributes()
        let openElement = "<feComponentTransfer\(attributeString)>"
        let closeElement = "</feComponentTransfer>"

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

    public func addingAttribute(_ key: String, _ value: String) -> SVGFEComponentTransferElement {
        var newAttributes = attributes
        newAttributes.removeAll { $0.0 == key }
        newAttributes.append((key, value))
        return SVGFEComponentTransferElement(attributes: newAttributes, children: children)
    }
}

extension SVGFEComponentTransferElement {
    public func `in`(_ value: SVGFilterInput) -> SVGFEComponentTransferElement { addingAttribute("in", value.value) }
    public func `in`(_ value: String) -> SVGFEComponentTransferElement { addingAttribute("in", value) }
}

public func feComponentTransfer(@SVGBuilder content: () -> [DOMNode] = { [] }) -> SVGFEComponentTransferElement { SVGFEComponentTransferElement(content: content) }
