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

        public func toNode() -> DOMNode {
        .element(ns: .html, tag: "tablecol", attributes: attributes, children: children)
    }

public func render(indent: Int = 0) -> String {
        let ind = String(repeating: "  ", count: indent)
        let attributeString = renderAttributes()
        let tag = isColGroup ? "colgroup" : "col"
        
        if isColGroup {
            let openElement = "<\(tag)\(attributeString)>"
            let closeElement = "</\(tag)>"
            
            guard !children.isEmpty else {
                return ind + openElement + closeElement
            }
            
            var inner = ""
            for (index, child) in children.enumerated() {
                inner += child.render(indent: indent + 1)
                if index < children.count - 1 {
                    inner += "\n"
                }
            }
            return "\(ind)\(openElement)\n\(inner)\n\(ind)\(closeElement)"
        } else {
            // col is a void element
            return ind + "<\(tag)\(attributeString)>"
        }
    }

    private func renderAttributes() -> String {
        guard !attributes.isEmpty else { return "" }
        return " " + attributes
            .map { "\($0.0)=\"\(escapeHTMLAttributeValue($0.1))\"" }
            .joinedString(separator: " ")
    }

    public var description: String {
        render(indent: 0)
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
