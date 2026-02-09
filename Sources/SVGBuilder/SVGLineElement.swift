#if !os(WASI)

import Foundation
import CSSBuilder
import HTMLBuilder
import WebTypes

/// SVGProtocol line element for drawing straight lines.
/// https://www.w3.org/TR/SVG2/shapes.html#LineElement
public struct SVGLineElement: SVGGeometryElementProtocol, Sendable {
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
			return "\(ind)<line\(attrs)></line>"
		} else {
			let renderedContent = children.map { $0.render(indent: indent + 1) }.joined(separator: "\n")
			return "\(ind)<line\(attrs)>\n\(renderedContent)\n\(ind)</line>"
		}
	}
	
	public func addingAttribute(_ key: String, _ value: String) -> SVGLineElement {
		var newAttributes = attributes
		newAttributes.removeAll { $0.0 == key }
		newAttributes.append((key, value))
		return SVGLineElement(attributes: newAttributes, children: children)
	}
	
	// MARK: - Line-Specific Attributes (Content removed)
	
	// MARK: - Line-Specific Attributes
	
	public func x1(_ value: Length) -> SVGLineElement {
		addingAttribute("x1", value.value)
	}
	
	public func x1(_ value: Percentage) -> SVGLineElement {
		addingAttribute("x1", value.value)
	}
	
	public func y1(_ value: Length) -> SVGLineElement {
		addingAttribute("y1", value.value)
	}
	
	public func y1(_ value: Percentage) -> SVGLineElement {
		addingAttribute("y1", value.value)
	}
	
	public func x2(_ value: Length) -> SVGLineElement {
		addingAttribute("x2", value.value)
	}
	
	public func x2(_ value: Percentage) -> SVGLineElement {
		addingAttribute("x2", value.value)
	}
	
	public func y2(_ value: Length) -> SVGLineElement {
		addingAttribute("y2", value.value)
	}
	
	public func y2(_ value: Percentage) -> SVGLineElement {
		addingAttribute("y2", value.value)
	}
	
	// MARK: - Style
	
	public func style(prefix: Bool = true, @CSSBuilder _ content: () -> [any CSSProtocol]) -> SVGLineElement {
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

/// Factory function for line element
public func line(@SVGBuilder _ content: () -> [any SVGProtocol] = { [] }) -> SVGLineElement {
	SVGLineElement(content: content)
}

#endif
