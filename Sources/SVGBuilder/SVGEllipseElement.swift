#if !os(WASI)

import Foundation
import CSSBuilder
import HTMLBuilder
import WebTypes

/// SVG ellipse element for drawing ellipses.
/// https://www.w3.org/TR/SVG2/shapes.html#EllipseElement
public struct SVGEllipseElement: SVGGeometryElement, Sendable {
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
			return "\(ind)<ellipse\(attrs)></ellipse>"
		} else {
			let renderedContent = children.map { $0.render(indent: indent + 1) }.joined(separator: "\n")
			return "\(ind)<ellipse\(attrs)>\n\(renderedContent)\n\(ind)</ellipse>"
		}
	}
	
	public func addingAttribute(_ key: String, _ value: String) -> SVGEllipseElement {
		var newAttributes = attributes
		newAttributes.removeAll { $0.0 == key }
		newAttributes.append((key, value))
		return SVGEllipseElement(attributes: newAttributes, children: children)
	}
	
	// MARK: - Ellipse-Specific Attributes (Content removed)
	
	// MARK: - Ellipse-Specific Attributes
	
	public func cx(_ value: Length) -> SVGEllipseElement {
		addingAttribute("cx", value.value)
	}
	
	public func cx(_ value: Percentage) -> SVGEllipseElement {
		addingAttribute("cx", value.value)
	}
	
	public func cy(_ value: Length) -> SVGEllipseElement {
		addingAttribute("cy", value.value)
	}
	
	public func cy(_ value: Percentage) -> SVGEllipseElement {
		addingAttribute("cy", value.value)
	}
	
	public func rx(_ value: Length) -> SVGEllipseElement {
		addingAttribute("rx", value.value)
	}
	
	public func rx(_ value: Percentage) -> SVGEllipseElement {
		addingAttribute("rx", value.value)
	}
	
	public func ry(_ value: Length) -> SVGEllipseElement {
		addingAttribute("ry", value.value)
	}
	
	public func ry(_ value: Percentage) -> SVGEllipseElement {
		addingAttribute("ry", value.value)
	}
	
	// MARK: - Style
	
	public func style(prefix: Bool = true, @CSSBuilder _ content: () -> [any CSS]) -> SVGEllipseElement {
		let cssItems = content()
		let className = attributes.first(where: { $0.0 == "class" })?.1 ?? ""
		let existingStyle = attributes.first(where: { $0.0 == "style" })?.1

		let (inlineStyle, _) = processStyleBlock(
			cssItems: cssItems,
			prefix: prefix,
			className: className,
			existingStyle: existingStyle
		)

		return inlineStyle.isEmpty ? self : addingAttribute("style", inlineStyle)
	}
}

/// Factory function for ellipse element
public func ellipse(@SVGBuilder _ content: () -> [any SVG] = { [] }) -> SVGEllipseElement {
	SVGEllipseElement(content: content)
}

#endif
