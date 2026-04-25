import CSSBuilder
import EmbeddedSwiftUtilities
import HTMLBuilder
import WebTypes

/// Shared attributes for all SVG filter primitive elements.
/// Corresponds to the W3C SVGFilterPrimitiveStandardAttributes interface.
/// https://www.w3.org/TR/filter-effects-1/#InterfaceSVGFilterPrimitiveStandardAttributes
public protocol SVGFilterPrimitiveStandardAttributes: SVGElementBuildable {
  func x(_ value: Length) -> Self
  func x(_ value: Percentage) -> Self
  func x(_ value: Int) -> Self
  func x(_ value: Double) -> Self
  func x(_ value: Float) -> Self

  func y(_ value: Length) -> Self
  func y(_ value: Percentage) -> Self
  func y(_ value: Int) -> Self
  func y(_ value: Double) -> Self
  func y(_ value: Float) -> Self

  func width(_ value: Length) -> Self
  func width(_ value: Percentage) -> Self
  func width(_ value: Int) -> Self
  func width(_ value: Double) -> Self
  func width(_ value: Float) -> Self

  func height(_ value: Length) -> Self
  func height(_ value: Percentage) -> Self
  func height(_ value: Int) -> Self
  func height(_ value: Double) -> Self
  func height(_ value: Float) -> Self

  func result(_ value: String) -> Self
}

extension SVGFilterPrimitiveStandardAttributes {
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

  public func result(_ value: String) -> Self { addingAttribute("result", value) }
}
