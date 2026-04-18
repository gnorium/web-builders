import CSSBuilder
import WebTypes
import DOMBuilder

public struct HTMLTableCellElement: HTMLElementRenderable, Sendable, CustomStringConvertible {
    let name: String
    public let attributes: [(String, String)]
    let children: [DOMNode]

    public init(name: String, @HTMLBuilder content: () -> [DOMNode] = { [] }) {
        self.name = name
        self.attributes = []
        self.children = content()
    }

    private init(name: String, attributes: [(String, String)], children: [DOMNode]) {
        self.name = name
        self.attributes = attributes
        self.children = children
    }

        public func toNode() -> DOMNode {
        .element(ns: .html, tag: "tablecell", attributes: attributes, children: children)
    }

public func render(indent: Int = 0) -> String {
        let ind = String(repeating: "  ", count: indent)
        let attributeString = renderAttributes()
        let openElement = "<\(name)\(attributeString)>"
        let closeElement = "</\(name)>"

        guard !children.isEmpty else {
            return ind + openElement + closeElement
        }

        var inner = ""
        for child in children {
            inner += child.render(indent: 0)
        }
        
        // Table cells often contain small content, render on one line if possible
        if inner.contains("\n") {
             var multiInner = ""
             for (index, child) in children.enumerated() {
                 multiInner += child.render(indent: indent + 1)
                 if index < children.count - 1 { multiInner += "\n" }
             }
             return "\(ind)\(openElement)\n\(multiInner)\n\(ind)\(closeElement)"
        }
        
        return ind + openElement + inner + closeElement
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

    public func callAsFunction(@HTMLBuilder content: () -> [DOMNode]) -> HTMLTableCellElement {
        HTMLTableCellElement(name: name, attributes: attributes, children: content())
    }

    public func addingAttribute(_ key: String, _ value: String) -> HTMLTableCellElement {
        var newAttributes = attributes
        newAttributes.removeAll { $0.0 == key }
        newAttributes.append((key, value))
        return HTMLTableCellElement(name: name, attributes: newAttributes, children: children)
    }

}

extension HTMLTableCellElement {
    public func colspan(_ value: Int) -> HTMLTableCellElement {
        addingAttribute("colspan", "\(value)")
    }

    public func rowspan(_ value: Int) -> HTMLTableCellElement {
        addingAttribute("rowspan", "\(value)")
    }

    public func headers(_ value: String) -> HTMLTableCellElement {
        addingAttribute("headers", value)
    }

    public func scope(_ value: String) -> HTMLTableCellElement {
        addingAttribute("scope", value)
    }

    public func scope(_ value: HTMLScope) -> HTMLTableCellElement {
        addingAttribute("scope", value.rawValue)
    }
}

public func td(@HTMLBuilder content: () -> [DOMNode] = { [] }) -> HTMLTableCellElement { HTMLTableCellElement(name: "td", content: content) }
public func th(@HTMLBuilder content: () -> [DOMNode] = { [] }) -> HTMLTableCellElement { HTMLTableCellElement(name: "th", content: content) }
