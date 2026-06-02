import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import HTMLBuilder
import WebTypes

extension SVG {
  public class SVGFEGaussianBlurElement: SVGElement, SVGFilterPrimitiveStandardAttributes, @unchecked Sendable {
    public init() { super.init("feGaussianBlur") }
    public override init(id: Int32) { super.init(id: id) }
  }
}

extension SVG.SVGFEGaussianBlurElement {
  public func `in`(_ value: SVG.FilterInput) -> Self { addingAttribute("in", value.value) }
  public func `in`(_ value: String) -> Self { addingAttribute("in", value) }
  public func stdDeviation(_ value: Double) -> Self { addingAttribute("stdDeviation", doubleToString(value)) }
  public func stdDeviation(_ x: Double, _ y: Double) -> Self { addingAttribute("stdDeviation", "\(doubleToString(x)) \(doubleToString(y))") }
}

public func feGaussianBlur() -> SVG.SVGFEGaussianBlurElement { SVG.SVGFEGaussianBlurElement() }
