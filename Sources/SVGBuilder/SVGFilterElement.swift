#if !os(WASI)

import Foundation
import WebTypes

/// SVG filter element.
/// https://www.w3.org/TR/SVG2/filters.html#FilterElement
public struct SVGFilterElement: SVGElement, Sendable {
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
	public func filterUnits(_ value: String) -> SVGFilterElement { addingAttribute("filterUnits", value) }
}

/// Generic SVG Filter Primitive (feGaussianBlur, feOffset, etc.)
public struct SVGFilterPrimitive: SVGElement, Sendable {
	public let name: String
	public let attributes: [(String, String)]
	let children: [any SVG]
	
	public init(name: String, @SVGBuilder content: () -> [any SVG] = { [] }) {
		self.name = name
		self.attributes = []
		self.children = content()
	}
	
	private init(name: String, attributes: [(String, String)], children: [any SVG]) {
		self.name = name
		self.attributes = attributes
		self.children = children
	}
	
	public func render(indent: Int = 0) -> String {
		let ind = String(repeating: "  ", count: indent)
		let attrs = attributes.isEmpty ? "" : " " + attributes.map { "\($0.0)=\"\($0.1)\"" }.joined(separator: " ")
		
		if children.isEmpty {
			return "\(ind)<\(name)\(attrs)></\(name)>"
		} else {
			let renderedContent = children.map { $0.render(indent: indent + 1) }.joined(separator: "\n")
			return "\(ind)<\(name)\(attrs)>\n\(renderedContent)\n\(ind)</\(name)>"
		}
	}
	
	public func addingAttribute(_ key: String, _ value: String) -> SVGFilterPrimitive {
		var newAttributes = attributes
		newAttributes.removeAll { $0.0 == key }
		newAttributes.append((key, value))
		return SVGFilterPrimitive(name: name, attributes: newAttributes, children: children)
	}
	
	// MARK: - Common Primitive Attributes
	
	public func `in`(_ value: String) -> SVGFilterPrimitive { addingAttribute("in", value) }
	public func in2(_ value: String) -> SVGFilterPrimitive { addingAttribute("in2", value) }
	public func result(_ value: String) -> SVGFilterPrimitive { addingAttribute("result", value) }
	public func x(_ value: Length) -> SVGFilterPrimitive { addingAttribute("x", value.value) }
	public func y(_ value: Length) -> SVGFilterPrimitive { addingAttribute("y", value.value) }
	public func width(_ value: Length) -> SVGFilterPrimitive { addingAttribute("width", value.value) }
	public func height(_ value: Length) -> SVGFilterPrimitive { addingAttribute("height", value.value) }
}

// MARK: - Factory Functions

public func filter(@SVGBuilder _ content: () -> [any SVG] = { [] }) -> SVGFilterElement { SVGFilterElement(content: content) }

public func feGaussianBlur(stdDeviation: Double, in input: String? = nil, result: String? = nil) -> SVGFilterPrimitive {
	var el = SVGFilterPrimitive(name: "feGaussianBlur")
		.addingAttribute("stdDeviation", "\(stdDeviation)")
	if let input = input { el = el.in(input) }
	if let result = result { el = el.result(result) }
	return el
}

public func feOffset(dx: Double, dy: Double, in input: String? = nil, result: String? = nil) -> SVGFilterPrimitive {
	var el = SVGFilterPrimitive(name: "feOffset")
		.addingAttribute("dx", "\(dx)")
		.addingAttribute("dy", "\(dy)")
	if let input = input { el = el.in(input) }
	if let result = result { el = el.result(result) }
	return el
}

public func feColorMatrix(type: String, values: String, in input: String? = nil, result: String? = nil) -> SVGFilterPrimitive {
	var el = SVGFilterPrimitive(name: "feColorMatrix")
		.addingAttribute("type", type)
		.addingAttribute("values", values)
	if let input = input { el = el.in(input) }
	if let result = result { el = el.result(result) }
	return el
}

public func feComposite(operator: String, in input: String? = nil, in2: String? = nil, result: String? = nil) -> SVGFilterPrimitive {
	var el = SVGFilterPrimitive(name: "feComposite")
		.addingAttribute("operator", `operator`)
	if let input = input { el = el.in(input) }
	if let in2 = in2 { el = el.in2(in2) }
	if let result = result { el = el.result(result) }
	return el
}

public func feBlend(mode: String, in input: String? = nil, in2: String? = nil, result: String? = nil) -> SVGFilterPrimitive {
	var el = SVGFilterPrimitive(name: "feBlend")
		.addingAttribute("mode", mode)
	if let input = input { el = el.in(input) }
	if let in2 = in2 { el = el.in2(in2) }
	if let result = result { el = el.result(result) }
	return el
}

public func feMerge(@SVGBuilder _ content: () -> [any SVG]) -> SVGFilterPrimitive {
	SVGFilterPrimitive(name: "feMerge", content: content)
}

public func feMergeNode(in input: String) -> SVGFilterPrimitive {
	SVGFilterPrimitive(name: "feMergeNode").in(input)
}

public func feFlood(floodColor: CSSColor, floodOpacity: Double? = nil, result: String? = nil) -> SVGFilterPrimitive {
	var el = SVGFilterPrimitive(name: "feFlood")
		.addingAttribute("flood-color", floodColor.value)
	if let op = floodOpacity { el = el.addingAttribute("flood-opacity", "\(op)") }
	if let res = result { el = el.result(res) }
	return el
}

#endif
