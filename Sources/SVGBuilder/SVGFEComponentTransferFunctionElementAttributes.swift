import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import HTMLBuilder
import WebTypes

/// Shared attributes for component transfer functions (feFuncR, feFuncG, feFuncB, feFuncA).
/// Corresponds to the W3C SVGFEComponentTransferFunctionElement interface.
public protocol SVGFEComponentTransferFunctionElementAttributes: SVGElementBuildable {
  func type(_ value: String) -> Self
  func tableValues(_ value: String) -> Self
  func slope(_ value: Double) -> Self
  func intercept(_ value: Double) -> Self
  func amplitude(_ value: Double) -> Self
  func exponent(_ value: Double) -> Self
  func offset(_ value: Double) -> Self
}

extension SVGFEComponentTransferFunctionElementAttributes {
  public func type(_ value: String) -> Self { addingAttribute("type", value) }
  public func tableValues(_ value: String) -> Self { addingAttribute("tableValues", value) }
  public func slope(_ value: Double) -> Self { addingAttribute("slope", doubleToString(value)) }
  public func intercept(_ value: Double) -> Self { addingAttribute("intercept", doubleToString(value)) }
  public func amplitude(_ value: Double) -> Self { addingAttribute("amplitude", doubleToString(value)) }
  public func exponent(_ value: Double) -> Self { addingAttribute("exponent", doubleToString(value)) }
  public func offset(_ value: Double) -> Self { addingAttribute("offset", doubleToString(value)) }
}
