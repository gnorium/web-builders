import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import HTMLBuilder
import WebTypes

extension SVG {
  public class SVGFEComponentTransferElement: SVGElement, SVGFilterPrimitiveStandardAttributes, @unchecked Sendable {
    public init(@SVGBuilder content: () -> [DOM.Node] = { [] }) {
      super.init("feComponentTransfer", children: content())
    }
    public override init(id: Int32) { super.init(id: id) }
  }
}

extension SVG.SVGFEComponentTransferElement {
  public func `in`(_ value: SVG.FilterInput) -> Self { addingAttribute("in", value.value) }
  public func `in`(_ value: String) -> Self { addingAttribute("in", value) }
}

public func feComponentTransfer(@SVGBuilder content: () -> [DOM.Node] = { [] }) -> SVG.SVGFEComponentTransferElement {
  SVG.SVGFEComponentTransferElement(content: content)
}
