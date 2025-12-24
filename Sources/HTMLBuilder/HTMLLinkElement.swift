#if !os(WASI)

import Foundation
import CSSBuilder
import WebTypes

public struct HTMLLinkElement: HTMLElement, Sendable, CustomStringConvertible {
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
		return "\(ind)<link\(attributeString)>"
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

	public func addingAttribute(_ key: String, _ value: String) -> HTMLLinkElement {
		var newAttributes = attributes
		newAttributes.removeAll { $0.0 == key }
		newAttributes.append((key, value))
		return HTMLLinkElement(attributes: newAttributes)
	}

	// Link-specific attributes
	public func rel(_ value: String) -> HTMLLinkElement {
		addingAttribute("rel", value)
	}

	public func rel(_ value: HTMLLink.Relationship) -> HTMLLinkElement {
		addingAttribute("rel", value.rawValue)
	}

	public func href(_ value: String) -> HTMLLinkElement {
		addingAttribute("href", value)
	}

	public func type(_ value: String) -> HTMLLinkElement {
		addingAttribute("type", value)
	}

	public func `as`(_ value: String) -> HTMLLinkElement {
		addingAttribute("as", value)
	}

	public func `as`(_ value: HTMLLink.As) -> HTMLLinkElement {
		addingAttribute("as", value.rawValue)
	}

	public func sizes(_ value: String) -> HTMLLinkElement {
		addingAttribute("sizes", value)
	}

	public func sizes(_ width: Int, _ height: Int) -> HTMLLinkElement {
		addingAttribute("sizes", "\(width)x\(height)")
	}

	public func media(_ value: String) -> HTMLLinkElement {
		addingAttribute("media", value)
	}

	public func crossorigin(_ value: String) -> HTMLLinkElement {
		addingAttribute("crossorigin", value)
	}

	public func crossorigin(_ value: HTMLLink.CrossOrigin) -> HTMLLinkElement {
		addingAttribute("crossorigin", value.rawValue)
	}

	public func integrity(_ value: String) -> HTMLLinkElement {
		addingAttribute("integrity", value)
	}
}

public func link() -> HTMLLinkElement {
	HTMLLinkElement()
}

#endif
