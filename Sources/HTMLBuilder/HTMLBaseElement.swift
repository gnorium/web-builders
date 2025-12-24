#if !os(WASI)

import Foundation
import CSSBuilder
import WebTypes

public struct HTMLBaseElement: HTMLElement, Sendable, CustomStringConvertible {
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
		return "\(ind)<base\(attributeString)>"
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

	public func addingAttribute(_ key: String, _ value: String) -> HTMLBaseElement {
		var newAttributes = attributes
		newAttributes.removeAll { $0.0 == key }
		newAttributes.append((key, value))
		return HTMLBaseElement(attributes: newAttributes)
	}

	// Base-specific attributes
	public func href(_ value: String) -> HTMLBaseElement {
		addingAttribute("href", value)
	}

	public func target(_ value: String) -> HTMLBaseElement {
		addingAttribute("target", value)
	}
}

public func base() -> HTMLBaseElement {
	HTMLBaseElement()
}

#endif
