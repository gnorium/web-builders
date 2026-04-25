import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import HTMLBuilder
import WebTypes

public class SVGMaskElement: SVGElement, @unchecked Sendable {
  public init(@SVGBuilder content: () -> [Node] = { [] }) {
    super.init("mask", children: content())
  }

  public override init(id: Int32) {
    super.init(id: id)
  }
}

extension SVGMaskElement {
  public func maskUnits(_ value: SVGUnitTypes) -> Self {
    addingAttribute("maskUnits", value.rawValue)
  }
  public func maskContentUnits(_ value: SVGUnitTypes) -> Self {
    addingAttribute("maskContentUnits", value.rawValue)
  }
  public func x(_ value: Length) -> Self { addingAttribute("x", value.value) }
  public func x(_ value: Percentage) -> Self { addingAttribute("x", value.value) }
  public func x(_ value: Int) -> Self { addingAttribute("x", "\(value)px") }
  public func x(_ value: Double) -> Self { addingAttribute("x", "\(value)px") }
  public func x(_ value: Float) -> Self { addingAttribute("x", "\(value)px") }

  public func y(_ value: Length) -> Self { addingAttribute("y", value.value) }
  public func y(_ value: Percentage) -> Self { addingAttribute("y", value.value) }
  public func y(_ value: Int) -> Self { addingAttribute("y", "\(value)px") }
  public func y(_ value: Double) -> Self { addingAttribute("y", "\(value)px") }
  public func y(_ value: Float) -> Self { addingAttribute("y", "\(value)px") }

  public func width(_ value: Length) -> Self { addingAttribute("width", value.value) }
  public func width(_ value: Percentage) -> Self { addingAttribute("width", value.value) }
  public func width(_ value: Int) -> Self { addingAttribute("width", "\(value)px") }
  public func width(_ value: Double) -> Self { addingAttribute("width", "\(value)px") }
  public func width(_ value: Float) -> Self { addingAttribute("width", "\(value)px") }

  public func height(_ value: Length) -> Self { addingAttribute("height", value.value) }
  public func height(_ value: Percentage) -> Self { addingAttribute("height", value.value) }
  public func height(_ value: Int) -> Self { addingAttribute("height", "\(value)px") }
  public func height(_ value: Double) -> Self { addingAttribute("height", "\(value)px") }
  public func height(_ value: Float) -> Self { addingAttribute("height", "\(value)px") }
}

public func mask(@SVGBuilder content: () -> [Node] = { [] }) -> SVGMaskElement {
  SVGMaskElement(content: content)
}
