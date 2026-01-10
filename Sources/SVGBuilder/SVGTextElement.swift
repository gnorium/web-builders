#if !os(WASI)

import Foundation
import CSSBuilder
import HTMLBuilder
import WebTypes

/// SVG text element.
/// https://www.w3.org/TR/SVG2/text.html#TextElement
public struct SVGTextElement: SVGGraphicsElement, Sendable {
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
			return "\(ind)<text\(attrs)></text>"
		} else {
			let renderedContent = children.map { $0.render(indent: indent + 1) }.joined(separator: "\n")
			return "\(ind)<text\(attrs)>\n\(renderedContent)\n\(ind)</text>"
		}
	}
	
	public func addingAttribute(_ key: String, _ value: String) -> SVGTextElement {
		var newAttributes = attributes
		newAttributes.removeAll { $0.0 == key }
		newAttributes.append((key, value))
		return SVGTextElement(attributes: newAttributes, children: children)
	}
	
	// MARK: - Text-Specific Attributes
	
	public func x(_ value: Length) -> SVGTextElement {
		addingAttribute("x", value.value)
	}
	
	public func x(_ value: Percentage) -> SVGTextElement {
		addingAttribute("x", value.value)
	}
	
	public func y(_ value: Length) -> SVGTextElement {
		addingAttribute("y", value.value)
	}
	
	public func y(_ value: Percentage) -> SVGTextElement {
		addingAttribute("y", value.value)
	}
	
	public func dx(_ value: Length) -> SVGTextElement {
		addingAttribute("dx", value.value)
	}
	
	public func dy(_ value: Length) -> SVGTextElement {
		addingAttribute("dy", value.value)
	}
	
	public func textLength(_ value: Length) -> SVGTextElement {
		addingAttribute("textLength", value.value)
	}
	
	public func lengthAdjust(_ value: String) -> SVGTextElement {
		addingAttribute("lengthAdjust", value)
	}
	
	// MARK: - Fill & Stroke (text can be styled)
	
	public func fill(_ value: SVGPaint) -> SVGTextElement {
		addingAttribute("fill", value.value)
	}
	
	public func fill(_ value: CSSColor) -> SVGTextElement {
		addingAttribute("fill", value.value)
	}
	
	public func stroke(_ value: SVGPaint) -> SVGTextElement {
		addingAttribute("stroke", value.value)
	}
	
	// MARK: - Content
	
	public func callAsFunction(@SVGBuilder content: () -> [any SVG]) -> SVGTextElement {
		SVGTextElement(attributes: attributes, children: content())
	}
	
	// MARK: - Style
	
	public func style(prefix: Bool = true, @CSSBuilder _ content: () -> [any CSS]) -> SVGTextElement {
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

/// Factory function for text element
public func text(@SVGBuilder _ content: () -> [any SVG] = { [] }) -> SVGTextElement { SVGTextElement(content: content) }

#endif
