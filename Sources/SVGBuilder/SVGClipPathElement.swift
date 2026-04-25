import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import HTMLBuilder
import WebTypes

public class SVGClipPathElement: SVGElement, @unchecked Sendable {
  public init(@SVGBuilder content: () -> [Node] = { [] }) {
    super.init("clipPath", children: content())
  }

  public override init(id: Int32) {
    super.init(id: id)
  }
}

extension SVGClipPathElement {
  public func clipPathUnits(_ value: SVGUnitTypes) -> Self {
    addingAttribute("clipPathUnits", value.rawValue)
  }
}

public func clipPath(@SVGBuilder content: () -> [Node] = { [] }) -> SVGClipPathElement {
  SVGClipPathElement(content: content)
}
