import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import HTMLBuilder
import WebTypes

extension SVG {
  public class SVGLinearGradientElement: SVGElement, @unchecked Sendable {
    public init(@SVGBuilder content: () -> [DOM.Node] = { [] }) {
      super.init("linearGradient", children: content())
    }
    public override init(id: Int32) { super.init(id: id) }
  }
}

extension SVG.SVGLinearGradientElement {
  public func href(_ value: String) -> Self { addingAttribute("href", value) }
  public func xlinkHref(_ value: String) -> Self { addingAttribute("xlink:href", value) }
  public func gradientUnits(_ value: SVG.UnitTypes) -> Self { addingAttribute("gradientUnits", value.rawValue) }
  public func gradientTransform(_ value: String) -> Self { addingAttribute("gradientTransform", value) }
  public func gradientTransform(_ value: SVG.Transform) -> Self { addingAttribute("gradientTransform", value.value) }
  public func x1(_ value: CSS.Length) -> Self { addingAttribute("x1", value.value) }
  public func x1(_ value: CSS.Percentage) -> Self { addingAttribute("x1", value.value) }
  public func x1(_ value: CSS.LengthPercentage) -> Self { addingAttribute("x1", value.value) }
  public func y1(_ value: CSS.Length) -> Self { addingAttribute("y1", value.value) }
  public func y1(_ value: CSS.Percentage) -> Self { addingAttribute("y1", value.value) }
  public func y1(_ value: CSS.LengthPercentage) -> Self { addingAttribute("y1", value.value) }
  public func x2(_ value: CSS.Length) -> Self { addingAttribute("x2", value.value) }
  public func x2(_ value: CSS.Percentage) -> Self { addingAttribute("x2", value.value) }
  public func x2(_ value: CSS.LengthPercentage) -> Self { addingAttribute("x2", value.value) }
  public func y2(_ value: CSS.Length) -> Self { addingAttribute("y2", value.value) }
  public func y2(_ value: CSS.Percentage) -> Self { addingAttribute("y2", value.value) }
  public func y2(_ value: CSS.LengthPercentage) -> Self { addingAttribute("y2", value.value) }
  public func spreadMethod(_ value: String) -> Self { addingAttribute("spreadMethod", value) }
}

public func linearGradient(@SVGBuilder content: () -> [DOM.Node] = { [] }) -> SVG.SVGLinearGradientElement {
  SVG.SVGLinearGradientElement(content: content)
}
