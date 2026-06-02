import EmbeddedSwiftUtilities
import WebTypes

/// https://drafts.csswg.org/cssom/#the-cssimportrule-interface
extension CSSOM {
  public final class CSSImportRule: CSSOM.CSSRule, @unchecked Sendable {
    public let href: String
    public let media: CSSOM.MediaList

    public init(_ href: String, media: String? = nil) {
      self.href = href
      self.media = CSSOM.MediaList(media ?? "")
    }

    public override var type: UInt16 { 3 }

    public override var cssText: String {
      let mediaSuffix = stringIsEmpty(media.mediaText) ? "" : " \(media.mediaText)"
      return "@import \"\(href)\"\(mediaSuffix);"
    }
  }
}

/// Free function uses backtick escaping to match the @import CSS at-rule keyword exactly.
public func `import`(_ href: String, media: String? = nil) -> CSSOM.CSSImportRule {
  CSSOM.CSSImportRule(href, media: media)
}
