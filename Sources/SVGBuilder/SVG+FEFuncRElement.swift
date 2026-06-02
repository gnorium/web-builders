import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import HTMLBuilder
import WebTypes

extension SVG {
  public class SVGFEFuncRElement: SVGElement, SVGFEComponentTransferFunctionElementAttributes, @unchecked Sendable {
    public init() { super.init("feFuncR") }
    public override init(id: Int32) { super.init(id: id) }
  }
}

public func feFuncR() -> SVG.SVGFEFuncRElement { SVG.SVGFEFuncRElement() }
