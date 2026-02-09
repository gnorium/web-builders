#if !os(WASI)

import Foundation
import CSSBuilder
import WebTypes

public struct HTMLHtmlElement: HTMLElementProtocol, Sendable, CustomStringConvertible {
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

		let openElement = "<html\(attributeString)>"
		let closeElement = "</html>"

		guard !children.isEmpty else {
			return ind + openElement + closeElement
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

	public func callAsFunction(@HTMLBuilder content: () -> [any HTMLProtocol]) -> HTMLHtmlElement {
		HTMLHtmlElement(attributes: attributes, children: content())
	}

	public func addingAttribute(_ key: String, _ value: String) -> HTMLHtmlElement {
		var newAttributes = attributes
		newAttributes.removeAll { $0.0 == key }
		newAttributes.append((key, value))
		return HTMLHtmlElement(attributes: newAttributes, children: children)
	}

	public func style(prefix: Bool = true, @CSSBuilder _ content: () -> [any CSSProtocol]) -> HTMLHtmlElement {
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

	// HTMLProtocol-specific attributes
	public func lang(_ value: String) -> HTMLHtmlElement {
		addingAttribute("lang", value)
	}

	public func lang(_ value: HTMLLang) -> HTMLHtmlElement {
		addingAttribute("lang", value.rawValue)
	}

	public func xmlns(_ value: String) -> HTMLHtmlElement {
		addingAttribute("xmlns", value)
	}

	public func dir(_ value: String) -> HTMLHtmlElement {
		addingAttribute("dir", value)
	}

	public func dir(_ value: CSSDirection) -> HTMLHtmlElement {
		addingAttribute("dir", value.rawValue)
	}
}

public func html(@HTMLBuilder content: () -> [any HTMLProtocol] = { [] }) -> HTMLHtmlElement {
	HTMLHtmlElement(content: content)
}

#endif
