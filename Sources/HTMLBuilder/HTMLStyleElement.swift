#if CLIENT

import EmbeddedSwiftUtilities

#endif

import CSSBuilder
import CSSOMBuilder
import WebTypes
import DOMBuilder

public struct HTMLStyleElement: HTMLElementRenderable, Sendable, CustomStringConvertible {
    public let attributes: [(String, String)]
    let cssItems: [CSSRule]

    public init(@CSSBuilder content: () -> [CSSRule] = { [] }) {
        self.attributes = []
        self.cssItems = content()
    }

    public init(css: String) {
        self.attributes = []
        self.cssItems = [.raw(css)]
    }

    private init(attributes: [(String, String)], cssItems: [CSSRule]) {
        self.attributes = attributes
        self.cssItems = cssItems
    }

    public func render() -> DOMNode {
        var cssCode = ""
        for (index, item) in cssItems.enumerated() {
            cssCode += item.serialize(indent: 0)
            if index < cssItems.count - 1 {
                cssCode += "\n"
            }
        }
        return .element(
            ns: .html,
            tag: "style",
            attributes: attributes,
            children: cssCode.isEmpty ? [] : [.text(cssCode, isRaw: true)]
        )
    }

    public var description: String {
        serialize(indent: 0)
    }

    public func addingAttribute(_ key: String, _ value: String) -> HTMLStyleElement {
        var newAttributes = attributes
        newAttributes.removeAll { $0.0 == key }
        newAttributes.append((key, value))
        return HTMLStyleElement(attributes: newAttributes, cssItems: cssItems)
    }

}

extension HTMLStyleElement {
    public func media(_ value: String) -> HTMLStyleElement {
        addingAttribute("media", value)
    }

    public func type(_ value: String) -> HTMLStyleElement {
        addingAttribute("type", value)
    }
}

public func style(@CSSBuilder _ content: () -> [CSSRule] = { [] }) -> HTMLStyleElement { HTMLStyleElement(content: content) }

public func style(_ content: String) -> HTMLStyleElement { HTMLStyleElement(css: content) }
