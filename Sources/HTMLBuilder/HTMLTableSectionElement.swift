import CSSBuilder
import WebTypes
import DOMBuilder

public struct HTMLTableSectionElement: HTMLElementRenderable, Sendable, CustomStringConvertible {
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
        .element(ns: .html, tag: "tablesection", attributes: attributes, children: children)
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
        var actualChildrenCount = 0
        for child in children {
            let rendered = child.render(indent: indent + 1)
            if !rendered.isEmpty {
                if actualChildrenCount > 0 { inner += "\n" }
                inner += rendered
                actualChildrenCount += 1
            }
        }

        return "\(ind)\(openElement)\n\(inner)\n\(ind)\(closeElement)"
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

    public func callAsFunction(@HTMLBuilder content: () -> [DOMNode]) -> HTMLTableSectionElement {
        HTMLTableSectionElement(name: name, attributes: attributes, children: content())
    }

    public func addingAttribute(_ key: String, _ value: String) -> HTMLTableSectionElement {
        var newAttributes = attributes
        newAttributes.removeAll { $0.0 == key }
        newAttributes.append((key, value))
        return HTMLTableSectionElement(name: name, attributes: newAttributes, children: children)
    }

}

public func thead(@HTMLBuilder content: () -> [DOMNode] = { [] }) -> HTMLTableSectionElement { HTMLTableSectionElement(name: "thead", content: content) }
public func tbody(@HTMLBuilder content: () -> [DOMNode] = { [] }) -> HTMLTableSectionElement { HTMLTableSectionElement(name: "tbody", content: content) }
public func tfoot(@HTMLBuilder content: () -> [DOMNode] = { [] }) -> HTMLTableSectionElement { HTMLTableSectionElement(name: "tfoot", content: content) }
