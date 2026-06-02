import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import HTMLBuilder
import WebTypes

extension SVG {
  public class SVGStopElement: SVGElement, @unchecked Sendable {
    public init() { super.init("stop") }
    public override init(id: Int32) { super.init(id: id) }
  }
}

extension SVG.SVGStopElement {
  public func offset(_ value: String) -> Self { addingAttribute("offset", value) }
  public func offset(_ value: CSS.Percentage) -> Self { addingAttribute("offset", value.value) }
  public func stopColor(_ value: CSS.Color) -> Self { addingAttribute("stop-color", value.value) }
  public func stopOpacity(_ value: Double) -> Self { addingAttribute("stop-opacity", doubleToString(value)) }
}

public func stop() -> SVG.SVGStopElement { SVG.SVGStopElement() }
