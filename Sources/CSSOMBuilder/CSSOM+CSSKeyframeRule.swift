import EmbeddedSwiftUtilities
import WebTypes

/// https://drafts.csswg.org/css-animations/#interface-csskeyframerule
extension CSSOM {
  public final class CSSKeyframeRule: CSSOM.CSSRule, @unchecked Sendable {
    public var keyText: String
    public let style: CSSOM.CSSStyleDeclaration

    public init(_ keyText: String, style: CSSOM.CSSStyleDeclaration = CSSOM.CSSStyleDeclaration()) {
      self.keyText = keyText
      self.style = style
    }

    public override var type: UInt16 { 8 }

    public override var cssText: String {
      let decls = style.renderLines(indent: 1)
      if stringIsEmpty(decls) { return "" }
      return "\(keyText) {\n\(decls)}"
    }
  }
}
