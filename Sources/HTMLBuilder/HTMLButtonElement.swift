#if !os(WASI)

import Foundation
import CSSBuilder
import WebTypes

public struct HTMLButtonElement: HTMLElement, Sendable, CustomStringConvertible {
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

		let openElement = "<button\(attributeString)>"
		let closeElement = "</button>"

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

	public func callAsFunction(@HTMLBuilder content: () -> [any HTML]) -> HTMLButtonElement {
		HTMLButtonElement(attributes: attributes, children: content())
	}

	public func addingAttribute(_ key: String, _ value: String) -> HTMLButtonElement {
		var newAttributes = attributes
		newAttributes.removeAll { $0.0 == key }
		newAttributes.append((key, value))
		return HTMLButtonElement(attributes: newAttributes, children: children)
	}
}

// Button-specific methods
extension HTMLButtonElement {
	public func type(_ value: HTMLButton.`Type`) -> HTMLButtonElement {
		addingAttribute("type", value.rawValue)
	}

	public func disabled(_ value: Bool = true) -> HTMLButtonElement {
		value ? addingAttribute("disabled", "disabled") : self
	}

	public func autofocus(_ value: Bool = true) -> HTMLButtonElement {
		value ? addingAttribute("autofocus", "autofocus") : self
	}

	public func name(_ value: String) -> HTMLButtonElement {
		addingAttribute("name", value)
	}

	public func value(_ value: String) -> HTMLButtonElement {
		addingAttribute("value", value)
	}

	public func tabindex(_ value: Int) -> HTMLButtonElement {
		addingAttribute("tabindex", "\(value)")
	}

	public func style(prefix: Bool = true, @CSSBuilder _ content: () -> [any CSS]) -> HTMLButtonElement {
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

// Button-specific event handlers
extension HTMLButtonElement {
	public func onClick(_ value: String) -> HTMLButtonElement {
		addingAttribute("onclick", value)
	}
}

public func button(@HTMLBuilder content: () -> [any HTML] = { [] }) -> HTMLButtonElement { HTMLButtonElement(content: content) }

#endif
