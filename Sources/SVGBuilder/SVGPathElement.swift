import CSSBuilder
import EmbeddedSwiftUtilities
import HTMLBuilder
import WebTypes
import DOMBuilder

public struct SVGPathElement: SVGGraphicsElementRenderable, Sendable {
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
        .element(ns: .svg, tag: "path", attributes: attributes, children: children)
    }

    public func render(indent: Int = 0) -> String {
        toNode().render(indent: indent)
    }

    public func addingAttribute(_ key: String, _ value: String) -> SVGPathElement {
        var newAttributes = attributes
        newAttributes.removeAll { $0.0 == key }
        newAttributes.append((key, value))
        return SVGPathElement(attributes: newAttributes, children: children)
    }

}

extension SVGPathElement {
    public func d(_ value: String) -> SVGPathElement { addingAttribute("d", value) }
    
    public func d(_ commands: SVGPath.Definition.Command...) -> SVGPathElement {
        var value = ""
        for (index, cmd) in commands.enumerated() {
            value += cmd.pathString
            if index < commands.count - 1 {
                value += " "
            }
        }
        return addingAttribute("d", value)
    }

    public func pathLength(_ value: Double) -> SVGPathElement { addingAttribute("pathLength", doubleToString(value)) }
}

public func path(@SVGBuilder content: () -> [DOMNode] = { [] }) -> SVGPathElement { SVGPathElement(content: content) }
