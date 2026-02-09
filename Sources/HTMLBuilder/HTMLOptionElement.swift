#if !os(WASI)

import Foundation
import CSSBuilder

public struct HTMLOptionElement: HTMLElementProtocol, Sendable, CustomStringConvertible {
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

		let openElement = "<option\(attributeString)>"
		let closeElement = "</option>"

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
			.map { "\($0.0)=\"\(escapeHTMLAttributeValue($0.1))\"" }
			.joined(separator: " ")
	}

	public var description: String {
		render(indent: 0)
	}

	public func callAsFunction(@HTMLBuilder content: () -> [any HTMLProtocol]) -> HTMLOptionElement {
		HTMLOptionElement(attributes: attributes, children: content())
	}

	public func addingAttribute(_ key: String, _ value: String) -> HTMLOptionElement {
		var newAttributes = attributes
		newAttributes.removeAll { $0.0 == key }
		newAttributes.append((key, value))
		return HTMLOptionElement(attributes: newAttributes, children: children)
	}

	public func style(prefix: Bool = true, @CSSBuilder _ content: () -> [any CSSProtocol]) -> HTMLOptionElement {
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

// Option-specific methods
extension HTMLOptionElement {
	public func value(_ value: String) -> HTMLOptionElement {
		addingAttribute("value", value)
	}

	public func selected(_ value: Bool = true) -> HTMLOptionElement {
		value ? addingAttribute("selected", "selected") : self
	}

	public func disabled(_ value: Bool = true) -> HTMLOptionElement {
		value ? addingAttribute("disabled", "disabled") : self
	}

	public func label(_ value: String) -> HTMLOptionElement {
		addingAttribute("label", value)
	}
}

public func option(@HTMLBuilder content: () -> [any HTMLProtocol] = { [] }) -> HTMLOptionElement { HTMLOptionElement(content: content) }

#endif
