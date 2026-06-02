import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import HTMLBuilder
import WebTypes

extension SVG {
  public class SVGDefsElement: SVGElement, @unchecked Sendable {
    public init(@SVGBuilder content: () -> [DOM.Node] = { [] }) {
      super.init("defs", children: content())
    }
    public override init(id: Int32) { super.init(id: id) }
  }
}

public func defs(@SVGBuilder content: () -> [DOM.Node] = { [] }) -> SVG.SVGDefsElement {
  SVG.SVGDefsElement(content: content)
}
