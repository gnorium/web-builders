import CSSBuilder
import HTMLBuilder
import WebTypes
import DOMBuilder
import EmbeddedSwiftUtilities

public struct SVGFEMergeElement: SVGFilterPrimitiveStandardAttributes, Sendable {
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
        .element(ns: .svg, tag: "femerge", attributes: attributes, children: children)
    }

    public func addingAttribute(_ key: String, _ value: String) -> SVGFEMergeElement {
        var newAttributes = attributes
        newAttributes.removeAll { $0.0 == key }
        newAttributes.append((key, value))
        return SVGFEMergeElement(attributes: newAttributes, children: children)
    }
}

public func feMerge(@SVGBuilder content: () -> [DOMNode] = { [] }) -> SVGFEMergeElement { SVGFEMergeElement(content: content) }
