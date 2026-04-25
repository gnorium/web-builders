import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import HTMLBuilder
import WebTypes

public class SVGFEOffsetElement: SVGElement, SVGFilterPrimitiveStandardAttributes,
  @unchecked Sendable
{
  public init() {
    super.init("feOffset")
  }

  public override init(id: Int32) {
    super.init(id: id)
  }
}

extension SVGFEOffsetElement {
  public func `in`(_ value: SVGFilterInput) -> Self { addingAttribute("in", value.value) }
  public func `in`(_ value: String) -> Self { addingAttribute("in", value) }
  public func dx(_ value: Double) -> Self { addingAttribute("dx", doubleToString(value)) }
  public func dy(_ value: Double) -> Self { addingAttribute("dy", doubleToString(value)) }
}

public func feOffset() -> SVGFEOffsetElement { SVGFEOffsetElement() }
