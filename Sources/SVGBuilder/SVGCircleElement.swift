#if !os(WASI)

import Foundation
import CSSBuilder
import HTMLBuilder
import WebTypes

/// SVGProtocol circle element for drawing circles.
/// https://www.w3.org/TR/SVG2/shapes.html#CircleElement
public struct SVGCircleElement: SVGGeometryElementProtocol, Sendable {
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
			return "\(ind)<circle\(attrs)></circle>"
		} else {
			let renderedContent = children.map { $0.render(indent: indent + 1) }.joined(separator: "\n")
			return "\(ind)<circle\(attrs)>\n\(renderedContent)\n\(ind)</circle>"
		}
	}
	
	public func addingAttribute(_ key: String, _ value: String) -> SVGCircleElement {
		var newAttributes = attributes
		newAttributes.removeAll { $0.0 == key }
		newAttributes.append((key, value))
		return SVGCircleElement(attributes: newAttributes, children: children)
	}
	
	
	// MARK: - Circle-Specific Attributes
	
	public func cx(_ value: Length) -> SVGCircleElement {
		addingAttribute("cx", value.value)
	}
	
	public func cx(_ value: Percentage) -> SVGCircleElement {
		addingAttribute("cx", value.value)
	}
	
	public func cy(_ value: Length) -> SVGCircleElement {
		addingAttribute("cy", value.value)
	}
	
	public func cy(_ value: Percentage) -> SVGCircleElement {
		addingAttribute("cy", value.value)
	}
	
	public func r(_ value: Length) -> SVGCircleElement {
		addingAttribute("r", value.value)
	}
	
	public func r(_ value: Percentage) -> SVGCircleElement {
		addingAttribute("r", value.value)
	}
	
	// MARK: - Style
	
	public func style(prefix: Bool = true, @CSSBuilder _ content: () -> [any CSSProtocol]) -> SVGCircleElement {
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

/// Factory function for circle element
public func circle(@SVGBuilder _ content: () -> [any SVGProtocol] = { [] }) -> SVGCircleElement {
	SVGCircleElement(content: content)
}

#endif
