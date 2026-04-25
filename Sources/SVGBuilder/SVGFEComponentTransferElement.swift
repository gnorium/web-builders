import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import HTMLBuilder
import WebTypes

public class SVGFEComponentTransferElement: SVGElement, SVGFilterPrimitiveStandardAttributes,
  @unchecked Sendable
{
  public init(@SVGBuilder content: () -> [Node] = { [] }) {
    super.init("feComponentTransfer", children: content())
  }

  public override init(id: Int32) {
    super.init(id: id)
  }
}

extension SVGFEComponentTransferElement {
  public func `in`(_ value: SVGFilterInput) -> Self { addingAttribute("in", value.value) }
  public func `in`(_ value: String) -> Self { addingAttribute("in", value) }
}

public func feComponentTransfer(@SVGBuilder content: () -> [Node] = { [] })
  -> SVGFEComponentTransferElement
{ SVGFEComponentTransferElement(content: content) }
