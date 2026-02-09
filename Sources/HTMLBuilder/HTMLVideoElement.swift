#if !os(WASI)

import Foundation
import CSSBuilder
import WebTypes

public struct HTMLVideoElement: HTMLElementProtocol, Sendable, CustomStringConvertible {
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

		let openElement = "<video\(attributeString)>"
		let closeElement = "</video>"

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

	public func callAsFunction(@HTMLBuilder content: () -> [any HTMLProtocol]) -> HTMLVideoElement {
		HTMLVideoElement(attributes: attributes, children: content())
	}

	public func addingAttribute(_ key: String, _ value: String) -> HTMLVideoElement {
		var newAttributes = attributes
		newAttributes.removeAll { $0.0 == key }
		newAttributes.append((key, value))
		return HTMLVideoElement(attributes: newAttributes, children: children)
	}

	public func style(prefix: Bool = true, @CSSBuilder _ content: () -> [any CSSProtocol]) -> HTMLVideoElement {
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

	// Media attributes (inherited from HTMLMediaElement)
	public func src(_ value: String) -> HTMLVideoElement {
		addingAttribute("src", value)
	}

	public func controls(_ value: Bool = true) -> HTMLVideoElement {
		value ? addingAttribute("controls", "") : self
	}

	public func autoplay(_ value: Bool = true) -> HTMLVideoElement {
		value ? addingAttribute("autoplay", "") : self
	}

	public func loop(_ value: Bool = true) -> HTMLVideoElement {
		value ? addingAttribute("loop", "") : self
	}

	public func muted(_ value: Bool = true) -> HTMLVideoElement {
		value ? addingAttribute("muted", "") : self
	}

	public func preload(_ value: String) -> HTMLVideoElement {
		addingAttribute("preload", value)
	}

	public func crossorigin(_ value: String) -> HTMLVideoElement {
		addingAttribute("crossorigin", value)
	}

	// Video-specific attributes
	public func width(_ value: Int) -> HTMLVideoElement {
		addingAttribute("width", "\(value)")
	}

	public func height(_ value: Int) -> HTMLVideoElement {
		addingAttribute("height", "\(value)")
	}

	public func poster(_ value: String) -> HTMLVideoElement {
		addingAttribute("poster", value)
	}

	public func playsinline(_ value: Bool = true) -> HTMLVideoElement {
		value ? addingAttribute("playsinline", "") : self
	}
}

public func video(@HTMLBuilder content: () -> [any HTMLProtocol] = { [] }) -> HTMLVideoElement {
	HTMLVideoElement(content: content)
}

#endif
