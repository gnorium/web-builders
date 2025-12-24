#if !os(WASI)

import Foundation
import CSSBuilder
import WebTypes

public struct HTMLIFrameElement: HTMLElement, Sendable, CustomStringConvertible {
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

		let openElement = "<iframe\(attributeString)>"
		let closeElement = "</iframe>"

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

	public func callAsFunction(@HTMLBuilder _ content: () -> [HTML]) -> HTMLIFrameElement {
		HTMLIFrameElement(attributes: attributes, children: content())
	}

	public func addingAttribute(_ key: String, _ value: String) -> HTMLIFrameElement {
		var newAttributes = attributes
		newAttributes.removeAll { $0.0 == key }
		newAttributes.append((key, value))
		return HTMLIFrameElement(attributes: newAttributes, children: children)
	}

	public func style(prefix: Bool = true, @CSSBuilder _ content: () -> [CSS]) -> HTMLIFrameElement {
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

	// IFrame-specific attributes
	public func src(_ value: String) -> HTMLIFrameElement {
		addingAttribute("src", value)
	}

	public func width(_ value: Int) -> HTMLIFrameElement {
		addingAttribute("width", "\(value)")
	}

	public func height(_ value: Int) -> HTMLIFrameElement {
		addingAttribute("height", "\(value)")
	}

	public func name(_ value: String) -> HTMLIFrameElement {
		addingAttribute("name", value)
	}

	public func sandbox(_ value: String) -> HTMLIFrameElement {
		addingAttribute("sandbox", value)
	}

	public func allow(_ value: String) -> HTMLIFrameElement {
		addingAttribute("allow", value)
	}

	public func allowfullscreen(_ value: Bool = true) -> HTMLIFrameElement {
		value ? addingAttribute("allowfullscreen", "") : self
	}

	public func loading(_ value: String) -> HTMLIFrameElement {
		addingAttribute("loading", value)
	}

	public func referrerpolicy(_ value: String) -> HTMLIFrameElement {
		addingAttribute("referrerpolicy", value)
	}
}

public func iframe(@HTMLBuilder _ content: () -> [HTML] = { [] }) -> HTMLIFrameElement {
	HTMLIFrameElement(content: content)
}

#endif
