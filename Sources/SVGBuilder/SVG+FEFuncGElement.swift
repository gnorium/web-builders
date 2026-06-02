import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import HTMLBuilder
import WebTypes

extension SVG {
  public class SVGFEFuncGElement: SVGElement, SVGFEComponentTransferFunctionElementAttributes, @unchecked Sendable {
    public init() { super.init("feFuncG") }
    public override init(id: Int32) { super.init(id: id) }
  }
}

public func feFuncG() -> SVG.SVGFEFuncGElement { SVG.SVGFEFuncGElement() }
