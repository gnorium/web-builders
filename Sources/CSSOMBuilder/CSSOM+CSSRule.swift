import EmbeddedSwiftUtilities
import WebTypes

/// https://drafts.csswg.org/cssom/#the-cssrule-interface
extension CSSOM {
  open class CSSRule: @unchecked Sendable {
    open var cssText: String { "" }
    open var type: UInt16 { 0 }

    public init() {}
  }
}
