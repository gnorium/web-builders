import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import HTMLBuilder
import WebTypes

extension SVG {
  public class SVGRadialGradientElement: SVGElement, @unchecked Sendable {
    public init(@SVGBuilder content: () -> [DOM.Node] = { [] }) {
      super.init("radialGradient", children: content())
    }
    public override init(id: Int32) { super.init(id: id) }
  }
}

extension SVG.SVGRadialGradientElement {
  public func href(_ value: String) -> Self { addingAttribute("href", value) }
  public func xlinkHref(_ value: String) -> Self { addingAttribute("xlink:href", value) }
  public func gradientUnits(_ value: SVG.UnitTypes) -> Self { addingAttribute("gradientUnits", value.rawValue) }
  public func gradientTransform(_ value: String) -> Self { addingAttribute("gradientTransform", value) }
  public func gradientTransform(_ value: SVG.Transform) -> Self { addingAttribute("gradientTransform", value.value) }
  public func cx(_ value: CSS.Length) -> Self { addingAttribute("cx", value.value) }
  public func cy(_ value: CSS.Length) -> Self { addingAttribute("cy", value.value) }
  public func r(_ value: CSS.Length) -> Self { addingAttribute("r", value.value) }
  public func fx(_ value: CSS.Length) -> Self { addingAttribute("fx", value.value) }
  public func fy(_ value: CSS.Length) -> Self { addingAttribute("fy", value.value) }
  public func spreadMethod(_ value: String) -> Self { addingAttribute("spreadMethod", value) }
}

public func radialGradient(@SVGBuilder content: () -> [DOM.Node] = { [] }) -> SVG.SVGRadialGradientElement {
  SVG.SVGRadialGradientElement(content: content)
}
