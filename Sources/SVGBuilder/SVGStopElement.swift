#if !os(WASI)

import Foundation
import WebTypes

/// SVG stop element for gradient color stops.
/// https://www.w3.org/TR/SVG2/pservers.html#StopElement
public struct SVGStopElement: SVGElement, Sendable {
	public let attributes: [(String, String)]
	public let children: [any SVG]
	
	/// Self-closing stop (no children)
	public init() {
		self.attributes = []
		self.children = []
	}
	
	/// Stop with content (e.g., animate children)
	public init(@SVGBuilder _ content: () -> [any SVG]) {
		self.attributes = []
		self.children = content()
	}
	
	private init(attributes: [(String, String)], children: [any SVG]) {
		self.attributes = attributes
		self.children = children
	}
	
	public func render(indent: Int = 0) -> String {
		let ind = String(repeating: "  ", count: indent)
		let attrs = attributes.isEmpty ? "" : " " + attributes.map { "\($0.0)=\"\($0.1)\"" }.joined(separator: " ")
		if children.isEmpty {
			return "\(ind)<stop\(attrs)/>"
		}
		let childrenStr = children.map { $0.render(indent: indent + 1) }.joined(separator: "\n")
		return "\(ind)<stop\(attrs)>\n\(childrenStr)\n\(ind)</stop>"
	}
	
	public func addingAttribute(_ key: String, _ value: String) -> SVGStopElement {
		var newAttributes = attributes
		newAttributes.removeAll { $0.0 == key }
		newAttributes.append((key, value))
		return SVGStopElement(attributes: newAttributes, children: children)
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

/// Factory function for self-closing stop element
public func stop() -> SVGStopElement { SVGStopElement() }

/// Factory function for stop element with content
public func stop(@SVGBuilder _ content: () -> [any SVG]) -> SVGStopElement {
	SVGStopElement(content)
}

#endif
