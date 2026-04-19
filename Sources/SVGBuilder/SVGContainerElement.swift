#if CLIENT

import EmbeddedSwiftUtilities

#endif

import WebTypes
import DOMBuilder
import HTMLBuilder

/// SVGContent container elements (switch, foreignObject).
/// https://www.w3.org/TR/SVG2/struct.html#InterfaceSVGForeignObjectElement
public struct SVGContainerElement: SVGGraphicsElementRenderable, Sendable {
	public let name: String
	public let attributes: [(String, String)]
	let children: [DOMNode]
	let htmlChildren: [DOMNode]
	
	public init(name: String, @SVGBuilder content: () -> [DOMNode] = { [] }) {
		self.name = name
		self.attributes = []
		self.children = content()
		self.htmlChildren = []
	}
	
	public init(name: String, @HTMLBuilder htmlContent: () -> [DOMNode]) {
		self.name = name
		self.attributes = []
		self.children = []
		self.htmlChildren = htmlContent()
	}
	
	private init(name: String, attributes: [(String, String)], children: [DOMNode], htmlChildren: [DOMNode]) {
		self.name = name
		self.attributes = attributes
		self.children = children
		self.htmlChildren = htmlChildren
	}
	
	public func render() -> DOMNode {
		.element(ns: .svg, tag: name, attributes: attributes, children: children.isEmpty ? htmlChildren : children)
	}

	public func addingAttribute(_ key: String, _ value: String) -> SVGContainerElement {
		var newAttributes = attributes
		newAttributes.removeAll { $0.0 == key }
		newAttributes.append((key, value))
		return SVGContainerElement(name: name, attributes: newAttributes, children: children, htmlChildren: htmlChildren)
	}
	
	// MARK: - Dimensions
	
	public func x(_ value: Length) -> SVGContainerElement { addingAttribute("x", value.value) }
	public func x(_ value: Percentage) -> SVGContainerElement { addingAttribute("x", value.value) }
	public func x(_ value: Int) -> SVGContainerElement { addingAttribute("x", "\(value)px") }
	public func x(_ value: Double) -> SVGContainerElement { addingAttribute("x", "\(value)px") }
	public func x(_ value: Float) -> SVGContainerElement { addingAttribute("x", "\(value)px") }

	public func y(_ value: Length) -> SVGContainerElement { addingAttribute("y", value.value) }
	public func y(_ value: Percentage) -> SVGContainerElement { addingAttribute("y", value.value) }
	public func y(_ value: Int) -> SVGContainerElement { addingAttribute("y", "\(value)px") }
	public func y(_ value: Double) -> SVGContainerElement { addingAttribute("y", "\(value)px") }
	public func y(_ value: Float) -> SVGContainerElement { addingAttribute("y", "\(value)px") }

	public func width(_ value: Length) -> SVGContainerElement { addingAttribute("width", value.value) }
	public func width(_ value: Percentage) -> SVGContainerElement { addingAttribute("width", value.value) }
	public func width(_ value: Int) -> SVGContainerElement { addingAttribute("width", "\(value)px") }
	public func width(_ value: Double) -> SVGContainerElement { addingAttribute("width", "\(value)px") }
	public func width(_ value: Float) -> SVGContainerElement { addingAttribute("width", "\(value)px") }

	public func height(_ value: Length) -> SVGContainerElement { addingAttribute("height", value.value) }
	public func height(_ value: Percentage) -> SVGContainerElement { addingAttribute("height", value.value) }
	public func height(_ value: Int) -> SVGContainerElement { addingAttribute("height", "\(value)px") }
	public func height(_ value: Double) -> SVGContainerElement { addingAttribute("height", "\(value)px") }
	public func height(_ value: Float) -> SVGContainerElement { addingAttribute("height", "\(value)px") }
}

/// Factory function for switch element
public func switch_SVG(@SVGBuilder _ content: () -> [DOMNode] = { [] }) -> SVGContainerElement {
	SVGContainerElement(name: "switch", content: content)
}

/// Factory function for foreignObject element (SVGContent content)
public func foreignObject(@SVGBuilder _ content: () -> [DOMNode] = { [] }) -> SVGContainerElement {
	SVGContainerElement(name: "foreignObject", content: content)
}

/// Factory function for foreignObject element (HTMLContent content)
public func foreignObject(@HTMLBuilder htmlContent: () -> [DOMNode]) -> SVGContainerElement {
	SVGContainerElement(name: "foreignObject", htmlContent: htmlContent)
}
