import CSSOMBuilder
import WebTypes

public struct CSSImportRule: CSSContent {
  public let url: String
  public let media: String?

  public init(_ url: String, media: String? = nil) {
    self.url = url
    self.media = media
  }

  public func render() -> CSSRule {
    .importRule(url: url, media: media)
  }

  public var cssRuleType: CSSRuleType { .importRule }
}

public func importCSS(_ url: String, media: String? = nil) -> CSSImportRule {
  CSSImportRule(url, media: media)
}
