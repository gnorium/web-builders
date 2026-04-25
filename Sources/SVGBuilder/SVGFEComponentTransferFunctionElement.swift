import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import HTMLBuilder
import WebTypes

/// Shared attributes for component transfer functions (feFuncR, feFuncG, feFuncB, feFuncA).
/// Corresponds to the W3C SVGFEComponentTransferFunctionElement interface.
/// https://www.w3.org/TR/filter-effects-1/#InterfaceSVGFEComponentTransferFunctionElement
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
  public func intercept(_ value: Double) -> Self {
    addingAttribute("intercept", doubleToString(value))
  }
  public func amplitude(_ value: Double) -> Self {
    addingAttribute("amplitude", doubleToString(value))
  }
  public func exponent(_ value: Double) -> Self {
    addingAttribute("exponent", doubleToString(value))
  }
  public func offset(_ value: Double) -> Self { addingAttribute("offset", doubleToString(value)) }
}

public class SVGFEFuncRElement: SVGElement, SVGFEComponentTransferFunctionElementAttributes,
  @unchecked Sendable
{
  public init() {
    super.init("feFuncR")
  }

  public override init(id: Int32) {
    super.init(id: id)
  }
}

public class SVGFEFuncGElement: SVGElement, SVGFEComponentTransferFunctionElementAttributes,
  @unchecked Sendable
{
  public init() {
    super.init("feFuncG")
  }

  public override init(id: Int32) {
    super.init(id: id)
  }
}

public class SVGFEFuncBElement: SVGElement, SVGFEComponentTransferFunctionElementAttributes,
  @unchecked Sendable
{
  public init() {
    super.init("feFuncB")
  }

  public override init(id: Int32) {
    super.init(id: id)
  }
}

public class SVGFEFuncAElement: SVGElement, SVGFEComponentTransferFunctionElementAttributes,
  @unchecked Sendable
{
  public init() {
    super.init("feFuncA")
  }

  public override init(id: Int32) {
    super.init(id: id)
  }
}

public func feFuncR() -> SVGFEFuncRElement { SVGFEFuncRElement() }
public func feFuncG() -> SVGFEFuncGElement { SVGFEFuncGElement() }
public func feFuncB() -> SVGFEFuncBElement { SVGFEFuncBElement() }
public func feFuncA() -> SVGFEFuncAElement { SVGFEFuncAElement() }
