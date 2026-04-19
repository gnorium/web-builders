import CSSBuilder
import EmbeddedSwiftUtilities
import HTMLBuilder
import WebTypes
import DOMBuilder

public struct SVGMetadataElement: SVGElementRenderable, Sendable {
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

    public func render() -> DOMNode {
        .element(ns: .svg, tag: "metadata", attributes: attributes, children: children)
    }

    public func addingAttribute(_ key: String, _ value: String) -> SVGMetadataElement {
        var newAttributes = attributes
        newAttributes.removeAll { $0.0 == key }
        newAttributes.append((key, value))
        return SVGMetadataElement(attributes: newAttributes, children: children)
    }
}

public func metadata(@HTMLBuilder content: () -> [DOMNode] = { [] }) -> SVGMetadataElement { SVGMetadataElement(content: content) }
