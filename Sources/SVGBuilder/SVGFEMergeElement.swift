import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import HTMLBuilder
import WebTypes

public class SVGFEMergeElement: SVGElement, SVGFilterPrimitiveStandardAttributes,
  @unchecked Sendable
{
  public init(@SVGBuilder content: () -> [Node] = { [] }) {
    super.init("feMerge", children: content())
  }

  public override init(id: Int32) {
    super.init(id: id)
  }
}

public func feMerge(@SVGBuilder content: () -> [Node] = { [] }) -> SVGFEMergeElement {
  SVGFEMergeElement(content: content)
}
