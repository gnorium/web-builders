#if !os(WASI)

import Foundation
import CSSBuilder
import WebTypes

/// SVG defs element for defining reusable components.
/// https://www.w3.org/TR/SVG2/struct.html#DefsElement
public struct SVGDefsElement: SVGElement, Sendable {
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
			return "\(ind)<defs\(attrs)></defs>"
		} else {
			let renderedContent = children.map { $0.render(indent: indent + 1) }.joined(separator: "\n")
			return "\(ind)<defs\(attrs)>\n\(renderedContent)\n\(ind)</defs>"
		}
	}
	
	public func addingAttribute(_ key: String, _ value: String) -> SVGDefsElement {
		var newAttributes = attributes
		newAttributes.removeAll { $0.0 == key }
		newAttributes.append((key, value))
		return SVGDefsElement(attributes: newAttributes, children: children)
	}
	
	// MARK: - Content
	
	public func callAsFunction(@SVGBuilder content: () -> [any SVG]) -> SVGDefsElement {
		SVGDefsElement(attributes: attributes, children: content())
	}
}

/// Factory function for defs element
public func defs(@SVGBuilder _ content: () -> [any SVG] = { [] }) -> SVGDefsElement { SVGDefsElement(content: content) }

#endif
