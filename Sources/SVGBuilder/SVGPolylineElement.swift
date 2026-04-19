import CSSBuilder
import EmbeddedSwiftUtilities
import HTMLBuilder
import WebTypes
import DOMBuilder

public struct SVGPolylineElement: SVGGraphicsElementRenderable, Sendable {
    public let attributes: [(String, String)]

    public init() {
        self.attributes = []
    }

    private init(attributes: [(String, String)]) {
        self.attributes = attributes
    }

    public func render() -> DOMNode {
        .element(ns: .svg, tag: "polyline", attributes: attributes, children: [])
    }

    public func addingAttribute(_ key: String, _ value: String) -> SVGPolylineElement {
        var newAttributes = attributes
        newAttributes.removeAll { $0.0 == key }
        newAttributes.append((key, value))
        return SVGPolylineElement(attributes: newAttributes)
    }

}

extension SVGPolylineElement {
    public func points(_ value: String) -> SVGPolylineElement { addingAttribute("points", value) }
}

public func polyline() -> SVGPolylineElement { SVGPolylineElement() }
