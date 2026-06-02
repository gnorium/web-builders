import CSSBuilder
import CSSOMBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import HTMLBuilder
import WebTypes

extension SVG {
  public class SVGGElement: SVGElement, SVGGraphicsElementBuildable, @unchecked Sendable {
    public init(@SVGBuilder content: () -> [DOM.Node] = { [] }) {
      super.init("g", children: content())
    }
    public override init(id: Int32) { super.init(id: id) }
  }
}

public func g(@SVGBuilder content: () -> [DOM.Node] = { [] }) -> SVG.SVGGElement {
  SVG.SVGGElement(content: content)
}
