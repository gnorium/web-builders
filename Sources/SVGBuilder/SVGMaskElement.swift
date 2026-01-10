#if !os(WASI)

import Foundation
import CSSBuilder
import WebTypes

/// SVG mask element for masking.
/// https://www.w3.org/TR/SVG2/render.html#MaskElement
public struct SVGMaskElement: SVGElement, Sendable {
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
			return "\(ind)<mask\(attrs)></mask>"
		} else {
			let renderedContent = children.map { $0.render(indent: indent + 1) }.joined(separator: "\n")
			return "\(ind)<mask\(attrs)>\n\(renderedContent)\n\(ind)</mask>"
		}
	}
	
	public func addingAttribute(_ key: String, _ value: String) -> SVGMaskElement {
		var newAttributes = attributes
		newAttributes.removeAll { $0.0 == key }
		newAttributes.append((key, value))
		return SVGMaskElement(attributes: newAttributes, children: children)
	}
	
	// MARK: - Mask-Specific Attributes
	
	public func maskUnits(_ value: String) -> SVGMaskElement {
		addingAttribute("maskUnits", value)
	}
	
	public func maskContentUnits(_ value: String) -> SVGMaskElement {
		addingAttribute("maskContentUnits", value)
	}
	
	public func x(_ value: Length) -> SVGMaskElement {
		addingAttribute("x", value.value)
	}
	
	public func y(_ value: Length) -> SVGMaskElement {
		addingAttribute("y", value.value)
	}
	
	public func width(_ value: Length) -> SVGMaskElement {
		addingAttribute("width", value.value)
	}
	
	public func height(_ value: Length) -> SVGMaskElement {
		addingAttribute("height", value.value)
	}
	
	// MARK: - Content
	
	public func callAsFunction(@SVGBuilder content: () -> [any SVG]) -> SVGMaskElement {
		SVGMaskElement(attributes: attributes, children: content())
	}
}

/// Factory function for mask element
public func mask(@SVGBuilder _ content: () -> [any SVG] = { [] }) -> SVGMaskElement { 
	SVGMaskElement(content: content) 
}

#endif
