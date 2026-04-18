import CSSBuilder
import HTMLBuilder
import WebTypes
import EmbeddedSwiftUtilities
import DOMBuilder

public struct SVGGElement: SVGGraphicsElementRenderable, Sendable {
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
        .element(ns: .svg, tag: "g", attributes: attributes, children: children)
    }

    public func render(indent: Int = 0) -> String {
        toNode().render(indent: indent)
    }

    public func addingAttribute(_ key: String, _ value: String) -> SVGGElement {
        var newAttributes = attributes
        newAttributes.removeAll { $0.0 == key }
        newAttributes.append((key, value))
        return SVGGElement(attributes: newAttributes, children: children)
    }
}

public func g(@SVGBuilder content: () -> [DOMNode] = { [] }) -> SVGGElement { SVGGElement(content: content) }
