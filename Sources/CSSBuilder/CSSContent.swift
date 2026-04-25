import CSSOMBuilder
import WebTypes

public protocol CSSContent: CSSRuleConvertible, Sendable {
  func render() -> CSSRule
  var cssRuleType: CSSRuleType { get }
}

extension CSSContent {
  public var cssRuleType: CSSRuleType { .styleRule }

  /// Helper for quick serialization to string.
  public func build(indent: Int = 0) -> String {
    render().build(indent: indent)
  }
}
