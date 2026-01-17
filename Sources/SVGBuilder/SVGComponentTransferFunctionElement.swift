#if !os(WASI)

import Foundation
import WebTypes

/// SVG Component Transfer Function Element (feFuncR, feFuncG, feFuncB, feFuncA).
/// https://www.w3.org/TR/SVG2/filters.html#InterfaceSVGComponentTransferFunctionElement
public struct SVGComponentTransferFunctionElement: SVGElement, Sendable {
	public let name: String
	public let attributes: [(String, String)]

	public init(name: String, attributes: [(String, String)] = []) {
		self.name = name
		self.attributes = attributes
	}

	public func render(indent: Int = 0) -> String {
		let ind = String(repeating: "  ", count: indent)
		let attrs = attributes.isEmpty ? "" : " " + attributes.map { "\($0.0)=\"\($0.1)\"" }.joined(separator: " ")
		return "\(ind)<\(name)\(attrs)/>"
	}

	public func addingAttribute(_ key: String, _ value: String) -> SVGComponentTransferFunctionElement {
		var newAttributes = attributes
		newAttributes.removeAll { $0.0 == key }
		newAttributes.append((key, value))
		return SVGComponentTransferFunctionElement(name: name, attributes: newAttributes)
	}
}

// MARK: - Factory Functions

public func feFuncR(type: SVGTransferFunction, slope: Double? = nil, intercept: Double? = nil, tableValues: String? = nil) -> SVGComponentTransferFunctionElement {
	var el = SVGComponentTransferFunctionElement(name: "feFuncR")
		.addingAttribute("type", type.rawValue)
	if let slope = slope { el = el.addingAttribute("slope", "\(slope)") }
	if let intercept = intercept { el = el.addingAttribute("intercept", "\(intercept)") }
	if let tableValues = tableValues { el = el.addingAttribute("tableValues", tableValues) }
	return el
}

public func feFuncG(type: SVGTransferFunction, slope: Double? = nil, intercept: Double? = nil, tableValues: String? = nil) -> SVGComponentTransferFunctionElement {
	var el = SVGComponentTransferFunctionElement(name: "feFuncG")
		.addingAttribute("type", type.rawValue)
	if let slope = slope { el = el.addingAttribute("slope", "\(slope)") }
	if let intercept = intercept { el = el.addingAttribute("intercept", "\(intercept)") }
	if let tableValues = tableValues { el = el.addingAttribute("tableValues", tableValues) }
	return el
}

public func feFuncB(type: SVGTransferFunction, slope: Double? = nil, intercept: Double? = nil, tableValues: String? = nil) -> SVGComponentTransferFunctionElement {
	var el = SVGComponentTransferFunctionElement(name: "feFuncB")
		.addingAttribute("type", type.rawValue)
	if let slope = slope { el = el.addingAttribute("slope", "\(slope)") }
	if let intercept = intercept { el = el.addingAttribute("intercept", "\(intercept)") }
	if let tableValues = tableValues { el = el.addingAttribute("tableValues", tableValues) }
	return el
}

public func feFuncA(type: SVGTransferFunction, slope: Double? = nil, intercept: Double? = nil, tableValues: String? = nil) -> SVGComponentTransferFunctionElement {
	var el = SVGComponentTransferFunctionElement(name: "feFuncA")
		.addingAttribute("type", type.rawValue)
	if let slope = slope { el = el.addingAttribute("slope", "\(slope)") }
	if let intercept = intercept { el = el.addingAttribute("intercept", "\(intercept)") }
	if let tableValues = tableValues { el = el.addingAttribute("tableValues", tableValues) }
	return el
}

#endif
