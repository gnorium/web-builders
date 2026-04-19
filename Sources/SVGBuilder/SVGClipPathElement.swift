import CSSBuilder
import EmbeddedSwiftUtilities
import HTMLBuilder
import WebTypes
import DOMBuilder

public struct SVGClipPathElement: SVGElementRenderable, Sendable {
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
        .element(ns: .svg, tag: "clippath", attributes: attributes, children: children)
    }

    public func addingAttribute(_ key: String, _ value: String) -> SVGClipPathElement {
        var newAttributes = attributes
        newAttributes.removeAll { $0.0 == key }
        newAttributes.append((key, value))
        return SVGClipPathElement(attributes: newAttributes, children: children)
    }
}

extension SVGClipPathElement {
    public func clipPathUnits(_ value: SVGUnitTypes) -> SVGClipPathElement { addingAttribute("clipPathUnits", value.rawValue) }
}

public func clipPath(@SVGBuilder content: () -> [DOMNode] = { [] }) -> SVGClipPathElement { SVGClipPathElement(content: content) }
