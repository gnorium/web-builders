import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import HTMLBuilder
import WebTypes

public class SVGAnimateElement: SVGElement, SVGAnimationElementBuildable, @unchecked Sendable {
  public init() {
    super.init("animate")
  }

  public override init(id: Int32) {
    super.init(id: id)
  }
}

extension SVGAnimateElement {
  public func attributeName<T>(_ attr: SVGAttribute<T>) -> TypedSVGAnimateElement<T> {
    _ = addingAttribute("attributeName", attr.name.rawValue)
    return TypedSVGAnimateElement(attribute: attr, attributes: attributes)
  }

  public func attributeName(_ name: SVGAttributeName) -> Self {
    return addingAttribute("attributeName", name.rawValue)
  }

  public func keyTimes(_ times: Double...) -> Self {
    addingAttribute("keyTimes", stringJoin(times.map { doubleToString($0) }, separator: ";"))
  }
  public func keyTimes(_ times: Int...) -> Self {
    addingAttribute("keyTimes", stringJoin(times.map { intToString($0) }, separator: ";"))
  }

  public func calcMode(_ mode: SVGAnimate.CalcMode) -> Self {
    addingAttribute("calcMode", mode.rawValue)
  }

  public func keySplines(_ splines: (Double, Double, Double, Double)...) -> Self {
    let strings = splines.map { s in
      "\(doubleToString(s.0)) \(doubleToString(s.1)) \(doubleToString(s.2)) \(doubleToString(s.3))"
    }
    return addingAttribute("keySplines", stringJoin(strings, separator: ";"))
  }

  public func dur(_ value: String) -> Self { addingAttribute("dur", value) }
  public func dur(_ value: CSSTime) -> Self { addingAttribute("dur", value.value) }

  public func repeatCount(_ value: String) -> Self { addingAttribute("repeatCount", value) }
  public func repeatCount(_ count: SVGAnimate.RepeatCount) -> Self {
    addingAttribute("repeatCount", count.value)
  }

  public func fill(_ value: String) -> Self { addingAttribute("fill", value) }
  public func fill(_ fill: SVGAnimate.Fill) -> Self { addingAttribute("fill", fill.rawValue) }

  public func begin(_ value: String) -> Self { addingAttribute("begin", value) }
  public func begin(_ begin: SVGAnimate.Begin) -> Self { addingAttribute("begin", begin.rawValue) }

  public func attributeType(_ value: String) -> Self { addingAttribute("attributeType", value) }
  public func attributeType(_ type: SVGAnimate.AttributeType) -> Self {
    addingAttribute("attributeType", type.rawValue)
  }
}

public func animate() -> SVGAnimateElement { SVGAnimateElement() }
