#if !os(WASI)

import Foundation
import CSSBuilder
import WebTypes

public struct HTMLTextAreaElement: HTMLElementProtocol, Sendable, CustomStringConvertible {
	public let attributes: [(String, String)]
	let children: [any HTMLProtocol]

	public init(@HTMLBuilder content: () -> [any HTMLProtocol] = { [] }) {
		self.attributes = []
		self.children = content()
	}

	private init(attributes: [(String, String)], children: [any HTMLProtocol]) {
		self.attributes = attributes
		self.children = children
	}

	public func render(indent: Int = 0) -> String {
		let ind = String(repeating: "  ", count: indent)
		let attributeString = renderAttributes()

		let openElement = "<textarea\(attributeString)>"
		let closeElement = "</textarea>"

		guard !children.isEmpty else {
			return ind + openElement + closeElement
		}

		// For textareas, content must be rendered WITHOUT indentation or extra newlines
		// because browsers treat all whitespace inside <textarea> as literal content
		let renderedChildren = children.compactMap {
			let rendered = $0.render(indent: 0)  // No indentation for textarea content
			return rendered.isEmpty ? nil : rendered
		}

		guard !renderedChildren.isEmpty else {
			return ind + openElement + closeElement
		}

		// Join content directly without adding newlines - preserve original content exactly
		let inner = renderedChildren.joined()
		return "\(ind)\(openElement)\(inner)\(closeElement)"
	}

	private func renderAttributes() -> String {
		guard !attributes.isEmpty else { return "" }
		return " " + attributes
			.map { "\($0.0)=\"\(escapeHTMLAttributeValue($0.1))\"" }
			.joined(separator: " ")
	}

	public var description: String {
		render(indent: 0)
	}

	public func callAsFunction(@HTMLBuilder content: () -> [any HTMLProtocol]) -> HTMLTextAreaElement {
		HTMLTextAreaElement(attributes: attributes, children: content())
	}

	public func addingAttribute(_ key: String, _ value: String) -> HTMLTextAreaElement {
		var newAttributes = attributes
		newAttributes.removeAll { $0.0 == key }
		newAttributes.append((key, value))
		return HTMLTextAreaElement(attributes: newAttributes, children: children)
	}

	public func style(prefix: Bool = true, @CSSBuilder _ content: () -> [any CSSProtocol]) -> HTMLTextAreaElement {
		let cssItems = content()
		let className = attributes.first(where: { $0.0 == "class" })?.1 ?? ""
		let existingStyle = attributes.first(where: { $0.0 == "style" })?.1

		let (inlineStyle, _) = processStyleBlock(
			cssItems: cssItems,
			prefix: prefix,
			className: className,
			existingStyle: existingStyle
		)

		return inlineStyle.isEmpty ? self : addingAttribute("style", inlineStyle)
	}
}

// TextArea-specific methods
extension HTMLTextAreaElement {
	public func name(_ value: String) -> HTMLTextAreaElement {
		addingAttribute("name", value)
	}

	public func placeholder(_ value: String) -> HTMLTextAreaElement {
		addingAttribute("placeholder", value)
	}

	public func rows(_ value: Int) -> HTMLTextAreaElement {
		addingAttribute("rows", "\(value)")
	}

	public func cols(_ value: Int) -> HTMLTextAreaElement {
		addingAttribute("cols", "\(value)")
	}

	public func maxlength(_ value: Int) -> HTMLTextAreaElement {
		addingAttribute("maxlength", "\(value)")
	}

	public func minlength(_ value: Int) -> HTMLTextAreaElement {
		addingAttribute("minlength", "\(value)")
	}

	public func required(_ value: Bool = true) -> HTMLTextAreaElement {
		value ? addingAttribute("required", "required") : self
	}

	public func disabled(_ value: Bool = true) -> HTMLTextAreaElement {
		value ? addingAttribute("disabled", "disabled") : self
	}

	public func readonly(_ value: Bool = true) -> HTMLTextAreaElement {
		value ? addingAttribute("readonly", "readonly") : self
	}

	public func autofocus(_ value: Bool = true) -> HTMLTextAreaElement {
		value ? addingAttribute("autofocus", "autofocus") : self
	}

	public func autocomplete(_ value: String) -> HTMLTextAreaElement {
		addingAttribute("autocomplete", value)
	}

	public func autocomplete(_ value: HTMLInput.Autocomplete) -> HTMLTextAreaElement {
		addingAttribute("autocomplete", value.rawValue)
	}

	public func wrap(_ value: String) -> HTMLTextAreaElement {
		addingAttribute("wrap", value)
	}

	public func spellcheck(_ value: Bool = true) -> HTMLTextAreaElement {
		addingAttribute("spellcheck", value ? "true" : "false")
	}
}

public func textarea(@HTMLBuilder content: () -> [any HTMLProtocol] = { [] }) -> HTMLTextAreaElement { HTMLTextAreaElement(content: content) }

#endif
