import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import HTMLBuilder
import WebTypes

extension SVG {
  public class SVGCircleElement: SVGElement, SVGGraphicsElementBuildable, @unchecked Sendable {
    public init() { super.init("circle", selfClosing: true) }
    public override init(id: Int32) { super.init(id: id) }
  }
}

extension SVG.SVGCircleElement {
  public func cx(_ value: Int) -> Self { addingAttribute("cx", intToString(value)) }
  public func cx(_ value: Double) -> Self { addingAttribute("cx", doubleToString(value)) }
  public func cx(_ value: CSS.Length) -> Self { addingAttribute("cx", value.value) }
  public func cx(_ value: CSS.Percentage) -> Self { addingAttribute("cx", value.value) }
  public func cy(_ value: Int) -> Self { addingAttribute("cy", intToString(value)) }
  public func cy(_ value: Double) -> Self { addingAttribute("cy", doubleToString(value)) }
  public func cy(_ value: CSS.Length) -> Self { addingAttribute("cy", value.value) }
  public func cy(_ value: CSS.Percentage) -> Self { addingAttribute("cy", value.value) }
  public func r(_ value: Int) -> Self { addingAttribute("r", intToString(value)) }
  public func r(_ value: Double) -> Self { addingAttribute("r", doubleToString(value)) }
  public func r(_ value: CSS.Length) -> Self { addingAttribute("r", value.value) }
  public func r(_ value: CSS.Percentage) -> Self { addingAttribute("r", value.value) }
}

public func circle() -> SVG.SVGCircleElement { SVG.SVGCircleElement() }
