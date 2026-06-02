import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import HTMLBuilder
import WebTypes

extension SVG {
  public class SVGFEMergeNodeElement: SVGElement, @unchecked Sendable {
    public init() { super.init("feMergeNode") }
    public override init(id: Int32) { super.init(id: id) }
  }
}

extension SVG.SVGFEMergeNodeElement {
  public func `in`(_ value: SVG.FilterInput) -> Self { addingAttribute("in", value.value) }
  public func `in`(_ value: String) -> Self { addingAttribute("in", value) }
}

public func feMergeNode() -> SVG.SVGFEMergeNodeElement { SVG.SVGFEMergeNodeElement() }
