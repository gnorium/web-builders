import CSSBuilder
import EmbeddedSwiftUtilities
import HTMLBuilder
import WebTypes
import DOMBuilder

public struct SVGStopElement: SVGElementRenderable, Sendable {
    public let attributes: [(String, String)]

    public init() {
        self.attributes = []
    }

    private init(attributes: [(String, String)]) {
        self.attributes = attributes
    }

    public func render() -> DOMNode {
        .element(ns: .svg, tag: "stop", attributes: attributes, children: [])
    }

    public func addingAttribute(_ key: String, _ value: String) -> SVGStopElement {
        var newAttributes = attributes
        newAttributes.removeAll { $0.0 == key }
        newAttributes.append((key, value))
        return SVGStopElement(attributes: newAttributes)
    }
}

extension SVGStopElement {
    public func offset(_ value: String) -> SVGStopElement { addingAttribute("offset", value) }
    public func offset(_ value: Percentage) -> SVGStopElement { addingAttribute("offset", value.value) }
    public func stopColor(_ value: CSSColor) -> SVGStopElement { addingAttribute("stop-color", value.value) }
    public func stopOpacity(_ value: Double) -> SVGStopElement { addingAttribute("stop-opacity", doubleToString(value)) }
}

public func stop() -> SVGStopElement { SVGStopElement() }
