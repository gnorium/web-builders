import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import HTMLBuilder
import WebTypes

/// Shared attributes for text-content elements like text, tspan, etc.
public protocol SVGTextContentElementAttributes: SVGElementBuildable {
  func x(_ value: CSS.Length) -> Self
  func x(_ value: CSS.Percentage) -> Self
  func x(_ value: Int) -> Self
  func x(_ value: Double) -> Self
  func x(_ value: Float) -> Self

  func y(_ value: CSS.Length) -> Self
  func y(_ value: CSS.Percentage) -> Self
  func y(_ value: Int) -> Self
  func y(_ value: Double) -> Self
  func y(_ value: Float) -> Self

  func dx(_ value: CSS.Length) -> Self
  func dx(_ value: CSS.Percentage) -> Self
  func dx(_ value: Int) -> Self
  func dx(_ value: Double) -> Self
  func dx(_ value: Float) -> Self

  func dy(_ value: CSS.Length) -> Self
  func dy(_ value: CSS.Percentage) -> Self
  func dy(_ value: Int) -> Self
  func dy(_ value: Double) -> Self
  func dy(_ value: Float) -> Self

  func rotate(_ value: String) -> Self

  func textLength(_ value: CSS.Length) -> Self
  func textLength(_ value: CSS.Percentage) -> Self
  func textLength(_ value: Int) -> Self
  func textLength(_ value: Double) -> Self
  func textLength(_ value: Float) -> Self

  func lengthAdjust(_ value: String) -> Self
}
