#if !os(WASI)

import Foundation
import CSSBuilder
import WebTypes

/// SVGProtocol clipPath element for clipping.
/// https://www.w3.org/TR/SVG2/render.html#ClipPathElement
public struct SVGClipPathElement: SVGElementProtocol, Sendable {
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
			return "\(ind)<clipPath\(attrs)></clipPath>"
		} else {
			let renderedContent = children.map { $0.render(indent: indent + 1) }.joined(separator: "\n")
			return "\(ind)<clipPath\(attrs)>\n\(renderedContent)\n\(ind)</clipPath>"
		}
	}
	
	public func addingAttribute(_ key: String, _ value: String) -> SVGClipPathElement {
		var newAttributes = attributes
		newAttributes.removeAll { $0.0 == key }
		newAttributes.append((key, value))
		return SVGClipPathElement(attributes: newAttributes, children: children)
	}
	
	// MARK: - ClipPath-Specific Attributes
	
	public func clipPathUnits(_ value: String) -> SVGClipPathElement {
		addingAttribute("clipPathUnits", value)
	}
	

}

/// Factory function for clipPath element
public func clipPath(@SVGBuilder _ content: () -> [any SVGProtocol] = { [] }) -> SVGClipPathElement { 
	SVGClipPathElement(content: content) 
}

#endif
