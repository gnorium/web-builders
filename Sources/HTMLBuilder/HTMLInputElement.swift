#if !os(WASI)

import Foundation
import CSSBuilder
import JSBuilder
import WebTypes

public struct HTMLInputElement: HTMLElement, Sendable, CustomStringConvertible {
	public let attributes: [(String, String)]

	public init() {
		self.attributes = []
	}

	private init(attributes: [(String, String)]) {
		self.attributes = attributes
	}

	public func render(indent: Int = 0) -> String {
		let ind = String(repeating: "  ", count: indent)
		let attributeString = renderAttributes()
		return ind + "<input\(attributeString) />"
	}

	private func renderAttributes() -> String {
		guard !attributes.isEmpty else { return "" }
		return " " + attributes
			.map { "\($0.0)=\"\($0.1)\"" }
			.joined(separator: " ")
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

// Input-specific methods
extension HTMLInputElement {
	public func type(_ value: HTMLInput.`Type`) -> HTMLInputElement {
		addingAttribute("type", value.rawValue)
	}

	public func value(_ value: String) -> HTMLInputElement {
		addingAttribute("value", value)
	}

	public func placeholder(_ value: String) -> HTMLInputElement {
		addingAttribute("placeholder", value)
	}

	public func name(_ value: String) -> HTMLInputElement {
		addingAttribute("name", value)
	}

	public func required(_ value: Bool = true) -> HTMLInputElement {
		value ? addingAttribute("required", "required") : self
	}

	public func disabled(_ value: Bool = true) -> HTMLInputElement {
		value ? addingAttribute("disabled", "disabled") : self
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

	public func autocomplete(_ value: String) -> HTMLInputElement {
		addingAttribute("autocomplete", value)
	}

	public func autocomplete(_ value: HTMLInput.Autocomplete) -> HTMLInputElement {
		addingAttribute("autocomplete", value.rawValue)
	}

	public func maxlength(_ value: Int) -> HTMLInputElement {
		addingAttribute("maxlength", "\(value)")
	}

	public func min(_ value: String) -> HTMLInputElement {
		addingAttribute("min", value)
	}

	public func min(_ value: Int) -> HTMLInputElement {
		addingAttribute("min", "\(value)")
	}

	public func max(_ value: String) -> HTMLInputElement {
		addingAttribute("max", value)
	}

	public func max(_ value: Int) -> HTMLInputElement {
		addingAttribute("max", "\(value)")
	}

	public func step(_ value: String) -> HTMLInputElement {
		addingAttribute("step", value)
	}

	public func pattern(_ value: String) -> HTMLInputElement {
		addingAttribute("pattern", value)
	}

	public func accept(_ value: String) -> HTMLInputElement {
		addingAttribute("accept", value)
	}

	public func multiple(_ value: Bool = true) -> HTMLInputElement {
		value ? addingAttribute("multiple", "multiple") : self
	}

	public func ariaDescribedby(_ value: String?) -> HTMLInputElement {
		guard let value = value else { return self }
		return addingAttribute("aria-describedby", value)
	}
}

// Input-specific event handlers
extension HTMLInputElement {
	public func onClick(_ value: String) -> HTMLInputElement {
		addingAttribute("onclick", value)
	}

	public func onChange(_ value: String) -> HTMLInputElement {
		addingAttribute("onchange", value)
	}

	public func onInput(_ value: String) -> HTMLInputElement {
		addingAttribute("oninput", value)
	}

	public func onFocus(_ value: String) -> HTMLInputElement {
		addingAttribute("onfocus", value)
	}

	public func onBlur(_ value: String) -> HTMLInputElement {
		addingAttribute("onblur", value)
	}

	public func onKeyDown(_ value: String) -> HTMLInputElement {
		addingAttribute("onkeydown", value)
	}

	public func onKeyUp(_ value: String) -> HTMLInputElement {
		addingAttribute("onkeyup", value)
	}

	public func style(prefix: Bool = true, @CSSBuilder _ content: () -> [CSS]) -> HTMLInputElement {
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

public func input() -> HTMLInputElement { HTMLInputElement() }

#endif
