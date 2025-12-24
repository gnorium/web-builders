#if !os(WASI)

import Foundation
import CSSBuilder
import WebTypes

public struct HTMLAnchorElement: HTMLElement, Sendable, CustomStringConvertible {
	public let attributes: [(String, String)]
	let children: [HTML]

	public init(@HTMLBuilder content: () -> [HTML] = { [] }) {
		self.attributes = []
		self.children = content()
	}

	private init(attributes: [(String, String)], children: [HTML]) {
		self.attributes = attributes
		self.children = children
	}

	public func render(indent: Int = 0) -> String {
		let ind = String(repeating: "  ", count: indent)
		let attributeString = renderAttributes()

		let openElement = "<a\(attributeString)>"
		let closeElement = "</a>"

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

	public func callAsFunction(@HTMLBuilder _ content: () -> [HTML]) -> HTMLAnchorElement {
		HTMLAnchorElement(attributes: attributes, children: content())
	}

	public func addingAttribute(_ key: String, _ value: String) -> HTMLAnchorElement {
		var newAttributes = attributes
		newAttributes.removeAll { $0.0 == key }
		newAttributes.append((key, value))
		return HTMLAnchorElement(attributes: newAttributes, children: children)
	}

	public func style(prefix: Bool = true, @CSSBuilder _ content: () -> [CSS]) -> HTMLAnchorElement {
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

	// Anchor-specific attributes
	public func href(_ value: String) -> HTMLAnchorElement {
		addingAttribute("href", value)
	}

	public func target(_ value: String) -> HTMLAnchorElement {
		addingAttribute("target", value)
	}

	public func target(_ value: HTMLTarget) -> HTMLAnchorElement {
		addingAttribute("target", value.rawValue)
	}

	public func rel(_ value: String) -> HTMLAnchorElement {
		addingAttribute("rel", value)
	}

	public func rel(_ value: HTMLLink.Relationship) -> HTMLAnchorElement {
		addingAttribute("rel", value.rawValue)
	}

	public func rel(_ values: (HTMLLink.Relationship, HTMLLink.Relationship)) -> HTMLAnchorElement {
		addingAttribute("rel", "\(values.0.rawValue) \(values.1.rawValue)")
	}
}

public func a(@HTMLBuilder _ content: () -> [HTML] = { [] }) -> HTMLAnchorElement { HTMLAnchorElement(content: content) }

#endif
