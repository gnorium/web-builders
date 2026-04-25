import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import HTMLBuilder
import WebTypes

public class SVGDefsElement: SVGElement, @unchecked Sendable {
  public init(@SVGBuilder content: () -> [Node] = { [] }) {
    super.init("defs", children: content())
  }

  public override init(id: Int32) {
    super.init(id: id)
  }
}

public func defs(@SVGBuilder content: () -> [Node] = { [] }) -> SVGDefsElement {
  SVGDefsElement(content: content)
}
