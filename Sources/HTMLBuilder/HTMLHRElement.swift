#if !os(WASI)

import Foundation
import CSSBuilder
import WebTypes

public struct HTMLHRElement: HTMLElement, Sendable, CustomStringConvertible {
	public let attributes: [(String, String)]

	public init() {
		self.attributes = []
	}

	private init(attributes: [(String, String)]) {
		self.attributes = attributes
	}

	public func render(indent: Int = 0) -> String {
		let ind = String(repeating: "  ", count: indent)
		let attributeString = renderAttributes()
		return "\(ind)<hr\(attributeString)>"
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

	public func addingAttribute(_ key: String, _ value: String) -> HTMLHRElement {
		var newAttributes = attributes
		newAttributes.removeAll { $0.0 == key }
		newAttributes.append((key, value))
		return HTMLHRElement(attributes: newAttributes)
	}

	public func `class`(_ value: String) -> HTMLHRElement {
		addingAttribute("class", value)
	}

	public func ariaHidden(_ value: Bool) -> HTMLHRElement {
		addingAttribute("aria-hidden", value ? "true" : "false")
	}

	public func style(prefix: Bool = true, @CSSBuilder _ content: () -> [CSS]) -> HTMLHRElement {
		let cssItems = content()
		let className = attributes.first(where: { $0.0 == "class" })?.1 ?? ""
		let existingStyle = attributes.first(where: { $0.0 == "style" })?.1

		let result = processStyleBlock(
			cssItems: cssItems,
			prefix: prefix,
			className: className,
			existingStyle: existingStyle
		)

		if result.inlineStyle.isEmpty {
			return self
		}

		return addingAttribute("style", result.inlineStyle)
	}
}

public func hr() -> HTMLHRElement {
	HTMLHRElement()
}

#endif
