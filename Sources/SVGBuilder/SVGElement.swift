#if !os(WASI)

import Foundation
import HTMLBuilder
import CSSBuilder
import WebTypes

public struct SVGElement: SVG {
	let name: String
	let content: [any SVG]
	let attributes: [(String, String)]
	let selfClosing: Bool

	init(_ name: String, content: [any SVG] = [], attributes: [(String, String)] = [], selfClosing: Bool = false) {
		self.name = name
		self.content = content
		self.attributes = attributes
		self.selfClosing = selfClosing
	}

	public func render(indent: Int = 0) -> String {
		let ind = String(repeating: "  ", count: indent)
		let attrs = attributes.isEmpty ? "" : " " + attributes.map { "\($0.0)=\"\($0.1)\"" }.joined(separator: " ")

		if content.isEmpty {
			// Always use explicit closing tags for XML compliance
			return "\(ind)<\(name)\(attrs)></\(name)>"
		} else {
			let renderedContent = content.map { $0.render(indent: indent + 1) }.joined(separator: "\n")
			return "\(ind)<\(name)\(attrs)>\n\(renderedContent)\n\(ind)</\(name)>"
		}
	}

	public func addingAttribute(_ name: String, _ value: String) -> SVGElement {
		SVGElement(self.name, content: content, attributes: attributes + [(name, value)], selfClosing: selfClosing)
	}
}

// MARK: - SVGElement Functions

// Container Elements
public func svg(@SVGBuilder _ content: () -> [any SVG] = { [] }) -> SVGElement { SVGElement("svg", content: content()) }
public func g(@SVGBuilder _ content: () -> [any SVG] = { [] }) -> SVGElement { SVGElement("g", content: content()) }
public func defs(@SVGBuilder _ content: () -> [any SVG] = { [] }) -> SVGElement { SVGElement("defs", content: content()) }
public func desc(@SVGBuilder _ content: () -> [any SVG] = { [] }) -> SVGElement { SVGElement("desc", content: content()) }
public func metadata(@SVGBuilder _ content: () -> [any SVG] = { [] }) -> SVGElement { SVGElement("metadata", content: content()) }
public func title_SVG(@SVGBuilder _ content: () -> [any SVG] = { [] }) -> SVGElement { SVGElement("title", content: content()) }
public func symbol(@SVGBuilder _ content: () -> [any SVG] = { [] }) -> SVGElement { SVGElement("symbol", content: content()) }
public func switch_SVG(@SVGBuilder _ content: () -> [any SVG] = { [] }) -> SVGElement { SVGElement("switch", content: content()) }
public func foreignObject(@SVGBuilder _ content: () -> [any SVG] = { [] }) -> SVGElement { SVGElement("foreignObject", content: content()) }
public func mask(@SVGBuilder _ content: () -> [any SVG] = { [] }) -> SVGElement { SVGElement("mask", content: content()) }

// Self-closing Elements
public func use() -> SVGElement { SVGElement("use", selfClosing: true) }
public func image() -> SVGElement { SVGElement("image", selfClosing: true) }

// Shape Elements
public func rect() -> SVGElement { SVGElement("rect", selfClosing: true) }
public func circle() -> SVGElement { SVGElement("circle", selfClosing: true) }
public func ellipse() -> SVGElement { SVGElement("ellipse", selfClosing: true) }
public func line() -> SVGElement { SVGElement("line", selfClosing: true) }
public func polyline() -> SVGElement { SVGElement("polyline", selfClosing: true) }
public func polygon() -> SVGElement { SVGElement("polygon", selfClosing: true) }
public func path() -> SVGElement { SVGElement("path", selfClosing: true) }

// Text Elements
public func text(@SVGBuilder _ content: () -> [any SVG] = { [] }) -> SVGElement { SVGElement("text", content: content()) }
public func tspan(@SVGBuilder _ content: () -> [any SVG] = { [] }) -> SVGElement { SVGElement("tspan", content: content()) }
public func tref() -> SVGElement { SVGElement("tref", selfClosing: true) }
public func textPath(@SVGBuilder _ content: () -> [any SVG] = { [] }) -> SVGElement { SVGElement("textPath", content: content()) }
public func altGlyph(@SVGBuilder _ content: () -> [any SVG] = { [] }) -> SVGElement { SVGElement("altGlyph", content: content()) }
public func altGlyphDef(@SVGBuilder _ content: () -> [any SVG] = { [] }) -> SVGElement { SVGElement("altGlyphDef", content: content()) }
public func altGlyphItem(@SVGBuilder _ content: () -> [any SVG] = { [] }) -> SVGElement { SVGElement("altGlyphItem", content: content()) }
public func glyph(@SVGBuilder _ content: () -> [any SVG] = { [] }) -> SVGElement { SVGElement("glyph", content: content()) }
public func glyphRef() -> SVGElement { SVGElement("glyphRef", selfClosing: true) }

