#if CLIENT

import EmbeddedSwiftUtilities

#endif

import CSSBuilder
import WebTypes
import DOMBuilder

public struct HTMLAudioElement: HTMLElementRenderable, Sendable, CustomStringConvertible {
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

    public func render() -> DOMNode {
        .element(ns: .html, tag: "audio", attributes: attributes, children: children)
    }

    public var description: String {
        serialize(indent: 0)
    }

    public func callAsFunction(@HTMLBuilder content: () -> [DOMNode]) -> HTMLAudioElement {
        HTMLAudioElement(attributes: attributes, children: content())
    }

    public func addingAttribute(_ key: String, _ value: String) -> HTMLAudioElement {
        var newAttributes = attributes
        newAttributes.removeAll { $0.0 == key }
        newAttributes.append((key, value))
        return HTMLAudioElement(attributes: newAttributes, children: children)
    }

}

extension HTMLAudioElement {
    public func src(_ value: String) -> HTMLAudioElement {
        addingAttribute("src", value)
    }

    public func autoplay(_ value: Bool = true) -> HTMLAudioElement {
        value ? addingAttribute("autoplay", "autoplay") : self
    }

    public func controls(_ value: Bool = true) -> HTMLAudioElement {
        value ? addingAttribute("controls", "controls") : self
    }

    public func loop(_ value: Bool = true) -> HTMLAudioElement {
        value ? addingAttribute("loop", "loop") : self
    }

    public func muted(_ value: Bool = true) -> HTMLAudioElement {
        value ? addingAttribute("muted", "muted") : self
    }

    public func crossorigin(_ value: String) -> HTMLAudioElement {
        addingAttribute("crossorigin", value)
    }

    public func crossorigin(_ value: HTMLLink.CrossOrigin) -> HTMLAudioElement {
        addingAttribute("crossorigin", value.rawValue)
    }
}

public func audio(@HTMLBuilder content: () -> [DOMNode] = { [] }) -> HTMLAudioElement { HTMLAudioElement(content: content) }
public func audio(src: String) -> HTMLAudioElement { HTMLAudioElement().src(src) }
