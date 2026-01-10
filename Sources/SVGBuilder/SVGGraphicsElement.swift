#if !os(WASI)

import WebTypes

/// Protocol for SVG elements that can render graphics directly.
/// Corresponds to the W3C SVGGraphicsElement interface.
/// https://www.w3.org/TR/SVG2/types.html#InterfaceSVGGraphicsElement
public protocol SVGGraphicsElement: SVGElement {}

/// Default implementations for SVGGraphicsElement attributes
extension SVGGraphicsElement {
	// MARK: - Transform
	
	public func transform(_ value: String) -> Self {
		addingAttribute("transform", value)
	}
	
	public func transform(_ value: SVGTransform) -> Self {
		addingAttribute("transform", value.value)
	}
	
	public func transform(_ value: CSSTransformFunction) -> Self {
		addingAttribute("transform", value.value)
	}
	
	// MARK: - Clipping & Masking
	
	public func clipPath(_ value: String) -> Self {
		addingAttribute("clip-path", value)
	}
	
	public func mask(_ value: String) -> Self {
		addingAttribute("mask", value)
	}
	
	public func filter(_ value: String) -> Self {
		addingAttribute("filter", value)
	}
	
	public func clipRule(_ value: SVGFillRule) -> Self {
		addingAttribute("clip-rule", value.rawValue)
	}
	
	// MARK: - Visibility & Opacity
	
	public func opacity(_ value: Double) -> Self {
		addingAttribute("opacity", "\(value)")
	}
	
	public func visibility(_ value: CSSVisibility) -> Self {
		addingAttribute("visibility", value.rawValue)
	}
	
	public func display(_ value: String) -> Self {
		addingAttribute("display", value)
	}
	
	// MARK: - Cursor
	
	public func cursor(_ value: CSSCursor) -> Self {
		addingAttribute("cursor", value.value)
	}
	
	// MARK: - Pointer Events
	
	public func pointerEvents(_ value: String) -> Self {
		addingAttribute("pointer-events", value)
	}
	
	// MARK: - Fill (Presentation Attributes)
	
	public func fill(_ value: SVGPaint) -> Self {
		addingAttribute("fill", value.value)
	}
	
	public func fill(_ value: String) -> Self {
		addingAttribute("fill", value)
	}
	
	public func fillOpacity(_ value: Double) -> Self {
		addingAttribute("fill-opacity", "\(value)")
	}
	
	public func fillRule(_ value: SVGFillRule) -> Self {
		addingAttribute("fill-rule", value.rawValue)
	}
	
	// MARK: - Stroke (Presentation Attributes)
	
	public func stroke(_ value: SVGPaint) -> Self {
		addingAttribute("stroke", value.value)
	}
	
	public func stroke(_ value: String) -> Self {
		addingAttribute("stroke", value)
	}
	
	public func strokeWidth(_ value: Length) -> Self {
		addingAttribute("stroke-width", value.value)
	}
	
	public func strokeWidth(_ value: String) -> Self {
		addingAttribute("stroke-width", value)
	}
	
	public func strokeOpacity(_ value: Double) -> Self {
		addingAttribute("stroke-opacity", "\(value)")
	}
	
	public func strokeLinecap(_ value: SVGStrokeLinecap) -> Self {
		addingAttribute("stroke-linecap", value.rawValue)
	}
	
	public func strokeLinejoin(_ value: SVGStrokeLinejoin) -> Self {
		addingAttribute("stroke-linejoin", value.rawValue)
	}
	
	public func strokeDasharray(_ value: String) -> Self {
		addingAttribute("stroke-dasharray", value)
	}
	
	public func strokeDashoffset(_ value: Length) -> Self {
		addingAttribute("stroke-dashoffset", value.value)
	}
	
	public func strokeMiterlimit(_ value: Double) -> Self {
		addingAttribute("stroke-miterlimit", "\(value)")
	}
}

#endif
