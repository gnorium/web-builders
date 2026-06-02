import CSSOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

public func fontFace(@CSSBuilder _ declarations: () -> CSSOM.CSSStyleDeclaration) -> CSSOM.CSSFontFaceRule {
  CSSOM.CSSFontFaceRule(style: declarations())
}
