import CSSBuilder
import CSSOMBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import HTMLBuilder
import WebTypes

public class SVGGElement: SVGElement, SVGGraphicsElementBuildable, @unchecked Sendable {
  public init(@SVGBuilder content: () -> [Node] = { [] }) {
    super.init("g", children: content())
  }

  public override init(id: Int32) {
    super.init(id: id)
  }
}

public func g(@SVGBuilder content: () -> [Node] = { [] }) -> SVGGElement {
  SVGGElement(content: content)
}
