#if !os(WASI)

import Foundation
import CSSBuilder
import WebTypes

public struct HTMLHeadingElement: HTMLElementProtocol, Sendable, CustomStringConvertible {
	let level: Int // 1-6 for h1-h6
	public let attributes: [(String, String)]
	let children: [any HTMLProtocol]

	public init(level: Int, @HTMLBuilder content: () -> [any HTMLProtocol] = { [] }) {
		self.level = level
		self.attributes = []
		self.children = content()
	}

	private init(level: Int, attributes: [(String, String)], children: [any HTMLProtocol]) {
		self.level = level
		self.attributes = attributes
		self.children = children
	}

	public func render(indent: Int = 0) -> String {
		let ind = String(repeating: "  ", count: indent)
		let attributeString = renderAttributes()
		let tag = "h\(level)"

		let openElement = "<\(tag)\(attributeString)>"
		let closeElement = "</\(tag)>"

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

	public func callAsFunction(@HTMLBuilder content: () -> [any HTMLProtocol]) -> HTMLHeadingElement {
		HTMLHeadingElement(level: level, attributes: attributes, children: content())
	}

	public func addingAttribute(_ key: String, _ value: String) -> HTMLHeadingElement {
		var newAttributes = attributes
		newAttributes.removeAll { $0.0 == key }
		newAttributes.append((key, value))
		return HTMLHeadingElement(level: level, attributes: newAttributes, children: children)
	}

	public func style(prefix: Bool = true, @CSSBuilder _ content: () -> [any CSSProtocol]) -> HTMLHeadingElement {
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

public func h1(@HTMLBuilder content: () -> [any HTMLProtocol] = { [] }) -> HTMLHeadingElement { HTMLHeadingElement(level: 1, content: content) }
public func h2(@HTMLBuilder content: () -> [any HTMLProtocol] = { [] }) -> HTMLHeadingElement { HTMLHeadingElement(level: 2, content: content) }
public func h3(@HTMLBuilder content: () -> [any HTMLProtocol] = { [] }) -> HTMLHeadingElement { HTMLHeadingElement(level: 3, content: content) }
public func h4(@HTMLBuilder content: () -> [any HTMLProtocol] = { [] }) -> HTMLHeadingElement { HTMLHeadingElement(level: 4, content: content) }
public func h5(@HTMLBuilder content: () -> [any HTMLProtocol] = { [] }) -> HTMLHeadingElement { HTMLHeadingElement(level: 5, content: content) }
public func h6(@HTMLBuilder content: () -> [any HTMLProtocol] = { [] }) -> HTMLHeadingElement { HTMLHeadingElement(level: 6, content: content) }

#endif
