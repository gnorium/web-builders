#if !os(WASI)

import Foundation
import CSSBuilder
import HTMLBuilder
import WebTypes

/// SVG polygon element for drawing closed shapes with straight lines.
/// https://www.w3.org/TR/SVG2/shapes.html#PolygonElement
public struct SVGPolygonElement: SVGGeometryElement, Sendable {
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
			return "\(ind)<polygon\(attrs)></polygon>"
		} else {
			let renderedContent = children.map { $0.render(indent: indent + 1) }.joined(separator: "\n")
			return "\(ind)<polygon\(attrs)>\n\(renderedContent)\n\(ind)</polygon>"
		}
	}
	
	public func addingAttribute(_ key: String, _ value: String) -> SVGPolygonElement {
		var newAttributes = attributes
		newAttributes.removeAll { $0.0 == key }
		newAttributes.append((key, value))
		return SVGPolygonElement(attributes: newAttributes, children: children)
	}
	
	// MARK: - Content
	
	public func content(@SVGBuilder _ content: () -> [any SVG]) -> SVGPolygonElement {
		SVGPolygonElement(attributes: attributes, children: content())
	}
	
	public func callAsFunction(@SVGBuilder content: () -> [any SVG]) -> SVGPolygonElement {
		self.content(content)
	}
	
	// MARK: - Polygon-Specific Attributes
	
	public func points(_ value: String) -> SVGPolygonElement {
		addingAttribute("points", value)
	}
	
	public func points(_ coordinates: (Double, Double)...) -> SVGPolygonElement {
		let pointsString = coordinates.map { "\($0.0),\($0.1)" }.joined(separator: " ")
		return addingAttribute("points", pointsString)
	}
	
	// MARK: - Style
	
	public func style(prefix: Bool = true, @CSSBuilder _ content: () -> [any CSS]) -> SVGPolygonElement {
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

/// Factory function for polygon element
public func polygon() -> SVGPolygonElement { SVGPolygonElement() }

#endif
