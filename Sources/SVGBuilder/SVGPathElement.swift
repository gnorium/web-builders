#if !os(WASI)

import Foundation
import CSSBuilder
import HTMLBuilder
import WebTypes

/// SVGProtocol path element for drawing arbitrary paths.
/// https://www.w3.org/TR/SVG2/paths.html#PathElement
public struct SVGPathElement: SVGGeometryElementProtocol, Sendable {
	public let attributes: [(String, String)]
	let children: [any SVGProtocol]
	
	public init(@SVGBuilder content: () -> [any SVGProtocol] = { [] }) {
		self.attributes = []
		self.children = content()
	}
	
	private init(attributes: [(String, String)], children: [any SVGProtocol] = []) {
		self.attributes = attributes
		self.children = children
	}
	
	public func render(indent: Int = 0) -> String {
		let ind = String(repeating: "  ", count: indent)
		let attrs = attributes.isEmpty ? "" : " " + attributes.map { "\($0.0)=\"\($0.1)\"" }.joined(separator: " ")
		
		if children.isEmpty {
			return "\(ind)<path\(attrs)></path>"
		} else {
			let renderedContent = children.map { $0.render(indent: indent + 1) }.joined(separator: "\n")
			return "\(ind)<path\(attrs)>\n\(renderedContent)\n\(ind)</path>"
		}
	}
	
	public func addingAttribute(_ key: String, _ value: String) -> SVGPathElement {
		var newAttributes = attributes
		newAttributes.removeAll { $0.0 == key }
		newAttributes.append((key, value))
		return SVGPathElement(attributes: newAttributes, children: children)
	}
	
	// MARK: - Path-Specific Attributes
	
	/// Set path data using command array
	public func d(_ commands: SVGPath.Definition.Command...) -> SVGPathElement {
		let pathString = commands.map { $0.pathString }.joined(separator: " ")
		return addingAttribute("d", pathString)
	}
	
	/// Set path data using raw string
	public func d(_ value: String) -> SVGPathElement {
		addingAttribute("d", value)
	}
	
	// MARK: - Rendering Attributes
	
	/// Set shape rendering mode
	public func shapeRendering(_ value: SVGShapeRendering) -> SVGPathElement {
		addingAttribute("shape-rendering", value.rawValue)
	}
	
	/// Set shape rendering mode with CSSProtocol keyword
	public func shapeRendering(_ value: CSSKeyword.Auto) -> SVGPathElement {
		addingAttribute("shape-rendering", value.rawValue)
	}
	
	// MARK: - Path-Specific Attributes (Content removed)
	
	// MARK: - Style
	
	public func style(prefix: Bool = true, @CSSBuilder _ content: () -> [any CSSProtocol]) -> SVGPathElement {
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

/// Factory function for path element
public func path(@SVGBuilder _ content: () -> [any SVGProtocol] = { [] }) -> SVGPathElement {
	SVGPathElement(content: content)
}

#endif
