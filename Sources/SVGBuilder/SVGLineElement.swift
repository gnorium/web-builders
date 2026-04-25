import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import HTMLBuilder
import WebTypes

public class SVGLineElement: SVGElement, SVGGraphicsElementBuildable, @unchecked Sendable {
  public init() {
    super.init("line")
  }

  public override init(id: Int32) {
    super.init(id: id)
  }

}

extension SVGLineElement {
  public func x1(_ value: Length) -> Self { addingAttribute("x1", value.value) }
  public func x1(_ value: Percentage) -> Self { addingAttribute("x1", value.value) }
  public func x1(_ value: Int) -> Self { addingAttribute("x1", "\(intToString(value))px") }
  public func x1(_ value: Double) -> Self { addingAttribute("x1", "\(doubleToString(value))px") }
  public func x1(_ value: Float) -> Self {
    addingAttribute("x1", "\(doubleToString(Double(value)))px")
  }

  public func y1(_ value: Length) -> Self { addingAttribute("y1", value.value) }
  public func y1(_ value: Percentage) -> Self { addingAttribute("y1", value.value) }
  public func y1(_ value: Int) -> Self { addingAttribute("y1", "\(intToString(value))px") }
  public func y1(_ value: Double) -> Self { addingAttribute("y1", "\(doubleToString(value))px") }
  public func y1(_ value: Float) -> Self {
    addingAttribute("y1", "\(doubleToString(Double(value)))px")
  }

  public func x2(_ value: Length) -> Self { addingAttribute("x2", value.value) }
  public func x2(_ value: Percentage) -> Self { addingAttribute("x2", value.value) }
  public func x2(_ value: Int) -> Self { addingAttribute("x2", "\(intToString(value))px") }
  public func x2(_ value: Double) -> Self { addingAttribute("x2", "\(doubleToString(value))px") }
  public func x2(_ value: Float) -> Self {
    addingAttribute("x2", "\(doubleToString(Double(value)))px")
  }

  public func y2(_ value: Length) -> Self { addingAttribute("y2", value.value) }
  public func y2(_ value: Percentage) -> Self { addingAttribute("y2", value.value) }
  public func y2(_ value: Int) -> Self { addingAttribute("y2", "\(intToString(value))px") }
  public func y2(_ value: Double) -> Self { addingAttribute("y2", "\(doubleToString(value))px") }
  public func y2(_ value: Float) -> Self {
    addingAttribute("y2", "\(doubleToString(Double(value)))px")
  }
}

public func line() -> SVGLineElement { SVGLineElement() }
