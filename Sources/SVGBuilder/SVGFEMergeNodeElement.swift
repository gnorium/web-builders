import CSSBuilder
import HTMLBuilder
import WebTypes
import DOMBuilder
import EmbeddedSwiftUtilities

public struct SVGFEMergeNodeElement: SVGElementRenderable, Sendable {
    public let attributes: [(String, String)]

    public init() {
        self.attributes = []
    }

    private init(attributes: [(String, String)]) {
        self.attributes = attributes
    }

        public func toNode() -> DOMNode {
        .element(ns: .svg, tag: "femergenode", attributes: attributes, children: [])
    }

public func render(indent: Int = 0) -> String {
        let ind = String(repeating: "  ", count: indent)
        let attributeString = renderAttributes()
        return ind + "<feMergeNode\(attributeString) />"
    }

    private func renderAttributes() -> String {
        guard !attributes.isEmpty else { return "" }
        return " " + attributes
            .map { "\($0.0)=\"\(escapeHTMLAttributeValue($0.1))\"" }
            .joinedString(separator: " ")
    }

    public func addingAttribute(_ key: String, _ value: String) -> SVGFEMergeNodeElement {
        var newAttributes = attributes
        newAttributes.removeAll { $0.0 == key }
        newAttributes.append((key, value))
        return SVGFEMergeNodeElement(attributes: newAttributes)
    }
}

extension SVGFEMergeNodeElement {
    public func `in`(_ value: SVGFilterInput) -> SVGFEMergeNodeElement { addingAttribute("in", value.value) }
    public func `in`(_ value: String) -> SVGFEMergeNodeElement { addingAttribute("in", value) }
}

public func feMergeNode() -> SVGFEMergeNodeElement { SVGFEMergeNodeElement() }
