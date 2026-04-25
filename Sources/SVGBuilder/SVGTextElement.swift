import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import HTMLBuilder
import WebTypes

public class SVGTextElement: SVGElement, SVGGraphicsElementBuildable, @unchecked Sendable {
  public init(@SVGBuilder content: () -> [Node] = { [] }) {
    super.init("text", children: content())
  }

  public init(_ value: String) {
    super.init("text", children: [HTMLText(content: value)])
  }

  public override init(id: Int32) {
    super.init(id: id)
  }
}

extension SVGTextElement: SVGTextContentElementAttributes {
  public func x(_ value: Length) -> Self { addingAttribute("x", value.value) }
  public func x(_ value: Percentage) -> Self { addingAttribute("x", value.value) }
  public func x(_ value: Int) -> Self { addingAttribute("x", "\(value)px") }
  public func x(_ value: Double) -> Self { addingAttribute("x", "\(value)px") }
  public func x(_ value: Float) -> Self { addingAttribute("x", "\(value)px") }

  public func y(_ value: Length) -> Self { addingAttribute("y", value.value) }
  public func y(_ value: Percentage) -> Self { addingAttribute("y", value.value) }
  public func y(_ value: Int) -> Self { addingAttribute("y", "\(value)px") }
  public func y(_ value: Double) -> Self { addingAttribute("y", "\(value)px") }
  public func y(_ value: Float) -> Self { addingAttribute("y", "\(value)px") }

  public func dx(_ value: Length) -> Self { addingAttribute("dx", value.value) }
  public func dx(_ value: Percentage) -> Self { addingAttribute("dx", value.value) }
  public func dx(_ value: Int) -> Self { addingAttribute("dx", "\(value)px") }
  public func dx(_ value: Double) -> Self { addingAttribute("dx", "\(value)px") }
  public func dx(_ value: Float) -> Self { addingAttribute("dx", "\(value)px") }

  public func dy(_ value: Length) -> Self { addingAttribute("dy", value.value) }
  public func dy(_ value: Percentage) -> Self { addingAttribute("dy", value.value) }
  public func dy(_ value: Int) -> Self { addingAttribute("dy", "\(value)px") }
  public func dy(_ value: Double) -> Self { addingAttribute("dy", "\(value)px") }
  public func dy(_ value: Float) -> Self { addingAttribute("dy", "\(value)px") }

  public func textLength(_ value: Length) -> Self { addingAttribute("textLength", value.value) }
  public func textLength(_ value: Percentage) -> Self { addingAttribute("textLength", value.value) }
  public func textLength(_ value: Int) -> Self { addingAttribute("textLength", "\(value)px") }
  public func textLength(_ value: Double) -> Self { addingAttribute("textLength", "\(value)px") }
  public func textLength(_ value: Float) -> Self { addingAttribute("textLength", "\(value)px") }
  public func rotate(_ value: String) -> Self { addingAttribute("rotate", value) }
  public func lengthAdjust(_ value: String) -> Self { addingAttribute("lengthAdjust", value) }
}

public func text(_ value: String) -> SVGTextElement { SVGTextElement(value) }
public func text(@SVGBuilder _ content: () -> [Node] = { [] }) -> SVGTextElement {
  SVGTextElement(content: content)
}
