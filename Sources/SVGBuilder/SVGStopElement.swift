#if !os(WASI)

import Foundation
import WebTypes

/// SVG stop element for gradient color stops.
/// https://www.w3.org/TR/SVG2/pservers.html#StopElement
public struct SVGStopElement: SVGElement, Sendable {
	public let attributes: [(String, String)]
	
	public init() {
		self.attributes = []
	}
	
	private init(attributes: [(String, String)]) {
		self.attributes = attributes
	}
	
	public func render(indent: Int = 0) -> String {
		let ind = String(repeating: "  ", count: indent)
		let attrs = attributes.isEmpty ? "" : " " + attributes.map { "\($0.0)=\"\($0.1)\"" }.joined(separator: " ")
		return "\(ind)<stop\(attrs)></stop>"
	}
	
	public func addingAttribute(_ key: String, _ value: String) -> SVGStopElement {
		var newAttributes = attributes
		newAttributes.removeAll { $0.0 == key }
		newAttributes.append((key, value))
		return SVGStopElement(attributes: newAttributes)
	}
	
	// MARK: - Stop-Specific Attributes
	
	public func offset(_ value: Percentage) -> SVGStopElement {
		addingAttribute("offset", value.value)
	}
	
	public func offset(_ value: Double) -> SVGStopElement {
		addingAttribute("offset", "\(value)")
	}
	
	public func stopColor(_ value: CSSColor) -> SVGStopElement {
		addingAttribute("stop-color", value.value)
	}
	
	public func stopColor(_ value: String) -> SVGStopElement {
		addingAttribute("stop-color", value)
	}
	
	public func stopOpacity(_ value: Double) -> SVGStopElement {
		addingAttribute("stop-opacity", "\(value)")
	}
}

/// Factory function for stop element
public func stop() -> SVGStopElement { SVGStopElement() }

#endif
