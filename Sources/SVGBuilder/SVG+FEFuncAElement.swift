import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import HTMLBuilder
import WebTypes

extension SVG {
  public class SVGFEFuncAElement: SVGElement, SVGFEComponentTransferFunctionElementAttributes, @unchecked Sendable {
    public init() { super.init("feFuncA") }
    public override init(id: Int32) { super.init(id: id) }
  }
}

public func feFuncA() -> SVG.SVGFEFuncAElement { SVG.SVGFEFuncAElement() }
