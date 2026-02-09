#if !os(WASI)

import Foundation
import CSSBuilder
import HTMLBuilder
import WebTypes

/// SVGProtocol polyline element for drawing open shapes with straight lines.
/// https://www.w3.org/TR/SVG2/shapes.html#PolylineElement
public struct SVGPolylineElement: SVGGeometryElementProtocol, Sendable {
	public let attributes: [(String, String)]
	let children: [any SVGProtocol]
	
	public init(@SVGBuilder content: () -> [any SVGProtocol] = { [] }) {
		self.attributes = []
		self.children = content()
	}
	
	private init(attributes: [(String, String)], children: [any SVGProtocol]) {
		self.attributes = attributes
		self.children = children
	}
	
	public func render(indent: Int = 0) -> String {
		let ind = String(repeating: "  ", count: indent)
		let attrs = attributes.isEmpty ? "" : " " + attributes.map { "\($0.0)=\"\($0.1)\"" }.joined(separator: " ")
		
		if children.isEmpty {
			return "\(ind)<polyline\(attrs)></polyline>"
		} else {
			let renderedContent = children.map { $0.render(indent: indent + 1) }.joined(separator: "\n")
			return "\(ind)<polyline\(attrs)>\n\(renderedContent)\n\(ind)</polyline>"
		}
	}
	
	public func addingAttribute(_ key: String, _ value: String) -> SVGPolylineElement {
		var newAttributes = attributes
		newAttributes.removeAll { $0.0 == key }
		newAttributes.append((key, value))
		return SVGPolylineElement(attributes: newAttributes, children: children)
	}
	
	// MARK: - Polyline-Specific Attributes (Content removed)
	
	// MARK: - Polyline-Specific Attributes
	
	public func points(_ value: String) -> SVGPolylineElement {
		addingAttribute("points", value)
	}
	
	public func points(_ coordinates: (Double, Double)...) -> SVGPolylineElement {
		let pointsString = coordinates.map { "\($0.0),\($0.1)" }.joined(separator: " ")
		return addingAttribute("points", pointsString)
	}
	
	// MARK: - Style
	
	public func style(prefix: Bool = true, @CSSBuilder _ content: () -> [any CSSProtocol]) -> SVGPolylineElement {
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

/// Factory function for polyline element
public func polyline(@SVGBuilder _ content: () -> [any SVGProtocol] = { [] }) -> SVGPolylineElement {
	SVGPolylineElement(content: content)
}

#endif
