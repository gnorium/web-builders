import CSSBuilder
import HTMLBuilder
import WebTypes
import DOMBuilder
import EmbeddedSwiftUtilities

public struct SVGSymbolElement: SVGElementRenderable, Sendable {
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
        .element(ns: .svg, tag: "symbol", attributes: attributes, children: children)
    }

    public func addingAttribute(_ key: String, _ value: String) -> SVGSymbolElement {
        var newAttributes = attributes
        newAttributes.removeAll { $0.0 == key }
        newAttributes.append((key, value))
        return SVGSymbolElement(attributes: newAttributes, children: children)
    }
}

extension SVGSymbolElement {
    public func viewBox(_ minX: Double, _ minY: Double, _ width: Double, _ height: Double) -> SVGSymbolElement {
        addingAttribute("viewBox", "\(doubleToString(minX)) \(doubleToString(minY)) \(doubleToString(width)) \(doubleToString(height))")
    }

    public func viewBox(_ minX: Int, _ minY: Int, _ width: Int, _ height: Int) -> SVGSymbolElement {
        addingAttribute("viewBox", "\(intToString(minX)) \(intToString(minY)) \(intToString(width)) \(intToString(height))")
    }

    public func preserveAspectRatio(_ value: String) -> SVGSymbolElement { addingAttribute("preserveAspectRatio", value) }
}

public func symbol(@SVGBuilder _ content: () -> [DOMNode] = { [] }) -> SVGSymbolElement { SVGSymbolElement(content: content) }
