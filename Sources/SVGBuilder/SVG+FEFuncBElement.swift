import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import HTMLBuilder
import WebTypes

extension SVG {
  public class SVGFEFuncBElement: SVGElement, SVGFEComponentTransferFunctionElementAttributes, @unchecked Sendable {
    public init() { super.init("feFuncB") }
    public override init(id: Int32) { super.init(id: id) }
  }
}

public func feFuncB() -> SVG.SVGFEFuncBElement { SVG.SVGFEFuncBElement() }
