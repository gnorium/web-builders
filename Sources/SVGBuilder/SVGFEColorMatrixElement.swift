#if !os(WASI)

import Foundation
import WebTypes

public struct SVGFEColorMatrixElement: SVGElementProtocol, Sendable {
	public let attributes: [(String, String)]
	let children: [any SVGProtocol]

	public init(attributes: [(String, String)], children: [any SVGProtocol] = []) {
		self.attributes = attributes
		self.children = children
	}

	public func render(indent: Int = 0) -> String {
		let ind = String(repeating: "  ", count: indent)
		let attrs = attributes.isEmpty ? "" : " " + attributes.map { "\($0.0)=\"\($0.1)\"" }.joined(separator: " ")
		return "\(ind)<feColorMatrix\(attrs)></feColorMatrix>"
	}

	public func addingAttribute(_ key: String, _ value: String) -> SVGFEColorMatrixElement {
		var newAttributes = attributes
		newAttributes.removeAll { $0.0 == key }
		newAttributes.append((key, value))
		return SVGFEColorMatrixElement(attributes: newAttributes, children: children)
	}

	public func `in`(_ value: String) -> SVGFEColorMatrixElement { addingAttribute("in", value) }
	public func result(_ value: String) -> SVGFEColorMatrixElement { addingAttribute("result", value) }
}

public func feColorMatrix(type: SVGColorMatrixType, values: String, in input: SVGFilterInput? = nil, result: SVGFilterInput? = nil) -> SVGFEColorMatrixElement {
	var el = SVGFEColorMatrixElement(attributes: [("type", type.rawValue)])
	if !values.isEmpty { el = el.addingAttribute("values", values) }
	if let input = input { el = el.in(input.value) }
	if let result = result { el = el.result(result.value) }
	return el
}

public func feColorMatrix(values: SVGColorMatrix, in input: SVGFilterInput? = nil, result: SVGFilterInput? = nil) -> SVGFEColorMatrixElement {
	feColorMatrix(type: .matrix, values: values.value, in: input, result: result)
}

public func feColorMatrix(
    values v: (SVGColorMatrix.Row, SVGColorMatrix.Row, SVGColorMatrix.Row, SVGColorMatrix.Row),
    in input: SVGFilterInput? = nil,
    result: SVGFilterInput? = nil
) -> SVGFEColorMatrixElement {
    feColorMatrix(values: SVGColorMatrix(v.0, v.1, v.2, v.3), in: input, result: result)
}

#endif
