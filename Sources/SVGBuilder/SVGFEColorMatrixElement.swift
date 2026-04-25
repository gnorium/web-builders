import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import HTMLBuilder
import WebTypes

public class SVGFEColorMatrixElement: SVGElement, SVGFilterPrimitiveStandardAttributes,
  @unchecked Sendable
{
  public init() {
    super.init("feColorMatrix")
  }

  public override init(id: Int32) {
    super.init(id: id)
  }
}

extension SVGFEColorMatrixElement {
  public func `in`(_ value: SVGFilterInput) -> Self { addingAttribute("in", value.value) }
  public func `in`(_ value: String) -> Self { addingAttribute("in", value) }
  public func type(_ value: String) -> Self { addingAttribute("type", value) }
  public func values(_ value: String) -> Self { addingAttribute("values", value) }
}

public func feColorMatrix() -> SVGFEColorMatrixElement { SVGFEColorMatrixElement() }
