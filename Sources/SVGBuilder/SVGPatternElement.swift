#if !os(WASI)

import Foundation
import WebTypes

/// SVG pattern element.
/// https://www.w3.org/TR/SVG2/pservers.html#PatternElement
public struct SVGPatternElement: SVGElement, Sendable {
	public let attributes: [(String, String)]
	let children: [any SVG]
	
	public init(@SVGBuilder content: () -> [any SVG] = { [] }) {
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
			return "\(ind)<pattern\(attrs)></pattern>"
		} else {
			let renderedContent = children.map { $0.render(indent: indent + 1) }.joined(separator: "\n")
			return "\(ind)<pattern\(attrs)>\n\(renderedContent)\n\(ind)</pattern>"
		}
	}
	
	public func addingAttribute(_ key: String, _ value: String) -> SVGPatternElement {
		var newAttributes = attributes
		newAttributes.removeAll { $0.0 == key }
		newAttributes.append((key, value))
		return SVGPatternElement(attributes: newAttributes, children: children)
	}
	
	// MARK: - Pattern Attributes
	
	public func x(_ value: Length) -> SVGPatternElement { addingAttribute("x", value.value) }
	public func y(_ value: Length) -> SVGPatternElement { addingAttribute("y", value.value) }
	public func width(_ value: Length) -> SVGPatternElement { addingAttribute("width", value.value) }
	public func height(_ value: Length) -> SVGPatternElement { addingAttribute("height", value.value) }
	public func patternUnits(_ value: String) -> SVGPatternElement { addingAttribute("patternUnits", value) }
	public func patternContentUnits(_ value: String) -> SVGPatternElement { addingAttribute("patternContentUnits", value) }
	public func viewBox(_ minX: Double, _ minY: Double, _ width: Double, _ height: Double) -> SVGPatternElement {
		addingAttribute("viewBox", "\(minX) \(minY) \(width) \(height)")
	}
}

/// Factory function for pattern element
public func pattern(@SVGBuilder _ content: () -> [any SVG] = { [] }) -> SVGPatternElement {
	SVGPatternElement(content: content)
}

#endif
