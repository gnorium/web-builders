#if !os(WASI)

import Foundation
import CSSBuilder
import WebTypes

public struct HTMLSourceElement: HTMLElement, Sendable, CustomStringConvertible {
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
		return "\(ind)<source\(attributeString)>"
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

	public func addingAttribute(_ key: String, _ value: String) -> HTMLSourceElement {
		var newAttributes = attributes
		newAttributes.removeAll { $0.0 == key }
		newAttributes.append((key, value))
		return HTMLSourceElement(attributes: newAttributes)
	}

	// Source-specific attributes
	public func src(_ value: String) -> HTMLSourceElement {
		addingAttribute("src", value)
	}

	public func type(_ value: String) -> HTMLSourceElement {
		addingAttribute("type", value)
	}

	public func srcset(_ value: String) -> HTMLSourceElement {
		addingAttribute("srcset", value)
	}

	public func sizes(_ value: String) -> HTMLSourceElement {
		addingAttribute("sizes", value)
	}

	public func media(_ value: String) -> HTMLSourceElement {
		addingAttribute("media", value)
	}

	public func width(_ value: Int) -> HTMLSourceElement {
		addingAttribute("width", "\(value)")
	}

	public func height(_ value: Int) -> HTMLSourceElement {
		addingAttribute("height", "\(value)")
	}
}

public func source() -> HTMLSourceElement {
	HTMLSourceElement()
}

#endif
