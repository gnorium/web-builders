#if CLIENT

import EmbeddedSwiftUtilities

#endif

import CSSBuilder
import WebTypes
import DOMBuilder

public struct HTMLLinkElement: HTMLElementRenderable, Sendable, CustomStringConvertible {
    public let attributes: [(String, String)]

    public init() {
        self.attributes = []
    }

    private init(attributes: [(String, String)]) {
        self.attributes = attributes
    }

    public func render() -> DOMNode {
        .element(ns: .html, tag: "link", attributes: attributes, children: [])
    }

    public var description: String {
        serialize(indent: 0)
    }

    public func addingAttribute(_ key: String, _ value: String) -> HTMLLinkElement {
        var newAttributes = attributes
        newAttributes.removeAll { $0.0 == key }
        newAttributes.append((key, value))
        return HTMLLinkElement(attributes: newAttributes)
    }

}

extension HTMLLinkElement {
    public func href(_ value: String) -> HTMLLinkElement {
        addingAttribute("href", value)
    }

    @_disfavoredOverload
    public func rel(_ value: String) -> HTMLLinkElement {
        addingAttribute("rel", value)
    }

    public func rel(_ value: HTMLLink.Relationship) -> HTMLLinkElement {
        addingAttribute("rel", value.rawValue)
    }

    public func rel(_ values: HTMLLink.Relationship...) -> HTMLLinkElement {
        addingAttribute("rel", values.map { $0.rawValue }.joinedString(separator: " "))
    }

    public func type(_ value: String) -> HTMLLinkElement {
        addingAttribute("type", value)
    }

    @_disfavoredOverload
    public func `as`(_ value: String) -> HTMLLinkElement {
        addingAttribute("as", value)
    }

    public func `as`(_ value: HTMLLink.As) -> HTMLLinkElement {
        addingAttribute("as", value.rawValue)
    }

    @_disfavoredOverload
    public func crossorigin(_ value: String) -> HTMLLinkElement {
        addingAttribute("crossorigin", value)
    }

    public func crossorigin(_ value: HTMLLink.CrossOrigin) -> HTMLLinkElement {
        addingAttribute("crossorigin", value.rawValue)
    }

    public func media(_ value: String) -> HTMLLinkElement {
        addingAttribute("media", value)
    }

    public func integrity(_ value: String) -> HTMLLinkElement {
        addingAttribute("integrity", value)
    }

    public func sizes(_ width: Int, _ height: Int) -> HTMLLinkElement {
        addingAttribute("sizes", "\(width)x\(height)")
    }
}

public func link() -> HTMLLinkElement { HTMLLinkElement() }
