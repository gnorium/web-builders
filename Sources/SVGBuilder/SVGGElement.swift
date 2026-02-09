#if !os(WASI)

import Foundation
import CSSBuilder
import HTMLBuilder
import WebTypes

/// SVGProtocol group element for grouping child elements.
/// https://www.w3.org/TR/SVG2/struct.html#GElement
public struct SVGGElement: SVGGraphicsElementProtocol, Sendable {
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
			return "\(ind)<g\(attrs)></g>"
		} else {
			let renderedContent = children.map { $0.render(indent: indent + 1) }.joined(separator: "\n")
			return "\(ind)<g\(attrs)>\n\(renderedContent)\n\(ind)</g>"
		}
	}
	
	public func addingAttribute(_ key: String, _ value: String) -> SVGGElement {
		var newAttributes = attributes
		newAttributes.removeAll { $0.0 == key }
		newAttributes.append((key, value))
		return SVGGElement(attributes: newAttributes, children: children)
	}
	
	// MARK: - Style
	
	public func style(prefix: Bool = true, @CSSBuilder _ content: () -> [any CSSProtocol]) -> SVGGElement {
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

/// Factory function for g (group) element
public func g(@SVGBuilder _ content: () -> [any SVGProtocol] = { [] }) -> SVGGElement { SVGGElement(content: content) }

#endif
