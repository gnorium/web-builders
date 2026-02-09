#if !os(WASI)

import Foundation
import CSSBuilder
import HTMLBuilder
import WebTypes

/// SVGProtocol use element for referencing other elements.
/// https://www.w3.org/TR/SVG2/struct.html#UseElement
public struct SVGUseElement: SVGGraphicsElementProtocol, Sendable {
	public let attributes: [(String, String)]
	
	public init() {
		self.attributes = []
	}
	
	private init(attributes: [(String, String)]) {
		self.attributes = attributes
	}
	
	public func render(indent: Int = 0) -> String {
		let ind = String(repeating: "  ", count: indent)
		let attrs = attributes.isEmpty ? "" : " " + attributes.map { "\($0.0)=\"\($0.1)\"" }.joined(separator: " ")
		return "\(ind)<use\(attrs)></use>"
	}
	
	public func addingAttribute(_ key: String, _ value: String) -> SVGUseElement {
		var newAttributes = attributes
		newAttributes.removeAll { $0.0 == key }
		newAttributes.append((key, value))
		return SVGUseElement(attributes: newAttributes)
	}
	
	// MARK: - Use-Specific Attributes
	
	public func href(_ value: String) -> SVGUseElement {
		addingAttribute("href", value)
	}
	
	public func xlinkHref(_ value: String) -> SVGUseElement {
		addingAttribute("xlink:href", value)
	}
	
	public func x(_ value: Length) -> SVGUseElement {
		addingAttribute("x", value.value)
	}
	
	public func x(_ value: Percentage) -> SVGUseElement {
		addingAttribute("x", value.value)
	}
	
	public func y(_ value: Length) -> SVGUseElement {
		addingAttribute("y", value.value)
	}
	
	public func y(_ value: Percentage) -> SVGUseElement {
		addingAttribute("y", value.value)
	}
	
	public func width(_ value: Length) -> SVGUseElement {
		addingAttribute("width", value.value)
	}
	
	public func height(_ value: Length) -> SVGUseElement {
		addingAttribute("height", value.value)
	}
	
	// MARK: - Style
	
	public func style(prefix: Bool = true, @CSSBuilder _ content: () -> [any CSSProtocol]) -> SVGUseElement {
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

/// Factory function for use element
public func use() -> SVGUseElement { SVGUseElement() }

#endif
