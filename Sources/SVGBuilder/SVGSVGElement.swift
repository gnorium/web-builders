#if !os(WASI)

import Foundation
import CSSBuilder
import HTMLBuilder
import WebTypes

/// SVGProtocol root element.
/// https://www.w3.org/TR/SVG2/struct.html#SVGElementProtocol
public struct SVGSVGElementProtocol: SVGGraphicsElementProtocol, Sendable {
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
			return "\(ind)<svg\(attrs)></svg>"
		} else {
			let renderedContent = children.map { $0.render(indent: indent + 1) }.joined(separator: "\n")
			return "\(ind)<svg\(attrs)>\n\(renderedContent)\n\(ind)</svg>"
		}
	}
	
	public func addingAttribute(_ key: String, _ value: String) -> SVGSVGElementProtocol {
		var newAttributes = attributes
		newAttributes.removeAll { $0.0 == key }
		newAttributes.append((key, value))
		return SVGSVGElementProtocol(attributes: newAttributes, children: children)
	}
	
	// MARK: - SVGProtocol-Specific Attributes
	
	public func viewBox(_ minX: Int, _ minY: Int, _ width: Int, _ height: Int) -> SVGSVGElementProtocol {
		addingAttribute("viewBox", "\(minX) \(minY) \(width) \(height)")
	}
	
	public func viewBox(_ minX: Double, _ minY: Double, _ width: Double, _ height: Double) -> SVGSVGElementProtocol {
		addingAttribute("viewBox", "\(minX) \(minY) \(width) \(height)")
	}
	
	public func xmlns(_ value: String) -> SVGSVGElementProtocol {
		addingAttribute("xmlns", value)
	}
	
	public func xmlnsXlink(_ value: String) -> SVGSVGElementProtocol {
		addingAttribute("xmlns:xlink", value)
	}
	
	public func width(_ value: Length) -> SVGSVGElementProtocol {
		addingAttribute("width", value.value)
	}
	
	public func width(_ value: Percentage) -> SVGSVGElementProtocol {
		addingAttribute("width", value.value)
	}
	
	public func height(_ value: Length) -> SVGSVGElementProtocol {
		addingAttribute("height", value.value)
	}
	
	public func height(_ value: Percentage) -> SVGSVGElementProtocol {
		addingAttribute("height", value.value)
	}
	
	public func preserveAspectRatio(_ value: String) -> SVGSVGElementProtocol {
		addingAttribute("preserveAspectRatio", value)
	}
	
	// MARK: - Style
	
	public func style(prefix: Bool = true, @CSSBuilder _ content: () -> [any CSSProtocol]) -> SVGSVGElementProtocol {
		let cssItems = content()
		let className = attributes.first(where: { $0.0 == "class" })?.1 ?? ""
		let existingStyle = attributes.first(where: { $0.0 == "style" })?.1

		let (inlineStyle, _) = processStyleBlock(
			cssItems: cssItems,
			prefix: prefix,
			className: className,
			existingStyle: existingStyle
		)

		return inlineStyle.isEmpty ? self : addingAttribute("style", inlineStyle)
	}
}

/// Factory function for svg root element
public func svg(@SVGBuilder _ content: () -> [any SVGProtocol] = { [] }) -> SVGSVGElementProtocol { SVGSVGElementProtocol(content: content) }

#endif
