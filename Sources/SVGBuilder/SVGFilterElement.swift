#if !os(WASI)

import Foundation
import WebTypes

/// SVGProtocol filter element.
/// https://www.w3.org/TR/SVG2/filters.html#FilterElement
public struct SVGFilterElement: SVGElementProtocol, Sendable {
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
			return "\(ind)<filter\(attrs)></filter>"
		} else {
			let renderedContent = children.map { $0.render(indent: indent + 1) }.joined(separator: "\n")
			return "\(ind)<filter\(attrs)>\n\(renderedContent)\n\(ind)</filter>"
		}
	}
	
	public func addingAttribute(_ key: String, _ value: String) -> SVGFilterElement {
		var newAttributes = attributes
		newAttributes.removeAll { $0.0 == key }
		newAttributes.append((key, value))
		return SVGFilterElement(attributes: newAttributes, children: children)
	}
	
	// MARK: - Filter Attributes
	
	public func x(_ value: Length) -> SVGFilterElement { addingAttribute("x", value.value) }
	public func y(_ value: Length) -> SVGFilterElement { addingAttribute("y", value.value) }
	public func width(_ value: Length) -> SVGFilterElement { addingAttribute("width", value.value) }
	public func height(_ value: Length) -> SVGFilterElement { addingAttribute("height", value.value) }
	public func x(_ value: Percentage) -> SVGFilterElement { addingAttribute("x", value.value) }
	public func y(_ value: Percentage) -> SVGFilterElement { addingAttribute("y", value.value) }
	public func width(_ value: Percentage) -> SVGFilterElement { addingAttribute("width", value.value) }
	public func height(_ value: Percentage) -> SVGFilterElement { addingAttribute("height", value.value) }
	public func filterUnits(_ value: String) -> SVGFilterElement { addingAttribute("filterUnits", value) }
}

// MARK: - Factory Function

public func filter(@SVGBuilder _ content: () -> [any SVGProtocol] = { [] }) -> SVGFilterElement {
	SVGFilterElement(content: content)
}

#endif
