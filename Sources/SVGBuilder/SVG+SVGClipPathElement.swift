import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import HTMLBuilder
import WebTypes

extension SVG {
  public class SVGClipPathElement: SVGElement, @unchecked Sendable {
    public init(@SVGBuilder content: () -> [DOM.Node] = { [] }) {
      super.init("clipPath", children: content())
    }
    public override init(id: Int32) { super.init(id: id) }
  }
}

extension SVG.SVGClipPathElement {
  public func clipPathUnits(_ value: SVG.UnitTypes) -> Self { addingAttribute("clipPathUnits", value.rawValue) }
}

public func clipPath(@SVGBuilder content: () -> [DOM.Node] = { [] }) -> SVG.SVGClipPathElement {
  SVG.SVGClipPathElement(content: content)
}
