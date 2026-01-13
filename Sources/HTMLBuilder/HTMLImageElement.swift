#if !os(WASI)

import Foundation
import CSSBuilder
import WebTypes

public struct HTMLImageElement: HTMLElement, Sendable, CustomStringConvertible {
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
		return ind + "<img\(attributeString) />"
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

	public func addingAttribute(_ key: String, _ value: String) -> HTMLImageElement {
		var newAttributes = attributes
		newAttributes.removeAll { $0.0 == key }
		newAttributes.append((key, value))
		return HTMLImageElement(attributes: newAttributes)
	}

	public func style(prefix: Bool = true, @CSSBuilder _ content: () -> [any CSS]) -> HTMLImageElement {
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

// Image-specific methods
extension HTMLImageElement {
	public func src(_ value: String) -> HTMLImageElement {
		addingAttribute("src", value)
	}

	public func alt(_ value: String) -> HTMLImageElement {
		addingAttribute("alt", value)
	}

	public func width(_ value: String) -> HTMLImageElement {
		addingAttribute("width", value)
	}

	public func width(_ value: Length) -> HTMLImageElement {
		addingAttribute("width", value.value)
	}

	public func width(_ value: Int) -> HTMLImageElement {
		addingAttribute("width", "\(value)")
	}

	public func height(_ value: String) -> HTMLImageElement {
		addingAttribute("height", value)
	}

	public func height(_ value: Length) -> HTMLImageElement {
		addingAttribute("height", value.value)
	}

	public func height(_ value: Int) -> HTMLImageElement {
		addingAttribute("height", "\(value)")
	}

	public func loading(_ value: String) -> HTMLImageElement {
		addingAttribute("loading", value)
	}

	public func loading(_ value: HTMLLoading) -> HTMLImageElement {
		addingAttribute("loading", value.rawValue)
	}

	public func decoding(_ value: String) -> HTMLImageElement {
		addingAttribute("decoding", value)
	}

	public func srcset(_ value: String) -> HTMLImageElement {
		addingAttribute("srcset", value)
	}

	public func sizes(_ value: String) -> HTMLImageElement {
		addingAttribute("sizes", value)
	}

	public func crossorigin(_ value: String) -> HTMLImageElement {
		addingAttribute("crossorigin", value)
	}

	public func crossorigin(_ value: HTMLLink.CrossOrigin) -> HTMLImageElement {
		addingAttribute("crossorigin", value.rawValue)
	}

	public func usemap(_ value: String) -> HTMLImageElement {
		addingAttribute("usemap", value)
	}

	public func ismap(_ value: Bool = true) -> HTMLImageElement {
		value ? addingAttribute("ismap", "ismap") : self
	}
}

public func img() -> HTMLImageElement { HTMLImageElement() }

#endif
