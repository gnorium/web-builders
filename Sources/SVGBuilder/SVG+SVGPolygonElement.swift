import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import HTMLBuilder
import WebTypes

extension SVG {
  public class SVGPolygonElement: SVGElement, SVGGraphicsElementBuildable, @unchecked Sendable {
    public init(@SVGBuilder content: () -> [DOM.Node] = { [] }) {
      super.init("polygon", children: content())
    }
    public override init(id: Int32) { super.init(id: id) }
  }
}

extension SVG.SVGPolygonElement {
  public func points(_ coordinates: (Double, Double)...) -> Self {
    addingAttribute("points", stringJoin(coordinates.map { "\(doubleToString($0.0)),\(doubleToString($0.1))" }, separator: " "))
  }
  public func points(_ value: String) -> Self { addingAttribute("points", value) }
}

public func polygon(@SVGBuilder content: () -> [DOM.Node] = { [] }) -> SVG.SVGPolygonElement {
  SVG.SVGPolygonElement(content: content)
}
