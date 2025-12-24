#if !os(WASI)

import Foundation
import CSSBuilder
import WebTypes

public struct HTMLQuoteElement: HTMLElement, Sendable, CustomStringConvertible {
	public let attributes: [(String, String)]
	let children: [HTML]
	let tagName: String

	public init(tagName: String = "blockquote", @HTMLBuilder content: () -> [HTML] = { [] }) {
		self.tagName = tagName
		self.attributes = []
		self.children = content()
	}

	private init(tagName: String, attributes: [(String, String)], children: [HTML]) {
		self.tagName = tagName
		self.attributes = attributes
		self.children = children
	}

	public func render(indent: Int = 0) -> String {
		let ind = String(repeating: "  ", count: indent)
		let attributeString = renderAttributes()

		let openElement = "<\(tagName)\(attributeString)>"
		let closeElement = "</\(tagName)>"

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

	public func callAsFunction(@HTMLBuilder _ content: () -> [HTML]) -> HTMLQuoteElement {
		HTMLQuoteElement(tagName: tagName, attributes: attributes, children: content())
	}

	public func addingAttribute(_ key: String, _ value: String) -> HTMLQuoteElement {
		var newAttributes = attributes
		newAttributes.removeAll { $0.0 == key }
		newAttributes.append((key, value))
		return HTMLQuoteElement(tagName: tagName, attributes: newAttributes, children: children)
	}

	public func style(prefix: Bool = true, @CSSBuilder _ content: () -> [CSS]) -> HTMLQuoteElement {
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

	// Quote-specific attributes
	public func cite(_ value: String) -> HTMLQuoteElement {
		addingAttribute("cite", value)
	}
}

public func blockquote(@HTMLBuilder _ content: () -> [HTML] = { [] }) -> HTMLQuoteElement {
	HTMLQuoteElement(tagName: "blockquote", content: content)
}

public func q(@HTMLBuilder _ content: () -> [HTML] = { [] }) -> HTMLQuoteElement {
	HTMLQuoteElement(tagName: "q", content: content)
}

#endif
