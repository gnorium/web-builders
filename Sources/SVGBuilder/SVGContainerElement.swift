import DOMBuilder
import EmbeddedSwiftUtilities
import HTMLBuilder
import WebTypes

/// SVGContent container elements (switch, foreignObject).
/// https://www.w3.org/TR/SVG2/struct.html#InterfaceSVGForeignObjectElement
public class SVGContainerElement: SVGElement, SVGGraphicsElementBuildable, @unchecked Sendable {
  public init(name: String, @SVGBuilder content: () -> [Node] = { [] }) {
    super.init(name, children: content())
  }

  public init(name: String, @HTMLBuilder htmlContent: () -> [Node]) {
    super.init(name, children: htmlContent())
  }

  public override init(id: Int32) {
    super.init(id: id)
  }
}

extension SVGContainerElement {
  // MARK: - Dimensions

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

  public func width(_ value: Length) -> Self { addingAttribute("width", value.value) }
  public func width(_ value: Percentage) -> Self { addingAttribute("width", value.value) }
  public func width(_ value: Int) -> Self { addingAttribute("width", "\(value)px") }
  public func width(_ value: Double) -> Self { addingAttribute("width", "\(value)px") }
  public func width(_ value: Float) -> Self { addingAttribute("width", "\(value)px") }

  public func height(_ value: Length) -> Self { addingAttribute("height", value.value) }
  public func height(_ value: Percentage) -> Self { addingAttribute("height", value.value) }
  public func height(_ value: Int) -> Self { addingAttribute("height", "\(value)px") }
  public func height(_ value: Double) -> Self { addingAttribute("height", "\(value)px") }
  public func height(_ value: Float) -> Self { addingAttribute("height", "\(value)px") }
}

/// Factory function for switch element
public func switch_SVG(@SVGBuilder _ content: () -> [Node] = { [] }) -> SVGContainerElement {
  SVGContainerElement(name: "switch", content: content)
}

/// Factory function for foreignObject element (SVGContent content)
public func foreignObject(@SVGBuilder _ content: () -> [Node] = { [] }) -> SVGContainerElement {
  SVGContainerElement(name: "foreignObject", content: content)
}

/// Factory function for foreignObject element (HTMLContent content)
public func foreignObject(@HTMLBuilder htmlContent: () -> [Node]) -> SVGContainerElement {
  SVGContainerElement(name: "foreignObject", htmlContent: htmlContent)
}
