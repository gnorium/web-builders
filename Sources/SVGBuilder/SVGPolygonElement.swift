import CSSBuilder
import EmbeddedSwiftUtilities
import HTMLBuilder
import WebTypes
import DOMBuilder

public struct SVGPolygonElement: SVGGraphicsElementRenderable, Sendable {
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
        .element(ns: .svg, tag: "polygon", attributes: attributes, children: children)
    }

    public func addingAttribute(_ key: String, _ value: String) -> SVGPolygonElement {
        var newAttributes = attributes
        newAttributes.removeAll { $0.0 == key }
        newAttributes.append((key, value))
        return SVGPolygonElement(attributes: newAttributes, children: children)
    }

}

extension SVGPolygonElement {
    public func points(_ coordinates: (Double, Double)...) -> SVGPolygonElement {
        let pointsString = stringJoin(coordinates.map { stringConcat(doubleToString($0.0), ",", doubleToString($0.1)) }, separator: " ")
        return addingAttribute("points", pointsString)
    }
}

public func polygon(@SVGBuilder content: () -> [DOMNode] = { [] }) -> SVGPolygonElement { SVGPolygonElement(content: content) }
