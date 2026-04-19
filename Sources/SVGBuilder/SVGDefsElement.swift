import CSSBuilder
import EmbeddedSwiftUtilities
import HTMLBuilder
import WebTypes
import DOMBuilder

public struct SVGDefsElement: SVGElementRenderable, Sendable {
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
        .element(ns: .svg, tag: "defs", attributes: attributes, children: children)
    }

    public func addingAttribute(_ key: String, _ value: String) -> SVGDefsElement {
        var newAttributes = attributes
        newAttributes.removeAll { $0.0 == key }
        newAttributes.append((key, value))
        return SVGDefsElement(attributes: newAttributes, children: children)
    }
}

public func defs(@SVGBuilder content: () -> [DOMNode] = { [] }) -> SVGDefsElement { SVGDefsElement(content: content) }
