#if !os(WASI)

import Foundation
import WebTypes
import HTMLBuilder

/// SVGProtocol container elements (switch, foreignObject).
/// https://www.w3.org/TR/SVG2/struct.html#InterfaceSVGForeignObjectElement
public struct SVGContainerElement: SVGGraphicsElementProtocol, Sendable {
	public let name: String
	public let attributes: [(String, String)]
	let children: [any SVGProtocol]
	let htmlChildren: [any HTMLProtocol]
	
	public init(name: String, @SVGBuilder content: () -> [any SVGProtocol] = { [] }) {
		self.name = name
		self.attributes = []
		self.children = content()
		self.htmlChildren = []
	}
	
	public init(name: String, @HTMLBuilder htmlContent: () -> [any HTMLProtocol]) {
		self.name = name
		self.attributes = []
		self.children = []
		self.htmlChildren = htmlContent()
	}
	
	private init(name: String, attributes: [(String, String)], children: [any SVGProtocol], htmlChildren: [any HTMLProtocol]) {
		self.name = name
		self.attributes = attributes
		self.children = children
		self.htmlChildren = htmlChildren
	}
	
	public func render(indent: Int = 0) -> String {
		let ind = String(repeating: "  ", count: indent)
		let attrs = attributes.isEmpty ? "" : " " + attributes.map { "\($0.0)=\"\($0.1)\"" }.joined(separator: " ")
		
		if children.isEmpty && htmlChildren.isEmpty {
			return "\(ind)<\(name)\(attrs)></\(name)>"
		} else {
			let renderedContent: String
			if !children.isEmpty {
				renderedContent = children.map { $0.render(indent: indent + 1) }.joined(separator: "\n")
			} else {
				renderedContent = htmlChildren.map { $0.render(indent: indent + 1) }.joined(separator: "\n")
			}
			return "\(ind)<\(name)\(attrs)>\n\(renderedContent)\n\(ind)</\(name)>"
		}
	}
	
	public func addingAttribute(_ key: String, _ value: String) -> SVGContainerElement {
		var newAttributes = attributes
		newAttributes.removeAll { $0.0 == key }
		newAttributes.append((key, value))
		return SVGContainerElement(name: name, attributes: newAttributes, children: children, htmlChildren: htmlChildren)
	}
	
	// MARK: - Dimensions
	
	public func x(_ value: Length) -> SVGContainerElement { addingAttribute("x", value.value) }
	public func y(_ value: Length) -> SVGContainerElement { addingAttribute("y", value.value) }
	public func width(_ value: Length) -> SVGContainerElement { addingAttribute("width", value.value) }
	public func height(_ value: Length) -> SVGContainerElement { addingAttribute("height", value.value) }
}

/// Factory function for switch element
public func switch_SVG(@SVGBuilder _ content: () -> [any SVGProtocol] = { [] }) -> SVGContainerElement {
	SVGContainerElement(name: "switch", content: content)
}

/// Factory function for foreignObject element (SVGProtocol content)
public func foreignObject(@SVGBuilder _ content: () -> [any SVGProtocol] = { [] }) -> SVGContainerElement {
	SVGContainerElement(name: "foreignObject", content: content)
}

/// Factory function for foreignObject element (HTMLProtocol content)
public func foreignObject(@HTMLBuilder _ htmlContent: () -> [any HTMLProtocol]) -> SVGContainerElement {
	SVGContainerElement(name: "foreignObject", htmlContent: htmlContent)
}

#endif
