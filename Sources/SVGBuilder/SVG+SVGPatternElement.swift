import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import HTMLBuilder
import WebTypes

extension SVG {
  public class SVGPatternElement: SVGElement, @unchecked Sendable {
    public init(@SVGBuilder content: () -> [DOM.Node] = { [] }) {
      super.init("pattern", children: content())
    }
    public override init(id: Int32) { super.init(id: id) }
  }
}

extension SVG.SVGPatternElement {
  public func patternUnits(_ value: SVG.UnitTypes) -> Self { addingAttribute("patternUnits", value.rawValue) }
  public func patternContentUnits(_ value: SVG.UnitTypes) -> Self { addingAttribute("patternContentUnits", value.rawValue) }
  public func x(_ value: CSS.Length) -> Self { addingAttribute("x", value.value) }
  public func x(_ value: CSS.Percentage) -> Self { addingAttribute("x", value.value) }
  public func x(_ value: Int) -> Self { addingAttribute("x", "\(intToString(value))px") }
  public func x(_ value: Double) -> Self { addingAttribute("x", "\(doubleToString(value))px") }
  public func x(_ value: Float) -> Self { addingAttribute("x", "\(doubleToString(Double(value)))px") }
  public func y(_ value: CSS.Length) -> Self { addingAttribute("y", value.value) }
  public func y(_ value: CSS.Percentage) -> Self { addingAttribute("y", value.value) }
  public func y(_ value: Int) -> Self { addingAttribute("y", "\(intToString(value))px") }
  public func y(_ value: Double) -> Self { addingAttribute("y", "\(doubleToString(value))px") }
  public func y(_ value: Float) -> Self { addingAttribute("y", "\(doubleToString(Double(value)))px") }
  public func width(_ value: CSS.Length) -> Self { addingAttribute("width", value.value) }
  public func width(_ value: CSS.Percentage) -> Self { addingAttribute("width", value.value) }
  public func width(_ value: Int) -> Self { addingAttribute("width", "\(intToString(value))px") }
  public func width(_ value: Double) -> Self { addingAttribute("width", "\(doubleToString(value))px") }
  public func width(_ value: Float) -> Self { addingAttribute("width", "\(doubleToString(Double(value)))px") }
  public func height(_ value: CSS.Length) -> Self { addingAttribute("height", value.value) }
  public func height(_ value: CSS.Percentage) -> Self { addingAttribute("height", value.value) }
  public func height(_ value: Int) -> Self { addingAttribute("height", "\(intToString(value))px") }
  public func height(_ value: Double) -> Self { addingAttribute("height", "\(doubleToString(value))px") }
  public func height(_ value: Float) -> Self { addingAttribute("height", "\(doubleToString(Double(value)))px") }
  public func viewBox(_ minX: Double, _ minY: Double, _ width: Double, _ height: Double) -> Self {
    addingAttribute("viewBox", "\(doubleToString(minX)) \(doubleToString(minY)) \(doubleToString(width)) \(doubleToString(height))")
  }
}

public func pattern(@SVGBuilder content: () -> [DOM.Node] = { [] }) -> SVG.SVGPatternElement {
  SVG.SVGPatternElement(content: content)
}
