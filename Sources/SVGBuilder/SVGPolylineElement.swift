import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import HTMLBuilder
import WebTypes

public class SVGPolylineElement: SVGElement, SVGGraphicsElementBuildable, @unchecked Sendable {
  public init() {
    super.init("polyline")
  }

  public override init(id: Int32) {
    super.init(id: id)
  }
}

extension SVGPolylineElement {
  public func points(_ value: String) -> Self { addingAttribute("points", value) }
}

public func polyline() -> SVGPolylineElement { SVGPolylineElement() }
