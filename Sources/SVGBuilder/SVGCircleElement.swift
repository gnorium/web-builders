import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import HTMLBuilder
import WebTypes

public class SVGCircleElement: SVGElement, SVGGraphicsElementBuildable, @unchecked Sendable {
  public init() {
    super.init("circle", selfClosing: true)
  }

  public override init(id: Int32) {
    super.init(id: id)
  }
}

extension SVGCircleElement {
  @_disfavoredOverload
  public func cx(_ value: Length) -> Self { addingAttribute("cx", value.value) }
  @_disfavoredOverload
  public func cx(_ value: Percentage) -> Self { addingAttribute("cx", value.value) }
  @_disfavoredOverload
  public func cx(_ value: Int) -> Self { addingAttribute("cx", "\(intToString(value))px") }
  @_disfavoredOverload
  public func cx(_ value: Double) -> Self { addingAttribute("cx", "\(doubleToString(value))px") }
  @_disfavoredOverload
  public func cx(_ value: Float) -> Self {
    addingAttribute("cx", "\(doubleToString(Double(value)))px")
  }

  @_disfavoredOverload
  public func cy(_ value: Length) -> Self { addingAttribute("cy", value.value) }
  @_disfavoredOverload
  public func cy(_ value: Percentage) -> Self { addingAttribute("cy", value.value) }
  @_disfavoredOverload
  public func cy(_ value: Int) -> Self { addingAttribute("cy", "\(intToString(value))px") }
  @_disfavoredOverload
  public func cy(_ value: Double) -> Self { addingAttribute("cy", "\(doubleToString(value))px") }
  @_disfavoredOverload
  public func cy(_ value: Float) -> Self {
    addingAttribute("cy", "\(doubleToString(Double(value)))px")
  }

  @_disfavoredOverload
  public func r(_ value: Length) -> Self { addingAttribute("r", value.value) }
  @_disfavoredOverload
  public func r(_ value: Percentage) -> Self { addingAttribute("r", value.value) }
  @_disfavoredOverload
  public func r(_ value: Int) -> Self { addingAttribute("r", "\(intToString(value))px") }
  @_disfavoredOverload
  public func r(_ value: Double) -> Self { addingAttribute("r", "\(doubleToString(value))px") }
  @_disfavoredOverload
  public func r(_ value: Float) -> Self {
    addingAttribute("r", "\(doubleToString(Double(value)))px")
  }
}

public func circle() -> SVGCircleElement { SVGCircleElement() }
