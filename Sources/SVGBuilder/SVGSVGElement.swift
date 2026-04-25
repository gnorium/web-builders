import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import HTMLBuilder
import WebTypes

public class SVGSVGElement: SVGElement, SVGGraphicsElementBuildable, @unchecked Sendable {
  public init(@SVGBuilder content: () -> [Node] = { [] }) {
    super.init("svg", children: content())
  }

  public override init(id: Int32) {
    super.init(id: id)
  }
}

extension SVGSVGElement {
  public func viewBox(_ minX: Double, _ minY: Double, _ width: Double, _ height: Double) -> Self {
    addingAttribute(
      "viewBox",
      "\(doubleToString(minX)) \(doubleToString(minY)) \(doubleToString(width)) \(doubleToString(height))"
    )
  }

  public func viewBox(_ minX: Int, _ minY: Int, _ width: Int, _ height: Int) -> Self {
    addingAttribute(
      "viewBox",
      "\(intToString(minX)) \(intToString(minY)) \(intToString(width)) \(intToString(height))")
  }

  public func viewBox(_ value: String) -> Self {
    addingAttribute("viewBox", value)
  }

  @_disfavoredOverload
  public func width(_ value: Length) -> Self { addingAttribute("width", value.value) }
  @_disfavoredOverload
  public func width(_ value: Percentage) -> Self { addingAttribute("width", value.value) }
  @_disfavoredOverload
  public func width(_ value: Int) -> Self { addingAttribute("width", "\(intToString(value))px") }
  @_disfavoredOverload
  public func width(_ value: Double) -> Self {
    addingAttribute("width", "\(doubleToString(value))px")
  }
  @_disfavoredOverload
  public func width(_ value: Float) -> Self {
    addingAttribute("width", "\(doubleToString(Double(value)))px")
  }

  @_disfavoredOverload
  public func height(_ value: Length) -> Self { addingAttribute("height", value.value) }
  @_disfavoredOverload
  public func height(_ value: Percentage) -> Self { addingAttribute("height", value.value) }
  @_disfavoredOverload
  public func height(_ value: Int) -> Self { addingAttribute("height", "\(intToString(value))px") }
  @_disfavoredOverload
  public func height(_ value: Double) -> Self {
    addingAttribute("height", "\(doubleToString(value))px")
  }
  @_disfavoredOverload
  public func height(_ value: Float) -> Self {
    addingAttribute("height", "\(doubleToString(Double(value)))px")
  }

  public func preserveAspectRatio(_ value: String) -> Self {
    addingAttribute("preserveAspectRatio", value)
  }

  // MARK: - Specialized Attributes
  public func stopColor(_ value: String) -> Self { addingAttribute("stop-color", value) }
  public func gradientUnits(_ value: String) -> Self { addingAttribute("gradientUnits", value) }

  // MARK: - Numeric Overloads
  public func x(_ value: Int) -> Self { addingAttribute("x", intToString(value)) }
  public func x(_ value: Double) -> Self { addingAttribute("x", doubleToString(value)) }
  public func x(_ value: Percentage) -> Self { addingAttribute("x", value.value) }
  public func y(_ value: Int) -> Self { addingAttribute("y", intToString(value)) }
  public func y(_ value: Double) -> Self { addingAttribute("y", doubleToString(value)) }
  public func y(_ value: Percentage) -> Self { addingAttribute("y", value.value) }
  public func cx(_ value: Int) -> Self { addingAttribute("cx", intToString(value)) }
  public func cx(_ value: Double) -> Self { addingAttribute("cx", doubleToString(value)) }
  public func cx(_ value: Percentage) -> Self { addingAttribute("cx", value.value) }
  public func cy(_ value: Int) -> Self { addingAttribute("cy", intToString(value)) }
  public func cy(_ value: Double) -> Self { addingAttribute("cy", doubleToString(value)) }
  public func cy(_ value: Percentage) -> Self { addingAttribute("cy", value.value) }
  public func r(_ value: Int) -> Self { addingAttribute("r", intToString(value)) }
  public func r(_ value: Double) -> Self { addingAttribute("r", doubleToString(value)) }
  public func r(_ value: Percentage) -> Self { addingAttribute("r", value.value) }
  public func rx(_ value: Int) -> Self { addingAttribute("rx", intToString(value)) }
  public func rx(_ value: Double) -> Self { addingAttribute("rx", doubleToString(value)) }
  public func rx(_ value: Percentage) -> Self { addingAttribute("rx", value.value) }
  public func ry(_ value: Int) -> Self { addingAttribute("ry", intToString(value)) }
  public func ry(_ value: Double) -> Self { addingAttribute("ry", doubleToString(value)) }
  public func ry(_ value: Percentage) -> Self { addingAttribute("ry", value.value) }
  public func offset(_ value: String) -> Self { addingAttribute("offset", value) }
  public func offset(_ value: Double) -> Self { addingAttribute("offset", doubleToString(value)) }
  public func offset(_ value: Percentage) -> Self { addingAttribute("offset", value.value) }

  public func gradientTransform(_ value: String) -> Self {
    addingAttribute("gradientTransform", value)
  }
  public func gradientTransform(_ value: SVGTransform) -> Self {
    addingAttribute("gradientTransform", value.value)
  }

  // MARK: - Graphics Attributes
  public func fillRule(_ value: SVGFillRule) -> Self {
    addingAttribute("fill-rule", value.rawValue)
  }
  public func clipRule(_ value: SVGFillRule) -> Self {
    addingAttribute("clip-rule", value.rawValue)
  }
  public func strokeLinecap(_ value: SVGStrokeLinecap) -> Self {
    addingAttribute("stroke-linecap", value.rawValue)
  }
  public func strokeMiterlimit(_ value: Double) -> Self {
    addingAttribute("stroke-miterlimit", doubleToString(value))
  }
}

public func svg(@SVGBuilder _ content: () -> [Node] = { [] }) -> SVGSVGElement {
  SVGSVGElement(content: content)
}
