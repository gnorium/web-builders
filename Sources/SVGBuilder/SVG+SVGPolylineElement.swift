import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import HTMLBuilder
import WebTypes

extension SVG {
  public class SVGPolylineElement: SVGElement, SVGGraphicsElementBuildable, @unchecked Sendable {
    public init(@SVGBuilder content: () -> [DOM.Node] = { [] }) {
      super.init("polyline", children: content())
    }
    public override init(id: Int32) { super.init(id: id) }
  }
}

extension SVG.SVGPolylineElement {
  public func points(_ value: String) -> Self { addingAttribute("points", value) }
}

public func polyline(@SVGBuilder content: () -> [DOM.Node] = { [] }) -> SVG.SVGPolylineElement {
  SVG.SVGPolylineElement(content: content)
}
