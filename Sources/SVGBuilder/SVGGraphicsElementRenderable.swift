import HTMLBuilder
import WebTypes
import DOMBuilder
import EmbeddedSwiftUtilities

/// Protocol for SVG elements that can render graphics directly.
/// Corresponds to the W3C SVGGraphicsElement interface.
/// https://www.w3.org/TR/SVG2/types.html#InterfaceSVGGraphicsElement
public protocol SVGGraphicsElementRenderable: SVGElementRenderable {}

/// Default implementations for SVGGraphicsElementRenderable attributes
extension SVGGraphicsElementRenderable {
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
	
	@_disfavoredOverload
	public func opacity(_ value: Double) -> Self {
		addingAttribute("opacity", doubleToString(value))
	}
	
	public func visibility(_ value: CSSVisibility) -> Self {
		addingAttribute("visibility", value.rawValue)
	}
	
	@_disfavoredOverload
	public func display(_ value: String) -> Self {
		addingAttribute("display", value)
	}
	
	// MARK: - Cursor
	
	@_disfavoredOverload
	public func cursor(_ value: CSSCursor) -> Self {
		addingAttribute("cursor", value.value)
	}
	
	// MARK: - Pointer Events
	
	public func pointerEvents(_ value: String) -> Self {
		addingAttribute("pointer-events", value)
	}
	
	// MARK: - Fill (Presentation Attributes)
	
	@_disfavoredOverload
	public func fill(_ value: SVGPaint) -> Self {
		addingAttribute("fill", value.value)
	}
	
	@_disfavoredOverload
	public func fill(_ value: String) -> Self {
		addingAttribute("fill", value)
	}
	
	public func fillOpacity(_ value: Double) -> Self {
		addingAttribute("fill-opacity", doubleToString(value))
	}
	
	public func fillRule(_ value: SVGFillRule) -> Self {
		addingAttribute("fill-rule", value.rawValue)
	}
	
	// MARK: - Stroke (Presentation Attributes)
	
	@_disfavoredOverload
	public func stroke(_ value: SVGPaint) -> Self {
		addingAttribute("stroke", value.value)
	}
	
	@_disfavoredOverload
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
		addingAttribute("stroke-opacity", doubleToString(value))
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
		addingAttribute("stroke-miterlimit", doubleToString(value))
	}
}
