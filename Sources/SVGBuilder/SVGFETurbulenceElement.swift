import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import HTMLBuilder
import WebTypes

public class SVGFETurbulenceElement: SVGElement, SVGFilterPrimitiveStandardAttributes,
  @unchecked Sendable
{
  public init() {
    super.init("feTurbulence")
  }

  public override init(id: Int32) {
    super.init(id: id)
  }
}

extension SVGFETurbulenceElement {
  public func baseFrequency(_ value: Double) -> Self {
    addingAttribute("baseFrequency", doubleToString(value))
  }
  public func baseFrequency(_ x: Double, _ y: Double) -> Self {
    addingAttribute("baseFrequency", "\(doubleToString(x)) \(doubleToString(y))")
  }
  public func numOctaves(_ value: Int) -> Self { addingAttribute("numOctaves", intToString(value)) }
  public func seed(_ value: Double) -> Self { addingAttribute("seed", doubleToString(value)) }
  public func stitchTiles(_ value: String) -> Self { addingAttribute("stitchTiles", value) }
  public func type(_ value: String) -> Self { addingAttribute("type", value) }
}

public func feTurbulence() -> SVGFETurbulenceElement { SVGFETurbulenceElement() }
