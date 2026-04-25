import CSSBuilder
import CSSOMBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import HTMLBuilder
import WebTypes

public class SVGRectElement: SVGElement, SVGGraphicsElementBuildable, @unchecked Sendable {
  public init(@SVGBuilder content: () -> [Node] = { [] }) {
    super.init("rect", children: content())
  }

  public override init(id: Int32) {
    super.init(id: id)
  }
}

extension SVGRectElement {
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

public func rect(@SVGBuilder content: () -> [Node] = { [] }) -> SVGRectElement {
  SVGRectElement(content: content)
}
