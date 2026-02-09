#if !os(WASI)

import Foundation
import CSSBuilder
import WebTypes

public struct HTMLProgressElement: HTMLElementProtocol, Sendable, CustomStringConvertible {
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

		let openElement = "<progress\(attributeString)>"
		let closeElement = "</progress>"

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

	public func callAsFunction(@HTMLBuilder content: () -> [any HTMLProtocol]) -> HTMLProgressElement {
		HTMLProgressElement(attributes: attributes, children: content())
	}

	public func addingAttribute(_ key: String, _ value: String) -> HTMLProgressElement {
		var newAttributes = attributes
		newAttributes.removeAll { $0.0 == key }
		newAttributes.append((key, value))
		return HTMLProgressElement(attributes: newAttributes, children: children)
	}

	public func style(prefix: Bool = true, @CSSBuilder _ content: () -> [any CSSProtocol]) -> HTMLProgressElement {
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

	// Progress-specific attributes
	public func value(_ value: Double) -> HTMLProgressElement {
		addingAttribute("value", "\(value)")
	}

	public func max(_ value: Double) -> HTMLProgressElement {
		addingAttribute("max", "\(value)")
	}
}

public func progress(@HTMLBuilder content: () -> [any HTMLProtocol] = { [] }) -> HTMLProgressElement {
	HTMLProgressElement(content: content)
}

#endif
