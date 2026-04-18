import CSSBuilder
import WebTypes
import DOMBuilder

public struct HTMLAnchorElement: HTMLElementRenderable, Sendable, CustomStringConvertible {
    public let attributes: [(String, String)]
    let children: [DOMNode]

    public init(@HTMLBuilder content: () -> [DOMNode] = { [] }) {
        self.attributes = []
        self.children = content()
    }

    private init(attributes: [(String, String)], children: [DOMNode]) {
        self.attributes = attributes
        self.children = children
    }

    public func toNode() -> DOMNode {
        .element(ns: .html, tag: "a", attributes: attributes, children: children, selfClosing: false, inline: true)
    }

    public func render(indent: Int = 0) -> String {
        toNode().render(indent: indent)
    }

    public var description: String {
        render(indent: 0)
    }

    public func callAsFunction(@HTMLBuilder content: () -> [DOMNode]) -> HTMLAnchorElement {
        HTMLAnchorElement(attributes: attributes, children: content())
    }

    public func addingAttribute(_ key: String, _ value: String) -> HTMLAnchorElement {
        var newAttributes = attributes
        newAttributes.removeAll { $0.0 == key }
        newAttributes.append((key, value))
        return HTMLAnchorElement(attributes: newAttributes, children: children)
    }

}

extension HTMLAnchorElement {
    public func href(_ value: String) -> HTMLAnchorElement {
        addingAttribute("href", value)
    }

    public func target(_ value: HTMLTarget) -> HTMLAnchorElement {
        addingAttribute("target", value.rawValue)
    }

    public func rel(_ value: HTMLLink.Relationship) -> HTMLAnchorElement {
        addingAttribute("rel", value.rawValue)
    }

    public func rel(_ values: HTMLLink.Relationship...) -> HTMLAnchorElement {
        addingAttribute("rel", values.map { $0.rawValue }.joinedString(separator: " "))
    }

    public func rel(_ values: (HTMLLink.Relationship, HTMLLink.Relationship)) -> HTMLAnchorElement {
        addingAttribute("rel", "\(values.0.rawValue) \(values.1.rawValue)")
    }

    public func rel(_ values: (HTMLLink.Relationship, HTMLLink.Relationship, HTMLLink.Relationship)) -> HTMLAnchorElement {
        addingAttribute("rel", "\(values.0.rawValue) \(values.1.rawValue) \(values.2.rawValue)")
    }

    public func download(_ value: String? = nil) -> HTMLAnchorElement {
        addingAttribute("download", value ?? "")
    }

    public func type(_ value: String) -> HTMLAnchorElement {
        addingAttribute("type", value)
    }
}

public func a(@HTMLBuilder content: () -> [DOMNode] = { [] }) -> HTMLAnchorElement { HTMLAnchorElement(content: content) }
