import EmbeddedSwiftUtilities
import WebTypes

/// https://drafts.csswg.org/css-fonts/#om-fontface
extension CSSOM {
  public final class CSSFontFaceRule: CSSOM.CSSRule, @unchecked Sendable {
    public let style: CSSOM.CSSStyleDeclaration

    public init(style: CSSOM.CSSStyleDeclaration = CSSOM.CSSStyleDeclaration()) {
      self.style = style
    }

    public override var type: UInt16 { 5 }

    public override var cssText: String {
      let decls = style.renderLines(indent: 1)
      if stringIsEmpty(decls) { return "" }
      return "@font-face {\n\(decls)}"
    }
  }
}
