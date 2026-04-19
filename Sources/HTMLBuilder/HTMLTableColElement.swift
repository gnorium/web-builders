import CSSBuilder
import EmbeddedSwiftUtilities
import WebTypes
import DOMBuilder

public struct HTMLTableColElement: HTMLElementRenderable, Sendable, CustomStringConvertible {
    public let attributes: [(String, String)]
    let children: [DOMNode]
    let isColGroup: Bool

    public init(isColGroup: Bool = false, @HTMLBuilder content: () -> [DOMNode] = { [] }) {
        self.attributes = []
        self.children = content()
        self.isColGroup = isColGroup
    }

    private init(attributes: [(String, String)], children: [DOMNode], isColGroup: Bool) {
        self.attributes = attributes
        self.children = children
        self.isColGroup = isColGroup
    }

    public func render() -> DOMNode {
        .element(ns: .html, tag: "tablecol", attributes: attributes, children: children)
    }

    public var description: String {
        serialize(indent: 0)
    }

    public func callAsFunction(@HTMLBuilder content: () -> [DOMNode]) -> HTMLTableColElement {
        HTMLTableColElement(attributes: attributes, children: content(), isColGroup: isColGroup)
    }

    public func addingAttribute(_ key: String, _ value: String) -> HTMLTableColElement {
        var newAttributes = attributes
        newAttributes.removeAll { $0.0 == key }
        newAttributes.append((key, value))
        return HTMLTableColElement(attributes: newAttributes, children: children, isColGroup: isColGroup)
    }

}

extension HTMLTableColElement {
    public func span(_ value: Int) -> HTMLTableColElement {
        addingAttribute("span", intToString(value))
    }
}

public func colgroup(@HTMLBuilder content: () -> [DOMNode] = { [] }) -> HTMLTableColElement { HTMLTableColElement(isColGroup: true, content: content) }
public func col() -> HTMLTableColElement { HTMLTableColElement(isColGroup: false) }
