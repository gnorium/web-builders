#if !os(WASI)

import Foundation
import WebTypes

/// SVGProtocol feComponentTransfer element.
/// https://www.w3.org/TR/SVG2/filters.html#InterfaceSVGFEComponentTransferElement
public struct SVGFEComponentTransferElement: SVGElementProtocol, Sendable {
	public let attributes: [(String, String)]
	let children: [any SVGProtocol]

	public init(attributes: [(String, String)] = [], children: [any SVGProtocol] = []) {
		self.attributes = attributes
		self.children = children
	}

	public func render(indent: Int = 0) -> String {
		let ind = String(repeating: "  ", count: indent)
		let attrs = attributes.isEmpty ? "" : " " + attributes.map { "\($0.0)=\"\($0.1)\"" }.joined(separator: " ")

		if children.isEmpty {
			return "\(ind)<feComponentTransfer\(attrs)></feComponentTransfer>"
		} else {
			let renderedContent = children.map { $0.render(indent: indent + 1) }.joined(separator: "\n")
			return "\(ind)<feComponentTransfer\(attrs)>\n\(renderedContent)\n\(ind)</feComponentTransfer>"
		}
	}

	public func addingAttribute(_ key: String, _ value: String) -> SVGFEComponentTransferElement {
		var newAttributes = attributes
		newAttributes.removeAll { $0.0 == key }
		newAttributes.append((key, value))
		return SVGFEComponentTransferElement(attributes: newAttributes, children: children)
	}

	public func `in`(_ value: String) -> SVGFEComponentTransferElement { addingAttribute("in", value) }
	public func result(_ value: String) -> SVGFEComponentTransferElement { addingAttribute("result", value) }
}

// MARK: - Factory Function

public func feComponentTransfer(
	in input: SVGFilterInput? = nil,
	result: SVGFilterInput? = nil,
	@SVGBuilder _ content: () -> [any SVGProtocol]
) -> SVGFEComponentTransferElement {
	var el = SVGFEComponentTransferElement(children: content())
	if let input = input { el = el.in(input.value) }
	if let result = result { el = el.result(result.value) }
	return el
}

#endif
