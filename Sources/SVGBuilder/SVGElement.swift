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

	public func style(prefix: Bool = true, @CSSBuilder _ content: () -> [any CSS]) -> SVGElement {
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

	public func offset(_ value: Double) -> SVGElement {
		addingAttribute("offset", String(value))
	}

	public func offset(_ value: Int) -> SVGElement {
		addingAttribute("offset", String(value))
	}

	public func offset(_ value: Percentage) -> SVGElement {
		addingAttribute("offset", value.value)
	}

	public func stopColor(_ value: CSSColor) -> SVGElement {
		addingAttribute("stop-color", value.value)
	}

	public func stopColor(_ value: String) -> SVGElement {
		addingAttribute("stop-color", value)
	}

	public func stopColor(_ value: Int) -> SVGElement {
		addingAttribute("stop-color", hex(value).value)
	}

	public func stopOpacity(_ value: Double) -> SVGElement {
		addingAttribute("stop-opacity", String(value))
	}

	public func stopOpacity(_ value: Int) -> SVGElement {
		addingAttribute("stop-opacity", String(value))
	}

	public func gradientUnits(_ value: String) -> SVGElement {
		addingAttribute("gradientUnits", value)
	}

	public func gradientUnits(_ value: SVGGradientUnits) -> SVGElement {
		addingAttribute("gradientUnits", value.rawValue)
	}

	public func gradientTransform(_ value: String) -> SVGElement {
		addingAttribute("gradientTransform", value)
	}

	public func gradientTransform(_ value: SVGTransform) -> SVGElement {
		addingAttribute("gradientTransform", value.value)
	}

	public func content(@SVGBuilder _ builder: () -> [any SVG]) -> SVGElement {
		SVGElement(self.name, content: self.content + builder(), attributes: self.attributes, selfClosing: self.selfClosing)
	}

	public func x1(_ value: Length) -> SVGElement {
		addingAttribute("x1", value.value)
	}

	public func x1(_ value: String) -> SVGElement {
		addingAttribute("x1", value)
	}

	public func x1(_ value: Percentage) -> SVGElement {
		addingAttribute("x1", value.value)
	}

	public func y1(_ value: Length) -> SVGElement {
		addingAttribute("y1", value.value)
	}

	public func y1(_ value: String) -> SVGElement {
		addingAttribute("y1", value)
	}

	public func y1(_ value: Percentage) -> SVGElement {
		addingAttribute("y1", value.value)
	}

	public func x2(_ value: Length) -> SVGElement {
		addingAttribute("x2", value.value)
	}

	public func x2(_ value: String) -> SVGElement {
		addingAttribute("x2", value)
	}

	public func x2(_ value: Percentage) -> SVGElement {
		addingAttribute("x2", value.value)
	}

	public func y2(_ value: Length) -> SVGElement {
		addingAttribute("y2", value.value)
	}

	public func y2(_ value: String) -> SVGElement {
		addingAttribute("y2", value)
	}

	public func y2(_ value: Percentage) -> SVGElement {
		addingAttribute("y2", value.value)
	}

	public func x(_ value: Length) -> SVGElement {
		addingAttribute("x", value.value)
	}

	public func x(_ value: String) -> SVGElement {
		addingAttribute("x", value)
	}

	public func x(_ value: Percentage) -> SVGElement {
		addingAttribute("x", value.value)
	}

	public func y(_ value: Length) -> SVGElement {
		addingAttribute("y", value.value)
	}

	public func y(_ value: String) -> SVGElement {
		addingAttribute("y", value)
	}

	public func y(_ value: Percentage) -> SVGElement {
		addingAttribute("y", value.value)
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
	
	public func strokeMiterlimit(_ value: Int) -> SVGElement {
		addingAttribute("stroke-miterlimit", String(value))
	}

    public func strokeMiterlimit(_ value: Double) -> SVGElement {
		addingAttribute("stroke-miterlimit", String(value))
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

	public func fillOpacity(_ value: Double) -> SVGElement {
		addingAttribute("fill-opacity", String(value))
	}

	public func fillOpacity(_ value: Int) -> SVGElement {
		addingAttribute("fill-opacity", String(value))
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

	public func clipRule(_ value: SVGFillRule) -> SVGElement {
		addingAttribute("clip-rule", value.rawValue)
	}

	// Points attribute for polygon/polyline
	public func points(_ value: String) -> SVGElement {
		addingAttribute("points", value)
	}

	/// Points attribute with variadic tuple arguments for polygon/polyline
	/// Example: .points((0, 0), (100, 50), (50, 100))
	public func points(_ values: (Int, Int)...) -> SVGElement {
		let pointString = values.map { "\($0.0),\($0.1)" }.joined(separator: " ")
		return addingAttribute("points", pointString)
	}

	/// Points attribute with variadic tuple arguments (Double) for polygon/polyline
	public func points(_ values: (Double, Double)...) -> SVGElement {
		let pointString = values.map { "\($0.0),\($0.1)" }.joined(separator: " ")
		return addingAttribute("points", pointString)
	}

	public func xmlSpace(_ value: String) -> SVGElement {
		addingAttribute("xml:space", value)
	}

	public func xmlSpace(_ value: SVGXMLSpace) -> SVGElement {
		addingAttribute("xml:space", value.rawValue)
	}

	public func xmlnsXlink(_ value: String) -> SVGElement {
		addingAttribute("xmlns:xlink", value)
	}

	public func transform(_ value: String) -> SVGElement {
		addingAttribute("transform", value)
	}

	public func transform(_ value: SVGTransform) -> SVGElement {
		addingAttribute("transform", value.value)
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

	// MARK: - Animation Attributes

	public func attributeName(_ value: SVGAttributeName) -> SVGElement {
		addingAttribute("attributeName", value.rawValue)
	}

	@available(*, deprecated)
	public func attributeName(_ value: String) -> SVGElement {
		addingAttribute("attributeName", value)
	}

	public func dur(_ value: CSSTime) -> SVGElement {
		addingAttribute("dur", value.value)
	}

	public func repeatCount(_ value: SVGAnimateRepeatCount) -> SVGElement {
		addingAttribute("repeatCount", value.value)
	}

	public func begin(_ value: SVGAnimateBegin) -> SVGElement {
		addingAttribute("begin", value.rawValue)
	}

	public func calcMode(_ value: SVGAnimateCalcMode) -> SVGElement {
		addingAttribute("calcMode", value.rawValue)
	}

	public func keyTimes(_ values: Double...) -> SVGElement {
		let str = values.map { String($0) }.joined(separator: "; ")
		return addingAttribute("keyTimes", str)
	}

	public func keySplines(
		_ s1: (Double, Double, Double, Double),
		_ s2: (Double, Double, Double, Double)
	) -> SVGElement {
		let str = [s1, s2].map { "\($0.0) \($0.1) \($0.2) \($0.3)" }.joined(separator: "; ")
		return addingAttribute("keySplines", str)
	}

	public func keySplines(
		_ s1: (Double, Double, Double, Double),
		_ s2: (Double, Double, Double, Double),
		_ s3: (Double, Double, Double, Double)
	) -> SVGElement {
		let str = [s1, s2, s3].map { "\($0.0) \($0.1) \($0.2) \($0.3)" }.joined(separator: "; ")
		return addingAttribute("keySplines", str)
	}

	public func keySplines(
		_ s1: (Double, Double, Double, Double),
		_ s2: (Double, Double, Double, Double),
		_ s3: (Double, Double, Double, Double),
		_ s4: (Double, Double, Double, Double)
	) -> SVGElement {
		let str = [s1, s2, s3, s4].map { "\($0.0) \($0.1) \($0.2) \($0.3)" }.joined(separator: "; ")
		return addingAttribute("keySplines", str)
	}

	public func keySplines(
		_ s1: (Double, Double, Double, Double),
		_ s2: (Double, Double, Double, Double),
		_ s3: (Double, Double, Double, Double),
		_ s4: (Double, Double, Double, Double),
		_ s5: (Double, Double, Double, Double)
	) -> SVGElement {
		let str = [s1, s2, s3, s4, s5].map { "\($0.0) \($0.1) \($0.2) \($0.3)" }.joined(separator: "; ")
		return addingAttribute("keySplines", str)
	}

	public func from(_ value: Double) -> SVGElement {
		addingAttribute("from", String(value))
	}

	public func from(_ value: Int) -> SVGElement {
		addingAttribute("from", String(value))
	}

	public func from(_ value: String) -> SVGElement {
		addingAttribute("from", value)
	}

	public func to(_ value: Double) -> SVGElement {
		addingAttribute("to", String(value))
	}

	public func to(_ value: Int) -> SVGElement {
		addingAttribute("to", String(value))
	}

	public func to(_ value: String) -> SVGElement {
		addingAttribute("to", value)
	}

	/// Rotation from value: (angle, centerX, centerY)
	public func from(_ angle: Int, _ cx: Int, _ cy: Int) -> SVGElement {
		addingAttribute("from", "\(angle) \(cx) \(cy)")
	}

	/// Rotation to value: (angle, centerX, centerY)
	public func to(_ angle: Int, _ cx: Int, _ cy: Int) -> SVGElement {
		addingAttribute("to", "\(angle) \(cx) \(cy)")
	}

	/// Animation type (e.g., .rotate for animateTransform)
	public func type(_ value: SVGAnimateTransform.`Type`) -> SVGElement {
		addingAttribute("type", value.rawValue)
	}

	@available(*, deprecated)
	public func type(_ value: String) -> SVGElement {
		addingAttribute("type", value)
	}

	/// Animation attribute type (XML, CSS, auto)
	public func attributeType(_ value: String) -> SVGElement {
		addingAttribute("attributeType", value)
	}

	/// Animation fill behavior (freeze/remove)
	public func fill(_ value: SVGAnimateFill) -> SVGElement {
		addingAttribute("fill", value.rawValue)
	}

	/// values attribute for animate using strings
	public func values(_ items: String...) -> SVGElement {
		addingAttribute("values", items.joined(separator: "; "))
	}

	/// values attribute for animate using lengths
	public func values(_ items: Length...) -> SVGElement {
		addingAttribute("values", items.map { $0.value }.joined(separator: "; "))
	}

	/// values attribute for animate using percentages
	public func values(_ items: Percentage...) -> SVGElement {
		addingAttribute("values", items.map { $0.value }.joined(separator: "; "))
	}

	/// values attribute for animate using path commands
	public func values(_ paths: [SVGPath.Definition.Command]...) -> SVGElement {
		let pathStrings = paths.map { commands in
			commands.map { $0.pathString }.joined(separator: " ")
		}
		return addingAttribute("values", pathStrings.joined(separator: "; "))
	}

	/// values attribute for animate using raw string (fallback)
	public func values(_ value: String) -> SVGElement {
		addingAttribute("values", value)
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

// Animation Elements
public func animate() -> SVGElement { SVGElement("animate", selfClosing: true) }
public func animateTransform() -> SVGElement { SVGElement("animateTransform", selfClosing: true) }
public func set_SVG() -> SVGElement { SVGElement("set", selfClosing: true) }
public func animateMotion(@SVGBuilder _ content: () -> [any SVG] = { [] }) -> SVGElement { SVGElement("animateMotion", content: content()) }
public func mpath() -> SVGElement { SVGElement("mpath", selfClosing: true) }

#endif
