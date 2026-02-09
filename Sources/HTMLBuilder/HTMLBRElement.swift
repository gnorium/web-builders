#if !os(WASI)

import Foundation
import CSSBuilder
import WebTypes

public struct HTMLBRElement: HTMLElementProtocol, Sendable, CustomStringConvertible {
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
		return "\(ind)<br\(attributeString)>"
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

	public func addingAttribute(_ key: String, _ value: String) -> HTMLBRElement {
		var newAttributes = attributes
		newAttributes.removeAll { $0.0 == key }
		newAttributes.append((key, value))
		return HTMLBRElement(attributes: newAttributes)
	}
}

public func br() -> HTMLBRElement {
	HTMLBRElement()
}

#endif
