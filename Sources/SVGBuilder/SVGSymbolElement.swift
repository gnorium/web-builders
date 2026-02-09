#if !os(WASI)

import Foundation
import CSSBuilder
import WebTypes

/// SVGProtocol symbol element for reusable graphics.
/// https://www.w3.org/TR/SVG2/struct.html#SymbolElement
public struct SVGSymbolElement: SVGGraphicsElementProtocol, Sendable {
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
			return "\(ind)<symbol\(attrs)></symbol>"
		} else {
			let renderedContent = children.map { $0.render(indent: indent + 1) }.joined(separator: "\n")
			return "\(ind)<symbol\(attrs)>\n\(renderedContent)\n\(ind)</symbol>"
		}
	}
	
	public func addingAttribute(_ key: String, _ value: String) -> SVGSymbolElement {
		var newAttributes = attributes
		newAttributes.removeAll { $0.0 == key }
		newAttributes.append((key, value))
		return SVGSymbolElement(attributes: newAttributes, children: children)
	}
	
	// MARK: - Symbol-Specific Attributes
	
	public func viewBox(_ minX: Int, _ minY: Int, _ width: Int, _ height: Int) -> SVGSymbolElement {
		addingAttribute("viewBox", "\(minX) \(minY) \(width) \(height)")
	}
	
	public func preserveAspectRatio(_ value: String) -> SVGSymbolElement {
		addingAttribute("preserveAspectRatio", value)
	}
	
	public func refX(_ value: Length) -> SVGSymbolElement {
		addingAttribute("refX", value.value)
	}
	
	public func refY(_ value: Length) -> SVGSymbolElement {
		addingAttribute("refY", value.value)
	}
	

}

/// Factory function for symbol element
public func symbol(@SVGBuilder _ content: () -> [any SVGProtocol] = { [] }) -> SVGSymbolElement { 
	SVGSymbolElement(content: content) 
}

#endif
