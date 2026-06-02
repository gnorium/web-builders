import DOMBuilder
import EmbeddedSwiftUtilities
import HTMLBuilder
import WebTypes

/// Protocol for SVG elements that can render graphics directly.
/// Corresponds to the W3C SVGGraphicsElement interface.
/// https://www.w3.org/TR/SVG2/types.html#InterfaceSVGGraphicsElement
public protocol SVGGraphicsElementBuildable: SVGElementBuildable {}

/// Default implementations for SVGGraphicsElementBuildable attributes
extension SVGGraphicsElementBuildable {
  // MARK: - Transform

  public func transform(_ value: String) -> Self {
    addingAttribute("transform", value)
  }

  public func transform(_ value: SVG.Transform) -> Self {
    addingAttribute("transform", value.value)
  }

  public func transform(_ value: CSS.TransformFunction) -> Self {
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

  public func clipRule(_ value: SVG.FillRule) -> Self {
    addingAttribute("clip-rule", value.rawValue)
  }

  // MARK: - Visibility & Opacity

  @_disfavoredOverload
  public func opacity(_ value: Double) -> Self {
    addingAttribute("opacity", doubleToString(value))
  }

  public func opacity(_ value: CSS.Number) -> Self {
    addingAttribute("opacity", value.value)
  }

  public func visibility(_ value: CSS.Visibility) -> Self {
    addingAttribute("visibility", value.rawValue)
  }

  @_disfavoredOverload
  public func display(_ value: String) -> Self {
    addingAttribute("display", value)
  }

  // MARK: - Cursor

  @_disfavoredOverload
  public func cursor(_ value: CSS.Cursor) -> Self {
    addingAttribute("cursor", value.value)
  }

  // MARK: - Pointer Events

  public func pointerEvents(_ value: String) -> Self {
    addingAttribute("pointer-events", value)
  }

  public func pointerEvents(_ value: CSS.PointerEvents) -> Self {
    addingAttribute("pointer-events", value.rawValue)
  }

  public func pointerEvents(_ value: CSS.Keyword.Auto) -> Self {
    addingAttribute("pointer-events", value.rawValue)
  }

  public func pointerEvents(_ value: CSS.Keyword.All) -> Self {
    addingAttribute("pointer-events", value.rawValue)
  }

  public func pointerEvents(_ value: CSS.Keyword.None) -> Self {
    addingAttribute("pointer-events", value.rawValue)
  }

  // MARK: - Fill (Presentation Attributes)

  public func fill(_ value: any CSSPaintConvertible) -> Self {
    addingAttribute("fill", value.asCSSPaint.value)
  }

  public func fill(_ value: CSS.Color) -> Self {
    addingAttribute("fill", value.asCSSPaint.value)
  }

  @_disfavoredOverload
  public func fill(_ value: String) -> Self {
    addingAttribute("fill", value)
  }

  public func fill(_ value: CSS.Keyword.None) -> Self {
    addingAttribute("fill", value.rawValue)
  }

  public func fillOpacity(_ value: Double) -> Self {
    addingAttribute("fill-opacity", doubleToString(value))
  }

  public func fillRule(_ value: SVG.FillRule) -> Self {
    addingAttribute("fill-rule", value.rawValue)
  }

  // MARK: - Stroke (Presentation Attributes)

  public func stroke(_ value: CSS.Color) -> Self {
    addingAttribute("stroke", value.asCSSPaint.value)
  }

  public func stroke(_ value: any CSSPaintConvertible) -> Self {
    addingAttribute("stroke", value.asCSSPaint.value)
  }

  @_disfavoredOverload
  public func stroke(_ value: String) -> Self {
    addingAttribute("stroke", value)
  }

  public func stroke(_ value: CSS.Keyword.None) -> Self {
    addingAttribute("stroke", value.rawValue)
  }
  
  public func strokeWidth(_ value: CSS.Length) -> Self {
    addingAttribute("stroke-width", value.value)
  }

  public func strokeWidth(_ value: String) -> Self {
    addingAttribute("stroke-width", value)
  }

  public func strokeOpacity(_ value: Double) -> Self {
    addingAttribute("stroke-opacity", doubleToString(value))
  }

  public func strokeLinecap(_ value: SVG.StrokeLinecap) -> Self {
    addingAttribute("stroke-linecap", value.rawValue)
  }

  public func strokeLinejoin(_ value: SVG.StrokeLinejoin) -> Self {
    addingAttribute("stroke-linejoin", value.rawValue)
  }

  public func strokeDashoffset(_ value: CSS.Length) -> Self {
    addingAttribute("stroke-dashoffset", value.value)
  }

  public func strokeMiterlimit(_ value: Double) -> Self {
    addingAttribute("stroke-miterlimit", doubleToString(value))
  }

  public func shapeRendering(_ value: SVG.ShapeRendering) -> Self {
    addingAttribute("shape-rendering", value.rawValue)
  }
}
