import CSSBuilder
import EmbeddedSwiftUtilities
import WebTypes
import DOMBuilder

public struct HTMLInputElement: HTMLElementRenderable, Sendable, CustomStringConvertible {
    public let attributes: [(String, String)]

    public init() {
        self.attributes = []
    }

    private init(attributes: [(String, String)]) {
        self.attributes = attributes
    }

        public func toNode() -> DOMNode {
        .element(ns: .html, tag: "input", attributes: attributes, children: [])
    }

public func render(indent: Int = 0) -> String {
        let ind = String(repeating: "  ", count: indent)
        let attributeString = renderAttributes()
        return ind + "<input\(attributeString) />"
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

    public func addingAttribute(_ key: String, _ value: String) -> HTMLInputElement {
        var newAttributes = attributes
        newAttributes.removeAll { $0.0 == key }
        newAttributes.append((key, value))
        return HTMLInputElement(attributes: newAttributes)
    }

}

extension HTMLInputElement {
    public func type(_ value: HTMLInput.`Type`) -> HTMLInputElement {
        addingAttribute("type", value.rawValue)
    }

    public func name(_ value: String) -> HTMLInputElement {
        addingAttribute("name", value)
    }

    public func value(_ value: String) -> HTMLInputElement {
        addingAttribute("value", value)
    }

    public func placeholder(_ value: String) -> HTMLInputElement {
        addingAttribute("placeholder", value)
    }

    public func required(_ value: Bool = true) -> HTMLInputElement {
        value ? addingAttribute("required", "required") : self
    }

    public func readonly(_ value: Bool = true) -> HTMLInputElement {
        value ? addingAttribute("readonly", "readonly") : self
    }

    public func checked(_ value: Bool = true) -> HTMLInputElement {
        value ? addingAttribute("checked", "checked") : self
    }

    public func autofocus(_ value: Bool = true) -> HTMLInputElement {
        value ? addingAttribute("autofocus", "autofocus") : self
    }

    public func min(_ value: String) -> HTMLInputElement {
        addingAttribute("min", value)
    }

    public func min(_ value: Int) -> HTMLInputElement {
        addingAttribute("min", intToString(value))
    }

    public func max(_ value: String) -> HTMLInputElement {
        addingAttribute("max", value)
    }

    public func max(_ value: Int) -> HTMLInputElement {
        addingAttribute("max", intToString(value))
    }

    public func step(_ value: String) -> HTMLInputElement {
        addingAttribute("step", value)
    }

    public func pattern(_ value: String) -> HTMLInputElement {
        addingAttribute("pattern", value)
    }

    public func autocomplete(_ value: String) -> HTMLInputElement {
        addingAttribute("autocomplete", value)
    }

    public func autocomplete(_ value: HTMLInput.Autocomplete) -> HTMLInputElement {
        addingAttribute("autocomplete", value.rawValue)
    }

    public func disabled(_ value: Bool = true) -> HTMLInputElement {
        value ? addingAttribute("disabled", "disabled") : self
    }
}

public func input() -> HTMLInputElement { HTMLInputElement() }
