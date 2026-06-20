import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import HTMLBuilder
import WebTypes

extension SVG {
  public class SVGAnimateTransformElement: SVGElement, @unchecked Sendable {
    public init() { super.init("animateTransform") }
    public override init(id: Int32) { super.init(id: id) }
  }
}

extension SVG.SVGAnimateTransformElement {
  public func attributeName(_ value: String) -> Self { addingAttribute("attributeName", value) }
  public func attributeName(_ name: SVGAttributeName) -> Self { addingAttribute("attributeName", name.rawValue) }
  public func type(_ value: String) -> Self { addingAttribute("type", value) }
  public func type(_ type: SVG.AnimateTransform.`Type`) -> Self { addingAttribute("type", type.rawValue) }
  public func from(_ value: String) -> Self { addingAttribute("from", value) }
  public func from(_ values: Double...) -> Self { addingAttribute("from", stringJoin(values.map { doubleToString($0) }, separator: " ")) }
  public func to(_ value: String) -> Self { addingAttribute("to", value) }
  public func to(_ values: Double...) -> Self { addingAttribute("to", stringJoin(values.map { doubleToString($0) }, separator: " ")) }
  public func dur(_ value: String) -> Self { addingAttribute("dur", value) }
  public func dur(_ value: CSS.Time) -> Self { addingAttribute("dur", value.value) }
  public func repeatCount(_ value: String) -> Self { addingAttribute("repeatCount", value) }
  public func repeatCount(_ count: SVG.Animate.RepeatCount) -> Self { addingAttribute("repeatCount", count.value) }
  public func begin(_ value: String) -> Self { addingAttribute("begin", value) }
  public func begin(_ begin: SVG.Animate.Begin) -> Self { addingAttribute("begin", begin.rawValue) }
  public func values(_ value: String) -> Self { addingAttribute("values", value) }
  public func values(_ pairs: (Double, Double)...) -> Self {
    addingAttribute("values", stringJoin(pairs.map { "\(doubleToString($0.0)) \(doubleToString($0.1))" }, separator: ";"))
  }
  public func keyTimes(_ times: Double...) -> Self { addingAttribute("keyTimes", stringJoin(times.map { doubleToString($0) }, separator: ";")) }
  public func calcMode(_ mode: SVG.Animate.CalcMode) -> Self { addingAttribute("calcMode", mode.rawValue) }
  public func keySplines(_ splines: (Double, Double, Double, Double)...) -> Self {
    let strings = splines.map { "\(doubleToString($0.0)) \(doubleToString($0.1)) \(doubleToString($0.2)) \(doubleToString($0.3))" }
    return addingAttribute("keySplines", stringJoin(strings, separator: ";"))
  }
  public func additive(_ value: String) -> Self { addingAttribute("additive", value) }
  public func accumulate(_ value: String) -> Self { addingAttribute("accumulate", value) }
  public func id(_ value: String) -> Self { addingAttribute("id", value) }
  // Matrix values: each tuple is (a, b, c, d, e, f) per keyframe
  public func values(_ matrices: (Double, Double, Double, Double, Double, Double)...) -> Self {
    let strings = matrices.map { m in
      "\(doubleToString(m.0)) \(doubleToString(m.1)) \(doubleToString(m.2)) \(doubleToString(m.3)) \(doubleToString(m.4)) \(doubleToString(m.5))"
    }
    return addingAttribute("values", stringJoin(strings, separator: ";"))
  }
}

public func animateTransform() -> SVG.SVGAnimateTransformElement { SVG.SVGAnimateTransformElement() }
