#if !os(WASI)

import Foundation
import WebTypes

/// SVGProtocol feTurbulence element for generating noise patterns.
/// https://www.w3.org/TR/SVG2/filters.html#feTurbulenceElement
public struct SVGFETurbulenceElement: SVGElementProtocol, Sendable {
	public let attributes: [(String, String)]

	public init(attributes: [(String, String)] = []) {
		self.attributes = attributes
	}

	public func render(indent: Int = 0) -> String {
		let ind = String(repeating: "  ", count: indent)
		let attrs = attributes.isEmpty ? "" : " " + attributes.map { "\($0.0)=\"\($0.1)\"" }.joined(separator: " ")
		return "\(ind)<feTurbulence\(attrs)></feTurbulence>"
	}

	public func addingAttribute(_ key: String, _ value: String) -> SVGFETurbulenceElement {
		var newAttributes = attributes
		newAttributes.removeAll { $0.0 == key }
		newAttributes.append((key, value))
		return SVGFETurbulenceElement(attributes: newAttributes)
	}

	public func `in`(_ value: String) -> SVGFETurbulenceElement { addingAttribute("in", value) }
	public func result(_ value: String) -> SVGFETurbulenceElement { addingAttribute("result", value) }
}

public func feTurbulence(
	type: SVGTurbulence = .turbulence,
	baseFrequency: Double,
	numOctaves: Int = 1,
	seed: Int? = nil,
	in input: SVGFilterInput? = nil,
	result: SVGFilterInput? = nil
) -> SVGFETurbulenceElement {
	var el = SVGFETurbulenceElement()
		.addingAttribute("type", type.rawValue)
		.addingAttribute("baseFrequency", "\(baseFrequency)")
		.addingAttribute("numOctaves", "\(numOctaves)")
	if let seed = seed { el = el.addingAttribute("seed", "\(seed)") }
	if let input = input { el = el.in(input.value) }
	if let result = result { el = el.result(result.value) }
	return el
}

#endif
