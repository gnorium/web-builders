#if !os(WASI)

import Foundation
import CSSBuilder
import WebTypes

public struct HTMLEmbedElement: HTMLElementProtocol, Sendable, CustomStringConvertible {
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
		return "\(ind)<embed\(attributeString)>"
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

	public func addingAttribute(_ key: String, _ value: String) -> HTMLEmbedElement {
		var newAttributes = attributes
		newAttributes.removeAll { $0.0 == key }
		newAttributes.append((key, value))
		return HTMLEmbedElement(attributes: newAttributes)
	}

	// Embed-specific attributes
	public func src(_ value: String) -> HTMLEmbedElement {
		addingAttribute("src", value)
	}

	public func type(_ value: String) -> HTMLEmbedElement {
		addingAttribute("type", value)
	}

	public func width(_ value: Int) -> HTMLEmbedElement {
		addingAttribute("width", "\(value)")
	}

	public func height(_ value: Int) -> HTMLEmbedElement {
		addingAttribute("height", "\(value)")
	}
}

public func embed() -> HTMLEmbedElement {
	HTMLEmbedElement()
}

#endif
