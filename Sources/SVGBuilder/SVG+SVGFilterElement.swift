import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import HTMLBuilder
import WebTypes

extension SVG {
  public class SVGFilterElement: SVGElement, @unchecked Sendable {
    public init(@SVGBuilder content: () -> [DOM.Node] = { [] }) {
      super.init("filter", children: content())
    }
    public override init(id: Int32) { super.init(id: id) }
  }
}

extension SVG.SVGFilterElement {
  public func filterUnits(_ value: SVG.UnitTypes) -> Self { addingAttribute("filterUnits", value.rawValue) }
  public func primitiveUnits(_ value: SVG.UnitTypes) -> Self { addingAttribute("primitiveUnits", value.rawValue) }
  public func x(_ value: CSS.Length) -> Self { addingAttribute("x", value.value) }
  public func x(_ value: CSS.Percentage) -> Self { addingAttribute("x", value.value) }
  public func x(_ value: Int) -> Self { addingAttribute("x", "\(value)px") }
  public func x(_ value: Double) -> Self { addingAttribute("x", "\(value)px") }
  public func x(_ value: Float) -> Self { addingAttribute("x", "\(value)px") }
  public func y(_ value: CSS.Length) -> Self { addingAttribute("y", value.value) }
  public func y(_ value: CSS.Percentage) -> Self { addingAttribute("y", value.value) }
  public func y(_ value: Int) -> Self { addingAttribute("y", "\(value)px") }
  public func y(_ value: Double) -> Self { addingAttribute("y", "\(value)px") }
  public func y(_ value: Float) -> Self { addingAttribute("y", "\(value)px") }
  public func width(_ value: CSS.Length) -> Self { addingAttribute("width", value.value) }
  public func width(_ value: CSS.Percentage) -> Self { addingAttribute("width", value.value) }
  public func width(_ value: Int) -> Self { addingAttribute("width", "\(value)px") }
  public func width(_ value: Double) -> Self { addingAttribute("width", "\(value)px") }
  public func width(_ value: Float) -> Self { addingAttribute("width", "\(value)px") }
  public func height(_ value: CSS.Length) -> Self { addingAttribute("height", value.value) }
  public func height(_ value: CSS.Percentage) -> Self { addingAttribute("height", value.value) }
  public func height(_ value: Int) -> Self { addingAttribute("height", "\(value)px") }
  public func height(_ value: Double) -> Self { addingAttribute("height", "\(value)px") }
  public func height(_ value: Float) -> Self { addingAttribute("height", "\(value)px") }
}

public func filter(@SVGBuilder content: () -> [DOM.Node] = { [] }) -> SVG.SVGFilterElement {
  SVG.SVGFilterElement(content: content)
}