// Paint Server Elements
public func linearGradient(@SVGBuilder _ content: () -> [any SVG] = { [] }) -> SVGElement { SVGElement("linearGradient", content: content()) }
public func radialGradient(@SVGBuilder _ content: () -> [any SVG] = { [] }) -> SVGElement { SVGElement("radialGradient", content: content()) }
public func stop() -> SVGElement { SVGElement("stop", selfClosing: true) }
public func pattern(@SVGBuilder _ content: () -> [any SVG] = { [] }) -> SVGElement { SVGElement("pattern", content: content()) }

// Filter Elements
public func filter(@SVGBuilder _ content: () -> [any SVG] = { [] }) -> SVGElement { SVGElement("filter", content: content()) }
public func feBlend() -> SVGElement { SVGElement("feBlend", selfClosing: true) }
public func feColorMatrix() -> SVGElement { SVGElement("feColorMatrix", selfClosing: true) }
public func feComponentTransfer(@SVGBuilder _ content: () -> [any SVG] = { [] }) -> SVGElement { SVGElement("feComponentTransfer", content: content()) }
public func feComposite() -> SVGElement { SVGElement("feComposite", selfClosing: true) }
public func feConvolveMatrix() -> SVGElement { SVGElement("feConvolveMatrix", selfClosing: true) }
public func feDiffuseLighting(@SVGBuilder _ content: () -> [any SVG] = { [] }) -> SVGElement { SVGElement("feDiffuseLighting", content: content()) }
public func feDisplacementMap() -> SVGElement { SVGElement("feDisplacementMap", selfClosing: true) }
public func feFlood() -> SVGElement { SVGElement("feFlood", selfClosing: true) }
public func feGaussianBlur() -> SVGElement { SVGElement("feGaussianBlur", selfClosing: true) }
public func feImage() -> SVGElement { SVGElement("feImage", selfClosing: true) }
public func feMerge(@SVGBuilder _ content: () -> [any SVG] = { [] }) -> SVGElement { SVGElement("feMerge", content: content()) }
public func feMorphology() -> SVGElement { SVGElement("feMorphology", selfClosing: true) }
public func feOffset() -> SVGElement { SVGElement("feOffset", selfClosing: true) }
public func feSpecularLighting(@SVGBuilder _ content: () -> [any SVG] = { [] }) -> SVGElement { SVGElement("feSpecularLighting", content: content()) }
public func feTile() -> SVGElement { SVGElement("feTile", selfClosing: true) }
public func feTurbulence() -> SVGElement { SVGElement("feTurbulence", selfClosing: true) }

// Mask/Clip Elements
public func clipPath(@SVGBuilder _ content: () -> [any SVG] = { [] }) -> SVGElement { SVGElement("clipPath", content: content()) }

extension SVGElement {
	// attributes (non-hyphenated)
	public func width(_ value: Length) -> SVGElement {
		addingAttribute("width", value.value)
	}
	
	public func width(_ value: Percentage) -> SVGElement {
		addingAttribute("width", value.value)
	}
	
	public func width(_ value: String) -> SVGElement {
		addingAttribute("width", value)
	}

	public func height(_ value: Length) -> SVGElement {
		addingAttribute("height", value.value)
	}
	
	public func height(_ value: Percentage) -> SVGElement {
		addingAttribute("height", value.value)
	}

	public func height(_ value: String) -> SVGElement {
		addingAttribute("height", value)
	}

	public func viewBox(_ minX: Int, _ minY: Int, _ width: Int, _ height: Int) -> SVGElement {
		addingAttribute("viewBox", "\(minX) \(minY) \(width) \(height)")
	}

	public func viewBox(_ minX: Double, _ minY: Double, _ width: Double, _ height: Double) -> SVGElement {
		addingAttribute("viewBox", "\(minX) \(minY) \(width) \(height)")
	}

	public func xmlns(_ value: String) -> SVGElement {
		addingAttribute("xmlns", value)
	}

	public func fill(_ value: SVGPaint) -> SVGElement {
		addingAttribute("fill", value.value)
	}

	public func fill(_ value: String) -> SVGElement {
		addingAttribute("fill", value)
	}

	public func stroke(_ value: SVGPaint) -> SVGElement {
		addingAttribute("stroke", value.value)
	}

	public func stroke(_ value: String) -> SVGElement {
		addingAttribute("stroke", value)
	}

	public func d(_ commands: SVGPath.Definition.Command...) -> SVGElement {
		let pathString = commands.map { $0.pathString }.joined(separator: " ")
		return addingAttribute("d", pathString)
	}

	public func cx(_ value: Length) -> SVGElement {
		addingAttribute("cx", value.value)
	}

	public func cx(_ value: String) -> SVGElement {
		addingAttribute("cx", value)
	}

	public func cy(_ value: Length) -> SVGElement {
		addingAttribute("cy", value.value)
	}

	public func cy(_ value: String) -> SVGElement {
		addingAttribute("cy", value)
	}

	public func r(_ value: Length) -> SVGElement {
		addingAttribute("r", value.value)
	}

	public func r(_ value: String) -> SVGElement {
		addingAttribute("r", value)
	}

