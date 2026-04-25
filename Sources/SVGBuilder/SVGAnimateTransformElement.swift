import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import HTMLBuilder
import WebTypes

public class SVGAnimateTransformElement: SVGElement, @unchecked Sendable {
  public init() {
    super.init("animateTransform")
  }

  public override init(id: Int32) {
    super.init(id: id)
  }
}

extension SVGAnimateTransformElement {
  public func attributeName(_ value: String) -> Self { addingAttribute("attributeName", value) }
  public func attributeName(_ name: SVGAttributeName) -> Self {
    addingAttribute("attributeName", name.rawValue)
  }

  public func type(_ value: String) -> Self { addingAttribute("type", value) }
  public func type(_ type: SVGAnimateTransform.`Type`) -> Self {
    addingAttribute("type", type.rawValue)
  }

  public func from(_ value: String) -> Self { addingAttribute("from", value) }
  public func from(_ values: Double...) -> Self {
    addingAttribute("from", stringJoin(values.map { doubleToString($0) }, separator: " "))
  }

  public func to(_ value: String) -> Self { addingAttribute("to", value) }
  public func to(_ values: Double...) -> Self {
    addingAttribute("to", stringJoin(values.map { doubleToString($0) }, separator: " "))
  }

  public func dur(_ value: String) -> Self { addingAttribute("dur", value) }
  public func dur(_ value: CSSTime) -> Self { addingAttribute("dur", value.value) }

  public func repeatCount(_ value: String) -> Self { addingAttribute("repeatCount", value) }
  public func repeatCount(_ count: SVGAnimate.RepeatCount) -> Self {
    addingAttribute("repeatCount", count.value)
  }

  public func begin(_ value: String) -> Self { addingAttribute("begin", value) }
  public func begin(_ begin: SVGAnimate.Begin) -> Self { addingAttribute("begin", begin.rawValue) }
}

public func animateTransform() -> SVGAnimateTransformElement { SVGAnimateTransformElement() }
