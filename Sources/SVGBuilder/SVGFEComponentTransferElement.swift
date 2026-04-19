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

    public func render() -> DOMNode {
        .element(ns: .svg, tag: "feComponentTransfer", attributes: attributes, children: children)
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
