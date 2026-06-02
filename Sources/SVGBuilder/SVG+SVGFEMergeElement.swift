import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import HTMLBuilder
import WebTypes

extension SVG {
  public class SVGFEMergeElement: SVGElement, SVGFilterPrimitiveStandardAttributes, @unchecked Sendable {
    public init(@SVGBuilder content: () -> [DOM.Node] = { [] }) {
      super.init("feMerge", children: content())
    }
    public override init(id: Int32) { super.init(id: id) }
  }
}

public func feMerge(@SVGBuilder content: () -> [DOM.Node] = { [] }) -> SVG.SVGFEMergeElement {
  SVG.SVGFEMergeElement(content: content)
}
