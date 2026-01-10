#if !os(WASI)

import Foundation
import CSSBuilder
import HTMLBuilder
import WebTypes

/// SVG root element.
/// https://www.w3.org/TR/SVG2/struct.html#SVGElement
public struct SVGSVGElement: SVGGraphicsElement, Sendable {
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
			return "\(ind)<svg\(attrs)></svg>"
		} else {
			let renderedContent = children.map { $0.render(indent: indent + 1) }.joined(separator: "\n")
			return "\(ind)<svg\(attrs)>\n\(renderedContent)\n\(ind)</svg>"
		}
	}
	
	public func addingAttribute(_ key: String, _ value: String) -> SVGSVGElement {
		var newAttributes = attributes
		newAttributes.removeAll { $0.0 == key }
		newAttributes.append((key, value))
		return SVGSVGElement(attributes: newAttributes, children: children)
	}
	
	// MARK: - SVG-Specific Attributes
	
	public func viewBox(_ minX: Int, _ minY: Int, _ width: Int, _ height: Int) -> SVGSVGElement {
		addingAttribute("viewBox", "\(minX) \(minY) \(width) \(height)")
	}
	
	public func viewBox(_ minX: Double, _ minY: Double, _ width: Double, _ height: Double) -> SVGSVGElement {
		addingAttribute("viewBox", "\(minX) \(minY) \(width) \(height)")
	}
	
	public func xmlns(_ value: String) -> SVGSVGElement {
		addingAttribute("xmlns", value)
	}
	
	public func xmlnsXlink(_ value: String) -> SVGSVGElement {
		addingAttribute("xmlns:xlink", value)
	}
	
	public func width(_ value: Length) -> SVGSVGElement {
		addingAttribute("width", value.value)
	}
	
	public func width(_ value: Percentage) -> SVGSVGElement {
		addingAttribute("width", value.value)
	}
	
	public func height(_ value: Length) -> SVGSVGElement {
		addingAttribute("height", value.value)
	}
	
	public func height(_ value: Percentage) -> SVGSVGElement {
		addingAttribute("height", value.value)
	}
	
	public func preserveAspectRatio(_ value: String) -> SVGSVGElement {
		addingAttribute("preserveAspectRatio", value)
	}
	
	// MARK: - Content
	
	public func callAsFunction(@SVGBuilder content: () -> [any SVG]) -> SVGSVGElement {
		SVGSVGElement(attributes: attributes, children: content())
	}
	
	// MARK: - Style
	
	public func style(prefix: Bool = true, @CSSBuilder _ content: () -> [any CSS]) -> SVGSVGElement {
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

/// Factory function for svg root element
public func svg(@SVGBuilder _ content: () -> [any SVG] = { [] }) -> SVGSVGElement { SVGSVGElement(content: content) }

#endif
