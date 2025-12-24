#if !os(WASI)

import Foundation
import CSSBuilder
import WebTypes
import JSBuilder
import JSONFormat
import JSONLDFormat

public struct HTMLScriptElement: HTMLElement, Sendable, CustomStringConvertible {
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

		let openElement = "<script\(attributeString)>"
		let closeElement = "</script>"

		guard !children.isEmpty else {
			return ind + openElement + closeElement
		}

		// For text content (JS code), render without extra indentation
		if children.count == 1, let textChild = children.first as? HTMLText {
			let trimmedContent = textChild.content.trimmingCharacters(in: .newlines)
			return "\(ind)\(openElement)\n\(trimmedContent)\n\(ind)\(closeElement)"
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

	public func callAsFunction(@HTMLBuilder _ content: () -> [HTML]) -> HTMLScriptElement {
		HTMLScriptElement(attributes: attributes, children: content())
	}

	public func addingAttribute(_ key: String, _ value: String) -> HTMLScriptElement {
		var newAttributes = attributes
		newAttributes.removeAll { $0.0 == key }
		newAttributes.append((key, value))
		return HTMLScriptElement(attributes: newAttributes, children: children)
	}

	public func style(prefix: Bool = true, @CSSBuilder _ content: () -> [CSS]) -> HTMLScriptElement {
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

	// Script-specific attributes
	public func src(_ value: String) -> HTMLScriptElement {
		addingAttribute("src", value)
	}

	public func type(_ value: String) -> HTMLScriptElement {
		addingAttribute("type", value)
	}

	public func async(_ value: Bool = true) -> HTMLScriptElement {
		value ? addingAttribute("async", "") : self
	}

	public func `defer`(_ value: Bool = true) -> HTMLScriptElement {
		value ? addingAttribute("defer", "") : self
	}

	public func crossorigin(_ value: String) -> HTMLScriptElement {
		addingAttribute("crossorigin", value)
	}

	public func integrity(_ value: String) -> HTMLScriptElement {
		addingAttribute("integrity", value)
	}

	public func nomodule(_ value: Bool = true) -> HTMLScriptElement {
		value ? addingAttribute("nomodule", "") : self
	}
}

public func script(@HTMLBuilder _ content: () -> [HTML] = { [] }) -> HTMLScriptElement {
	HTMLScriptElement(content: content)
}

public func script(_ content: () -> JSONLDObject) -> HTMLScriptElement {
	let value = content()
	let string = value.encodeJSON()
	return HTMLScriptElement(content: {
		[HTMLText(content: string)]
	})
}

public func script(_ content: @autoclosure () -> any JSON) -> HTMLScriptElement {
	let value = content()
	let string = value.encodeJSON()
	return HTMLScriptElement(content: {
		[HTMLText(content: string)]
	})
}

public func script(@JSBuilder _ content: () -> [JS]) -> HTMLScriptElement {
	let code = content().map { $0.render() }.joined(separator: "\n")
	return HTMLScriptElement(content: {
		[HTMLText(content: code)]
	})
}

#endif
