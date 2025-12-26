#if !os(WASI)

import Foundation
import CSSBuilder
import WebTypes

public struct HTMLTextAreaElement: HTMLElement, Sendable, CustomStringConvertible {
	public let attributes: [(String, String)]
	let children: [any HTML]

	public init(@HTMLBuilder content: () -> [any HTML] = { [] }) {
		self.attributes = []
		self.children = content()
	}

	private init(attributes: [(String, String)], children: [any HTML]) {
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

		if children.count == 1, let textChild = children.first as? HTMLText, !textChild.content.contains("\n") {
			return ind + openElement + textChild.content + closeElement
		}

		let renderedChildren = children.compactMap {
			let rendered = $0.render(indent: indent + 1)
			return rendered.isEmpty ? nil : rendered
		}

		guard !renderedChildren.isEmpty else {
			return ind + openElement + closeElement
		}

		let inner = renderedChildren.joined(separator: "\n")
		return "\(ind)\(openElement)\n\(inner)\n\(ind)\(closeElement)"
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

	public func callAsFunction(@HTMLBuilder content: () -> [any HTML]) -> HTMLTextAreaElement {
		HTMLTextAreaElement(attributes: attributes, children: content())
	}

	public func addingAttribute(_ key: String, _ value: String) -> HTMLTextAreaElement {
		var newAttributes = attributes
		newAttributes.removeAll { $0.0 == key }
		newAttributes.append((key, value))
		return HTMLTextAreaElement(attributes: newAttributes, children: children)
	}

	public func style(prefix: Bool = true, @CSSBuilder _ content: () -> [any CSS]) -> HTMLTextAreaElement {
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

public func textarea(@HTMLBuilder content: () -> [any HTML] = { [] }) -> HTMLTextAreaElement { HTMLTextAreaElement(content: content) }

#endif
