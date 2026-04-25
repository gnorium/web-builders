import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import HTMLBuilder
import WebTypes

#if SERVER
  import Foundation
#endif

public class SVGImageElement: SVGElement, SVGGraphicsElementBuildable, @unchecked Sendable {
  public init() {
    super.init("image")
  }

  public override init(id: Int32) {
    super.init(id: id)
  }
}

extension SVGImageElement {
  public func href(_ value: String) -> Self { addingAttribute("href", value) }
  public func xlinkHref(_ value: String) -> Self { addingAttribute("xlink:href", value) }
  public func xlinkhref(_ value: String) -> Self { addingAttribute("xlink:href", value) }
  public func x(_ value: Length) -> Self { addingAttribute("x", value.value) }
  public func x(_ value: Percentage) -> Self { addingAttribute("x", value.value) }
  public func x(_ value: Int) -> Self { addingAttribute("x", "\(intToString(value))px") }
  public func x(_ value: Double) -> Self { addingAttribute("x", "\(doubleToString(value))px") }
  public func x(_ value: Float) -> Self {
    addingAttribute("x", "\(doubleToString(Double(value)))px")
  }

  public func y(_ value: Length) -> Self { addingAttribute("y", value.value) }
  public func y(_ value: Percentage) -> Self { addingAttribute("y", value.value) }
  public func y(_ value: Int) -> Self { addingAttribute("y", "\(intToString(value))px") }
  public func y(_ value: Double) -> Self { addingAttribute("y", "\(doubleToString(value))px") }
  public func y(_ value: Float) -> Self {
    addingAttribute("y", "\(doubleToString(Double(value)))px")
  }

  public func width(_ value: Length) -> Self { addingAttribute("width", value.value) }
  public func width(_ value: Percentage) -> Self { addingAttribute("width", value.value) }
  public func width(_ value: Int) -> Self { addingAttribute("width", "\(intToString(value))px") }
  public func width(_ value: Double) -> Self {
    addingAttribute("width", "\(doubleToString(value))px")
  }
  public func width(_ value: Float) -> Self {
    addingAttribute("width", "\(doubleToString(Double(value)))px")
  }

  public func height(_ value: Length) -> Self { addingAttribute("height", value.value) }
  public func height(_ value: Percentage) -> Self { addingAttribute("height", value.value) }
  public func height(_ value: Int) -> Self { addingAttribute("height", "\(intToString(value))px") }
  public func height(_ value: Double) -> Self {
    addingAttribute("height", "\(doubleToString(value))px")
  }
  public func height(_ value: Float) -> Self {
    addingAttribute("height", "\(doubleToString(Double(value)))px")
  }
  public func preserveAspectRatio(_ value: String) -> Self {
    addingAttribute("preserveAspectRatio", value)
  }
}

public func image() -> SVGImageElement { SVGImageElement() }
