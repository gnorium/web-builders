#if !os(WASI)

import Foundation
import CSSBuilder
import WebTypes

public struct HTMLTrackElement: HTMLElement, Sendable, CustomStringConvertible {
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
		return "\(ind)<track\(attributeString)>"
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

	public func addingAttribute(_ key: String, _ value: String) -> HTMLTrackElement {
		var newAttributes = attributes
		newAttributes.removeAll { $0.0 == key }
		newAttributes.append((key, value))
		return HTMLTrackElement(attributes: newAttributes)
	}

	// Track-specific attributes
	public func src(_ value: String) -> HTMLTrackElement {
		addingAttribute("src", value)
	}

	public func kind(_ value: String) -> HTMLTrackElement {
		addingAttribute("kind", value)
	}

	public func srclang(_ value: String) -> HTMLTrackElement {
		addingAttribute("srclang", value)
	}

	public func label(_ value: String) -> HTMLTrackElement {
		addingAttribute("label", value)
	}

	public func `default`(_ value: Bool = true) -> HTMLTrackElement {
		value ? addingAttribute("default", "") : self
	}
}

public func track() -> HTMLTrackElement {
	HTMLTrackElement()
}

#endif
