#if !os(WASI)

import Foundation
import CSSBuilder
import WebTypes

/// SVG radialGradient element.
/// https://www.w3.org/TR/SVG2/pservers.html#RadialGradientElement
public struct SVGRadialGradientElement: SVGElement, Sendable {
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
			return "\(ind)<radialGradient\(attrs)></radialGradient>"
		} else {
			let renderedContent = children.map { $0.render(indent: indent + 1) }.joined(separator: "\n")
			return "\(ind)<radialGradient\(attrs)>\n\(renderedContent)\n\(ind)</radialGradient>"
		}
	}
	
	public func addingAttribute(_ key: String, _ value: String) -> SVGRadialGradientElement {
		var newAttributes = attributes
		newAttributes.removeAll { $0.0 == key }
		newAttributes.append((key, value))
		return SVGRadialGradientElement(attributes: newAttributes, children: children)
	}
	
	// MARK: - RadialGradient-Specific Attributes
	
	public func cx(_ value: Length) -> SVGRadialGradientElement {
		addingAttribute("cx", value.value)
	}
	
	public func cx(_ value: Percentage) -> SVGRadialGradientElement {
		addingAttribute("cx", value.value)
	}
	
	public func cy(_ value: Length) -> SVGRadialGradientElement {
		addingAttribute("cy", value.value)
	}
	
	public func cy(_ value: Percentage) -> SVGRadialGradientElement {
		addingAttribute("cy", value.value)
	}
	
	public func r(_ value: Length) -> SVGRadialGradientElement {
		addingAttribute("r", value.value)
	}
	
	public func r(_ value: Percentage) -> SVGRadialGradientElement {
		addingAttribute("r", value.value)
	}
	
	public func fx(_ value: Length) -> SVGRadialGradientElement {
		addingAttribute("fx", value.value)
	}
	
	public func fx(_ value: Percentage) -> SVGRadialGradientElement {
		addingAttribute("fx", value.value)
	}
	
	public func fy(_ value: Length) -> SVGRadialGradientElement {
		addingAttribute("fy", value.value)
	}
	
	public func fy(_ value: Percentage) -> SVGRadialGradientElement {
		addingAttribute("fy", value.value)
	}
	
	public func fr(_ value: Length) -> SVGRadialGradientElement {
		addingAttribute("fr", value.value)
	}
	
	public func gradientUnits(_ value: SVGGradientUnits) -> SVGRadialGradientElement {
		addingAttribute("gradientUnits", value.rawValue)
	}
	
	public func gradientTransform(_ value: String) -> SVGRadialGradientElement {
		addingAttribute("gradientTransform", value)
	}
	
	public func gradientTransform(_ value: CSSTransformFunction) -> SVGRadialGradientElement {
		addingAttribute("gradientTransform", value.value)
	}
	
	public func gradientTransform(_ value: SVGTransform) -> SVGRadialGradientElement {
		addingAttribute("gradientTransform", value.value)
	}
	
	public func spreadMethod(_ value: String) -> SVGRadialGradientElement {
		addingAttribute("spreadMethod", value)
	}
	
	public func href(_ value: String) -> SVGRadialGradientElement {
		addingAttribute("href", value)
	}
	
	// MARK: - Gradient-Specific Attributes (Content removed)
}

/// Factory function for radialGradient element
public func radialGradient(@SVGBuilder _ content: () -> [any SVG] = { [] }) -> SVGRadialGradientElement { 
	SVGRadialGradientElement(content: content) 
}

#endif
