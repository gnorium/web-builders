#if !os(WASI)

import Foundation
import CSSBuilder
import HTMLBuilder
import WebTypes

/// SVGProtocol image element for embedding raster images.
/// https://www.w3.org/TR/SVG2/embedded.html#ImageElement
public struct SVGImageElement: SVGGraphicsElementProtocol, Sendable {
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
		return "\(ind)<image\(attrs)></image>"
	}
	
	public func addingAttribute(_ key: String, _ value: String) -> SVGImageElement {
		var newAttributes = attributes
		newAttributes.removeAll { $0.0 == key }
		newAttributes.append((key, value))
		return SVGImageElement(attributes: newAttributes)
	}
	
	// MARK: - Image-Specific Attributes
	
	public func href(_ value: String) -> SVGImageElement {
		addingAttribute("href", value)
	}
	
	public func xlinkHref(_ value: String) -> SVGImageElement {
		addingAttribute("xlink:href", value)
	}
	
	public func x(_ value: Length) -> SVGImageElement {
		addingAttribute("x", value.value)
	}
	
	public func x(_ value: Percentage) -> SVGImageElement {
		addingAttribute("x", value.value)
	}
	
	public func y(_ value: Length) -> SVGImageElement {
		addingAttribute("y", value.value)
	}
	
	public func y(_ value: Percentage) -> SVGImageElement {
		addingAttribute("y", value.value)
	}
	
	public func width(_ value: Length) -> SVGImageElement {
		addingAttribute("width", value.value)
	}
	
	public func width(_ value: Percentage) -> SVGImageElement {
		addingAttribute("width", value.value)
	}
	
	public func height(_ value: Length) -> SVGImageElement {
		addingAttribute("height", value.value)
	}
	
	public func height(_ value: Percentage) -> SVGImageElement {
		addingAttribute("height", value.value)
	}
	
	public func preserveAspectRatio(_ value: String) -> SVGImageElement {
		addingAttribute("preserveAspectRatio", value)
	}
	
	// MARK: - Style
	
	public func style(prefix: Bool = true, @CSSBuilder _ content: () -> [any CSSProtocol]) -> SVGImageElement {
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

/// Factory function for image element
public func image() -> SVGImageElement { SVGImageElement() }

#endif
