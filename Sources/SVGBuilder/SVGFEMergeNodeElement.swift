import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import HTMLBuilder
import WebTypes

public class SVGFEMergeNodeElement: SVGElement, @unchecked Sendable {
  public init() {
    super.init("feMergeNode")
  }

  public override init(id: Int32) {
    super.init(id: id)
  }
}

extension SVGFEMergeNodeElement {
  public func `in`(_ value: SVGFilterInput) -> Self { addingAttribute("in", value.value) }
  public func `in`(_ value: String) -> Self { addingAttribute("in", value) }
}

public func feMergeNode() -> SVGFEMergeNodeElement { SVGFEMergeNodeElement() }
