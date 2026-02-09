#if !os(WASI)

import Foundation
import WebTypes

/// Generic SVGProtocol Filter Primitive (feGaussianBlur, feOffset, feComposite, feBlend, feMerge, feFlood, feDropShadow).
/// https://www.w3.org/TR/SVG2/filters.html#InterfaceSVGFilterPrimitiveStandardAttributes
public struct SVGFilterPrimitive: SVGElementProtocol, Sendable {
	public let name: String
	public let attributes: [(String, String)]
	let children: [any SVGProtocol]
	
	public init(name: String, @SVGBuilder content: () -> [any SVGProtocol] = { [] }) {
		self.name = name
		self.attributes = []
		self.children = content()
	}
	
	private init(name: String, attributes: [(String, String)], children: [any SVGProtocol]) {
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

public func feGaussianBlur(stdDeviation: Double, in input: SVGFilterInput? = nil, result: SVGFilterInput? = nil) -> SVGFilterPrimitive {
	var el = SVGFilterPrimitive(name: "feGaussianBlur")
		.addingAttribute("stdDeviation", "\(stdDeviation)")
	if let input = input { el = el.in(input.value) }
	if let result = result { el = el.result(result.value) }
	return el
}

public func feOffset(dx: Double, dy: Double, in input: SVGFilterInput? = nil, result: SVGFilterInput? = nil) -> SVGFilterPrimitive {
	var el = SVGFilterPrimitive(name: "feOffset")
		.addingAttribute("dx", "\(dx)")
		.addingAttribute("dy", "\(dy)")
	if let input = input { el = el.in(input.value) }
	if let result = result { el = el.result(result.value) }
	return el
}

public func feComposite(operator op: SVGCompositeOperator, in input: SVGFilterInput? = nil, in2: SVGFilterInput? = nil, result: SVGFilterInput? = nil) -> SVGFilterPrimitive {
	var el = SVGFilterPrimitive(name: "feComposite")
		.addingAttribute("operator", op.rawValue)
	if let input = input { el = el.in(input.value) }
	if let in2 = in2 { el = el.in2(in2.value) }
	if let result = result { el = el.result(result.value) }
	return el
}

public func feComposite(operator op: SVGCompositeOperator, in inputs: (SVGFilterInput, SVGFilterInput), result: SVGFilterInput? = nil) -> SVGFilterPrimitive {
	feComposite(operator: op, in: inputs.0, in2: inputs.1, result: result)
}

public func feBlend(mode: SVGBlendMode, in input: SVGFilterInput? = nil, in2: SVGFilterInput? = nil, result: SVGFilterInput? = nil) -> SVGFilterPrimitive {
	var el = SVGFilterPrimitive(name: "feBlend")
		.addingAttribute("mode", mode.rawValue)
	if let input = input { el = el.in(input.value) }
	if let in2 = in2 { el = el.in2(in2.value) }
	if let result = result { el = el.result(result.value) }
	return el
}

public func feBlend(mode: SVGBlendMode, in inputs: (SVGFilterInput, SVGFilterInput), result: SVGFilterInput? = nil) -> SVGFilterPrimitive {
	feBlend(mode: mode, in: inputs.0, in2: inputs.1, result: result)
}

public func feMerge(@SVGBuilder _ content: () -> [any SVGProtocol]) -> SVGFilterPrimitive {
	SVGFilterPrimitive(name: "feMerge", content: content)
}

public func feMergeNode(in input: String) -> SVGFilterPrimitive {
	SVGFilterPrimitive(name: "feMergeNode").in(input)
}

public func feFlood(floodColor: CSSColor, floodOpacity: Double? = nil, result: SVGFilterInput? = nil) -> SVGFilterPrimitive {
	var el = SVGFilterPrimitive(name: "feFlood")
		.addingAttribute("flood-color", floodColor.value)
	if let op = floodOpacity { el = el.addingAttribute("flood-opacity", "\(op)") }
	if let res = result { el = el.result(res.value) }
	return el
}

public func feDropShadow(dx: Double, dy: Double, stdDeviation: Double, floodColor: CSSColor? = nil, floodOpacity: Double? = nil, in input: SVGFilterInput? = nil, result: SVGFilterInput? = nil) -> SVGFilterPrimitive {
	var el = SVGFilterPrimitive(name: "feDropShadow")
		.addingAttribute("dx", "\(dx)")
		.addingAttribute("dy", "\(dy)")
		.addingAttribute("stdDeviation", "\(stdDeviation)")
	if let floodColor = floodColor { el = el.addingAttribute("flood-color", floodColor.value) }
	if let floodOpacity = floodOpacity { el = el.addingAttribute("flood-opacity", "\(floodOpacity)") }
	if let input = input { el = el.in(input.value) }
	if let result = result { el = el.result(result.value) }
	return el
}

#endif
