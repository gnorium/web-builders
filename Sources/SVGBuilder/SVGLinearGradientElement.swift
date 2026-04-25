import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import HTMLBuilder
import WebTypes

public class SVGLinearGradientElement: SVGElement, @unchecked Sendable {
  public init(@SVGBuilder content: () -> [Node] = { [] }) {
    super.init("linearGradient", children: content())
  }

  public override init(id: Int32) {
    super.init(id: id)
  }
}

extension SVGLinearGradientElement {
  public func href(_ value: String) -> Self { addingAttribute("href", value) }
  public func xlinkHref(_ value: String) -> Self { addingAttribute("xlink:href", value) }
  public func gradientUnits(_ value: SVGUnitTypes) -> Self {
    addingAttribute("gradientUnits", value.rawValue)
  }
  public func gradientTransform(_ value: String) -> Self {
    addingAttribute("gradientTransform", value)
  }
  public func gradientTransform(_ value: SVGTransform) -> Self {
    addingAttribute("gradientTransform", value.value)
  }
  public func x1(_ value: Length) -> Self { addingAttribute("x1", value.value) }
  public func x1(_ value: Percentage) -> Self { addingAttribute("x1", value.value) }
  public func x1(_ value: LengthPercentage) -> Self { addingAttribute("x1", value.value) }

  public func y1(_ value: Length) -> Self { addingAttribute("y1", value.value) }
  public func y1(_ value: Percentage) -> Self { addingAttribute("y1", value.value) }
  public func y1(_ value: LengthPercentage) -> Self { addingAttribute("y1", value.value) }

  public func x2(_ value: Length) -> Self { addingAttribute("x2", value.value) }
  public func x2(_ value: Percentage) -> Self { addingAttribute("x2", value.value) }
  public func x2(_ value: LengthPercentage) -> Self { addingAttribute("x2", value.value) }

  public func y2(_ value: Length) -> Self { addingAttribute("y2", value.value) }
  public func y2(_ value: Percentage) -> Self { addingAttribute("y2", value.value) }
  public func y2(_ value: LengthPercentage) -> Self { addingAttribute("y2", value.value) }
  public func spreadMethod(_ value: String) -> Self { addingAttribute("spreadMethod", value) }
}

public func linearGradient(@SVGBuilder content: () -> [Node] = { [] }) -> SVGLinearGradientElement {
  SVGLinearGradientElement(content: content)
}
