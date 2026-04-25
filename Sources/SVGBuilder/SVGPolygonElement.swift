import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import HTMLBuilder
import WebTypes

public class SVGPolygonElement: SVGElement, SVGGraphicsElementBuildable, @unchecked Sendable {
  public init(@SVGBuilder content: () -> [Node] = { [] }) {
    super.init("polygon", children: content())
  }

  public override init(id: Int32) {
    super.init(id: id)
  }
}

extension SVGPolygonElement {
  public func points(_ coordinates: (Double, Double)...) -> Self {
    let pointsString = stringJoin(
      coordinates.map { "\(doubleToString($0.0)),\(doubleToString($0.1))" }, separator: " ")
    return addingAttribute("points", pointsString)
  }

  public func points(_ value: String) -> Self {
    return addingAttribute("points", value)
  }
}

public func polygon(@SVGBuilder content: () -> [Node] = { [] }) -> SVGPolygonElement {
  SVGPolygonElement(content: content)
}
