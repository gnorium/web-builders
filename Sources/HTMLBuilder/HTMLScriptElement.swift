#if CLIENT

import EmbeddedSwiftUtilities

#endif

import JSBuilder
import CSSBuilder
import WebTypes
import DOMBuilder

public struct HTMLScriptElement: HTMLElementRenderable, Sendable, CustomStringConvertible {
    public let attributes: [(String, String)]
    let jsItems: [JSStatement]

    public init(@JSBuilder content: () -> [JSStatement] = { [] }) {
        self.attributes = []
        self.jsItems = content()
    }

    private init(attributes: [(String, String)], jsItems: [JSStatement]) {
        self.attributes = attributes
        self.jsItems = jsItems
    }

    public func render() -> DOMNode {
        var jsCode = ""
        for (index, item) in jsItems.enumerated() {
            jsCode += item.serialize(indent: 0)
            if index < jsItems.count - 1 {
                jsCode += "\n"
            }
        }
        return .element(
            ns: .html,
            tag: "script",
            attributes: attributes,
            children: jsCode.isEmpty ? [] : [.text(jsCode, isRaw: true)]
        )
    }

    public func serialize(indent: Int = 0) -> String {
        let ind = String(repeating: "  ", count: indent)
        let attributeString = renderAttributes()
        let openElement = "<script\(attributeString)>"
        let closeElement = "</script>"

        guard !jsItems.isEmpty else {
            return ind + openElement + closeElement
        }

        var jsCode = ""
        for (index, item) in jsItems.enumerated() {
            jsCode += item.serialize(indent: indent + 1)
            if index < jsItems.count - 1 {
                jsCode += "\n"
            }
        }

        return "\(ind)\(openElement)\n\(jsCode)\n\(ind)\(closeElement)"
    }

    private func renderAttributes() -> String {
        guard !attributes.isEmpty else { return "" }
        return " " + attributes
            .map { "\($0.0)=\"\(escapeHTMLAttributeValue($0.1))\"" }
            .joinedString(separator: " ")
    }

    public var description: String {
        serialize(indent: 0)
    }

    public func addingAttribute(_ key: String, _ value: String) -> HTMLScriptElement {
        var newAttributes = attributes
        newAttributes.removeAll { $0.0 == key }
        newAttributes.append((key, value))
        return HTMLScriptElement(attributes: newAttributes, jsItems: jsItems)
    }

}

extension HTMLScriptElement {
    public func src(_ value: String) -> HTMLScriptElement {
        addingAttribute("src", value)
    }

    public func type(_ value: String) -> HTMLScriptElement {
        addingAttribute("type", value)
    }

    public func async(_ value: Bool = true) -> HTMLScriptElement {
        value ? addingAttribute("async", "async") : self
    }

    public func defer_(_ value: Bool = true) -> HTMLScriptElement {
        value ? addingAttribute("defer", "defer") : self
    }

    public func crossorigin(_ value: String) -> HTMLScriptElement {
        addingAttribute("crossorigin", value)
    }

    public func integrity(_ value: String) -> HTMLScriptElement {
        addingAttribute("integrity", value)
    }
}

public func script(@JSBuilder _ content: () -> [JSStatement] = { [] }) -> HTMLScriptElement { HTMLScriptElement(content: content) }
public func script(src: String) -> HTMLScriptElement { HTMLScriptElement().src(src) }
