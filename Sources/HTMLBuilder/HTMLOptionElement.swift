#if CLIENT

import EmbeddedSwiftUtilities

#endif

import CSSBuilder
import DOMBuilder

public struct HTMLOptionElement: HTMLElementRenderable, Sendable, CustomStringConvertible {
    public let attributes: [(String, String)]
    let content: String

    public init(_ content: String = "") {
        self.attributes = []
        self.content = content
    }

    private init(attributes: [(String, String)], content: String) {
        self.attributes = attributes
        self.content = content
    }

    public func render() -> DOMNode {
        .element(ns: .html, tag: "option", attributes: attributes, children: [])
    }

    public var description: String {
        serialize(indent: 0)
    }

    public func addingAttribute(_ key: String, _ value: String) -> HTMLOptionElement {
        var newAttributes = attributes
        newAttributes.removeAll { $0.0 == key }
        newAttributes.append((key, value))
        return HTMLOptionElement(attributes: newAttributes, content: content)
    }

}

extension HTMLOptionElement {
    public func value(_ value: String) -> HTMLOptionElement {
        addingAttribute("value", value)
    }

    public func selected(_ value: Bool = true) -> HTMLOptionElement {
        value ? addingAttribute("selected", "selected") : self
    }

    public func label(_ value: String) -> HTMLOptionElement {
        addingAttribute("label", value)
    }
}

public func option(_ content: String = "") -> HTMLOptionElement { HTMLOptionElement(content) }
public func option(@HTMLBuilder content: () -> [DOMNode]) -> HTMLOptionElement {
    let children = content()
    let text = (children.compactMap { $0.textContent } as [String]).joinedString(separator: "")
    return HTMLOptionElement(text)
}
