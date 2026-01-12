#if !os(WASI)

import Foundation
import CSSBuilder
import HTMLBuilder
import WebTypes

/// SVG rect element for drawing rectangles.
/// https://www.w3.org/TR/SVG2/shapes.html#RectElement
public struct SVGRectElement: SVGGeometryElement, Sendable {
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
			return "\(ind)<rect\(attrs)></rect>"
		} else {
			let renderedContent = children.map { $0.render(indent: indent + 1) }.joined(separator: "\n")
			return "\(ind)<rect\(attrs)>\n\(renderedContent)\n\(ind)</rect>"
		}
	}
	
	public func addingAttribute(_ key: String, _ value: String) -> SVGRectElement {
		var newAttributes = attributes
		newAttributes.removeAll { $0.0 == key }
		newAttributes.append((key, value))
		return SVGRectElement(attributes: newAttributes, children: children)
	}
	
	// MARK: - Dimensions
	
	// MARK: - Rect-Specific Attributes
	
	public func x(_ value: Length) -> SVGRectElement {
		addingAttribute("x", value.value)
	}
	
	public func x(_ value: Percentage) -> SVGRectElement {
		addingAttribute("x", value.value)
	}
	
	public func y(_ value: Length) -> SVGRectElement {
		addingAttribute("y", value.value)
	}
	
	public func y(_ value: Percentage) -> SVGRectElement {
		addingAttribute("y", value.value)
	}
	
	public func width(_ value: Length) -> SVGRectElement {
		addingAttribute("width", value.value)
	}
	
	public func width(_ value: Percentage) -> SVGRectElement {
		addingAttribute("width", value.value)
	}
	
	public func height(_ value: Length) -> SVGRectElement {
		addingAttribute("height", value.value)
	}
	
	public func height(_ value: Percentage) -> SVGRectElement {
		addingAttribute("height", value.value)
	}
	
	public func rx(_ value: Length) -> SVGRectElement {
		addingAttribute("rx", value.value)
	}
	
	public func rx(_ value: Percentage) -> SVGRectElement {
		addingAttribute("rx", value.value)
	}
	
	public func ry(_ value: Length) -> SVGRectElement {
		addingAttribute("ry", value.value)
	}
	
	public func ry(_ value: Percentage) -> SVGRectElement {
		addingAttribute("ry", value.value)
	}
	
	// MARK: - Style
	
	public func style(prefix: Bool = true, @CSSBuilder _ content: () -> [any CSS]) -> SVGRectElement {
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

/// Factory function for rect element
public func rect(@SVGBuilder _ content: () -> [any SVG] = { [] }) -> SVGRectElement {
	SVGRectElement(content: content)
}

#endif
