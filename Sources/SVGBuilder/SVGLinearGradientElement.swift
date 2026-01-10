#if !os(WASI)

import Foundation
import CSSBuilder
import WebTypes

/// SVG linearGradient element.
/// https://www.w3.org/TR/SVG2/pservers.html#LinearGradientElement
public struct SVGLinearGradientElement: SVGElement, Sendable {
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
			return "\(ind)<linearGradient\(attrs)></linearGradient>"
		} else {
			let renderedContent = children.map { $0.render(indent: indent + 1) }.joined(separator: "\n")
			return "\(ind)<linearGradient\(attrs)>\n\(renderedContent)\n\(ind)</linearGradient>"
		}
	}
	
	public func addingAttribute(_ key: String, _ value: String) -> SVGLinearGradientElement {
		var newAttributes = attributes
		newAttributes.removeAll { $0.0 == key }
		newAttributes.append((key, value))
		return SVGLinearGradientElement(attributes: newAttributes, children: children)
	}
	
	// MARK: - LinearGradient-Specific Attributes
	
	public func x1(_ value: Length) -> SVGLinearGradientElement {
		addingAttribute("x1", value.value)
	}
	
	public func x1(_ value: Percentage) -> SVGLinearGradientElement {
		addingAttribute("x1", value.value)
	}
	
	public func y1(_ value: Length) -> SVGLinearGradientElement {
		addingAttribute("y1", value.value)
	}
	
	public func y1(_ value: Percentage) -> SVGLinearGradientElement {
		addingAttribute("y1", value.value)
	}
	
	public func x2(_ value: Length) -> SVGLinearGradientElement {
		addingAttribute("x2", value.value)
	}
	
	public func x2(_ value: Percentage) -> SVGLinearGradientElement {
		addingAttribute("x2", value.value)
	}
	
	public func y2(_ value: Length) -> SVGLinearGradientElement {
		addingAttribute("y2", value.value)
	}
	
	public func y2(_ value: Percentage) -> SVGLinearGradientElement {
		addingAttribute("y2", value.value)
	}
	
	public func gradientUnits(_ value: SVGGradientUnits) -> SVGLinearGradientElement {
		addingAttribute("gradientUnits", value.rawValue)
	}
	
	public func gradientTransform(_ value: String) -> SVGLinearGradientElement {
		addingAttribute("gradientTransform", value)
	}
	
	public func gradientTransform(_ value: CSSTransformFunction) -> SVGLinearGradientElement {
		addingAttribute("gradientTransform", value.value)
	}
	
	public func gradientTransform(_ value: SVGTransform) -> SVGLinearGradientElement {
		addingAttribute("gradientTransform", value.value)
	}
	
	public func spreadMethod(_ value: String) -> SVGLinearGradientElement {
		addingAttribute("spreadMethod", value)
	}
	
	public func href(_ value: String) -> SVGLinearGradientElement {
		addingAttribute("href", value)
	}
	
	// MARK: - Content
	
	public func content(@SVGBuilder _ content: () -> [any SVG]) -> SVGLinearGradientElement {
		SVGLinearGradientElement(attributes: attributes, children: content())
	}
	
	public func callAsFunction(@SVGBuilder content: () -> [any SVG]) -> SVGLinearGradientElement {
		self.content(content)
	}
}

/// Factory function for linearGradient element
public func linearGradient(@SVGBuilder _ content: () -> [any SVG] = { [] }) -> SVGLinearGradientElement { 
	SVGLinearGradientElement(content: content) 
}

#endif
