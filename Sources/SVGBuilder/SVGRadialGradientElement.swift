import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import HTMLBuilder
import WebTypes

public class SVGRadialGradientElement: SVGElement, @unchecked Sendable {
  public init(@SVGBuilder content: () -> [Node] = { [] }) {
    super.init("radialGradient", children: content())
  }

  public override init(id: Int32) {
    super.init(id: id)
  }
}

extension SVGRadialGradientElement {
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
  public func cx(_ value: Length) -> Self { addingAttribute("cx", value.value) }
  public func cy(_ value: Length) -> Self { addingAttribute("cy", value.value) }
  public func r(_ value: Length) -> Self { addingAttribute("r", value.value) }
  public func fx(_ value: Length) -> Self { addingAttribute("fx", value.value) }
  public func fy(_ value: Length) -> Self { addingAttribute("fy", value.value) }
  public func spreadMethod(_ value: String) -> Self { addingAttribute("spreadMethod", value) }
}

public func radialGradient(@SVGBuilder content: () -> [Node] = { [] }) -> SVGRadialGradientElement {
  SVGRadialGradientElement(content: content)
}