	public func rx(_ value: Length) -> SVGElement {
		addingAttribute("rx", value.value)
	}

	public func rx(_ value: String) -> SVGElement {
		addingAttribute("rx", value)
	}

	public func ry(_ value: Length) -> SVGElement {
		addingAttribute("ry", value.value)
	}

	public func ry(_ value: String) -> SVGElement {
		addingAttribute("ry", value)
	}

	public func offset(_ value: String) -> SVGElement {
		addingAttribute("offset", value)
	}

	public func x1(_ value: Length) -> SVGElement {
		addingAttribute("x1", value.value)
	}

	public func x1(_ value: String) -> SVGElement {
		addingAttribute("x1", value)
	}

	public func y1(_ value: Length) -> SVGElement {
		addingAttribute("y1", value.value)
	}

	public func y1(_ value: String) -> SVGElement {
		addingAttribute("y1", value)
	}

	public func x2(_ value: Length) -> SVGElement {
		addingAttribute("x2", value.value)
	}

	public func x2(_ value: String) -> SVGElement {
		addingAttribute("x2", value)
	}

	public func y2(_ value: Length) -> SVGElement {
		addingAttribute("y2", value.value)
	}

	public func y2(_ value: String) -> SVGElement {
		addingAttribute("y2", value)
	}

	public func x(_ value: Length) -> SVGElement {
		addingAttribute("x", value.value)
	}

	public func x(_ value: String) -> SVGElement {
		addingAttribute("x", value)
	}

	public func y(_ value: Length) -> SVGElement {
		addingAttribute("y", value.value)
	}

	public func y(_ value: String) -> SVGElement {
		addingAttribute("y", value)
	}

	public func mask(_ value: String) -> SVGElement {
		addingAttribute("mask", value)
	}

	public func id(_ value: String) -> SVGElement {
		addingAttribute("id", value)
	}

	public func `class`(_ value: String) -> SVGElement {
		addingAttribute("class", value)
	}

	// attributes (hyphenated - lowerCamelCase)
	public func strokeWidth(_ value: Length) -> SVGElement {
		addingAttribute("stroke-width", value.value)
	}

	public func strokeWidth(_ value: String) -> SVGElement {
		addingAttribute("stroke-width", value)
	}

	public func strokeLinecap(_ value: SVGStrokeLinecap) -> SVGElement {
		addingAttribute("stroke-linecap", value.rawValue)
	}

	public func strokeLinecap(_ value: String) -> SVGElement {
		addingAttribute("stroke-linecap", value)
	}

	public func strokeLinejoin(_ value: SVGStrokeLinejoin) -> SVGElement {
		addingAttribute("stroke-linejoin", value.rawValue)
	}

	public func strokeLinejoin(_ value: String) -> SVGElement {
		addingAttribute("stroke-linejoin", value)
	}

	public func strokeMiterlimit(_ value: String) -> SVGElement {
		addingAttribute("stroke-miterlimit", value)
	}

	public func strokeDasharray(_ value: String) -> SVGElement {
		addingAttribute("stroke-dasharray", value)
	}

	public func strokeDashoffset(_ value: String) -> SVGElement {
		addingAttribute("stroke-dashoffset", value)
	}

	public func strokeOpacity(_ value: String) -> SVGElement {
		addingAttribute("stroke-opacity", value)
	}

	public func fillOpacity(_ value: String) -> SVGElement {
		addingAttribute("fill-opacity", value)
	}

	public func fillRule(_ value: SVGFillRule) -> SVGElement {
		addingAttribute("fill-rule", value.rawValue)
	}

	public func fillRule(_ value: String) -> SVGElement {
		addingAttribute("fill-rule", value)
	}

	public func clipPath(_ value: String) -> SVGElement {
		addingAttribute("clip-path", value)
	}

	public func clipRule(_ value: String) -> SVGElement {
		addingAttribute("clip-rule", value)
	}

	public func xmlSpace(_ value: String) -> SVGElement {
		addingAttribute("xml:space", value)
	}

	public func xmlnsXlink(_ value: String) -> SVGElement {
		addingAttribute("xmlns:xlink", value)
	}

	public func transform(_ value: String) -> SVGElement {
		addingAttribute("transform", value)
	}

	public func xlinkHref(_ value: String) -> SVGElement {
		addingAttribute("xlink:href", value)
	}

	// ARIA attributes
	public func ariaLabel(_ value: String) -> SVGElement {
		addingAttribute("aria-label", value)
	}

	public func ariaHidden(_ value: Bool) -> SVGElement {
		addingAttribute("aria-hidden", value ? "true" : "false")
	}

	public func ariaDisabled(_ value: Bool) -> SVGElement {
		addingAttribute("aria-disabled", value ? "true" : "false")
	}

	public func ariaExpanded(_ value: String) -> SVGElement {
		addingAttribute("aria-expanded", value)
	}

	public func ariaBusy(_ value: Bool) -> SVGElement {
		addingAttribute("aria-busy", value ? "true" : "false")
	}
}

#endif
