#if !os(WASI)

import Foundation
import WebTypes

/// SVGProtocol text content elements (tspan, textPath).
/// https://www.w3.org/TR/SVG2/text.html#InterfaceSVGTextContentElement
public struct SVGTextContentElement: SVGGraphicsElementProtocol, Sendable {
	public let name: String
	public let attributes: [(String, String)]
	let children: [any SVGProtocol]
	let text: String?
	
	public init(name: String, text: String? = nil, @SVGBuilder content: () -> [any SVGProtocol] = { [] }) {
		self.name = name
		self.attributes = []
		self.children = content()
		self.text = text
	}
	
	private init(name: String, attributes: [(String, String)], children: [any SVGProtocol], text: String?) {
		self.name = name
		self.attributes = attributes
		self.children = children
		self.text = text
	}
	
	public func render(indent: Int = 0) -> String {
		let ind = String(repeating: "  ", count: indent)
		let attrs = attributes.isEmpty ? "" : " " + attributes.map { "\($0.0)=\"\($0.1)\"" }.joined(separator: " ")
		
		let content: String
		if let text = text {
			content = text
		} else {
			content = children.map { $0.render(indent: indent + 1) }.joined(separator: "\n")
		}
		
		if content.isEmpty {
			return "\(ind)<\(name)\(attrs)></\(name)>"
		} else if text != nil {
			return "\(ind)<\(name)\(attrs)>\(content)</\(name)>"
		} else {
			return "\(ind)<\(name)\(attrs)>\n\(content)\n\(ind)</\(name)>"
		}
	}
	
	public func addingAttribute(_ key: String, _ value: String) -> SVGTextContentElement {
		var newAttributes = attributes
		newAttributes.removeAll { $0.0 == key }
		newAttributes.append((key, value))
		return SVGTextContentElement(name: name, attributes: newAttributes, children: children, text: text)
	}
	
	// MARK: - Text Content Attributes
	
	public func x(_ value: Length) -> SVGTextContentElement { addingAttribute("x", value.value) }
	public func y(_ value: Length) -> SVGTextContentElement { addingAttribute("y", value.value) }
	public func dx(_ value: Length) -> SVGTextContentElement { addingAttribute("dx", value.value) }
	public func dy(_ value: Length) -> SVGTextContentElement { addingAttribute("dy", value.value) }
	public func rotate(_ value: Double) -> SVGTextContentElement { addingAttribute("rotate", "\(value)") }
}

/// Factory function for tspan element
public func tspan(_ text: String? = nil, @SVGBuilder _ content: () -> [any SVGProtocol] = { [] }) -> SVGTextContentElement {
	SVGTextContentElement(name: "tspan", text: text, content: content)
}

/// Factory function for textPath element
public func textPath(_ text: String? = nil, @SVGBuilder _ content: () -> [any SVGProtocol] = { [] }) -> SVGTextContentElement {
	SVGTextContentElement(name: "textPath", text: text, content: content)
}

#endif
