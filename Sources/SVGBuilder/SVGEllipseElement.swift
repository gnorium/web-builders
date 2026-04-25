import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import HTMLBuilder
import WebTypes

public class SVGEllipseElement: SVGElement, SVGGraphicsElementBuildable, @unchecked Sendable {
  public init() {
    super.init("ellipse")
  }

  public override init(id: Int32) {
    super.init(id: id)
  }
}

extension SVGEllipseElement {
  public func cx(_ value: Length) -> Self { addingAttribute("cx", value.value) }
  public func cx(_ value: Percentage) -> Self { addingAttribute("cx", value.value) }
  public func cx(_ value: Int) -> Self { addingAttribute("cx", "\(intToString(value))px") }
  public func cx(_ value: Double) -> Self { addingAttribute("cx", "\(doubleToString(value))px") }
  public func cx(_ value: Float) -> Self {
    addingAttribute("cx", "\(doubleToString(Double(value)))px")
  }

  public func cy(_ value: Length) -> Self { addingAttribute("cy", value.value) }
  public func cy(_ value: Percentage) -> Self { addingAttribute("cy", value.value) }
  public func cy(_ value: Int) -> Self { addingAttribute("cy", "\(intToString(value))px") }
  public func cy(_ value: Double) -> Self { addingAttribute("cy", "\(doubleToString(value))px") }
  public func cy(_ value: Float) -> Self {
    addingAttribute("cy", "\(doubleToString(Double(value)))px")
  }

  public func rx(_ value: Length) -> Self { addingAttribute("rx", value.value) }
  public func rx(_ value: Percentage) -> Self { addingAttribute("rx", value.value) }
  public func rx(_ value: Int) -> Self { addingAttribute("rx", "\(intToString(value))px") }
  public func rx(_ value: Double) -> Self { addingAttribute("rx", "\(doubleToString(value))px") }
  public func rx(_ value: Float) -> Self {
    addingAttribute("rx", "\(doubleToString(Double(value)))px")
  }

  public func ry(_ value: Length) -> Self { addingAttribute("ry", value.value) }
  public func ry(_ value: Percentage) -> Self { addingAttribute("ry", value.value) }
  public func ry(_ value: Int) -> Self { addingAttribute("ry", "\(intToString(value))px") }
  public func ry(_ value: Double) -> Self { addingAttribute("ry", "\(doubleToString(value))px") }
  public func ry(_ value: Float) -> Self {
    addingAttribute("ry", "\(doubleToString(Double(value)))px")
  }
}

public func ellipse() -> SVGEllipseElement { SVGEllipseElement() }
