import EmbeddedSwiftUtilities
import WebTypes

/// https://drafts.csswg.org/cssom/#the-cssstylesheet-interface
extension CSSOM {
  public final class CSSStyleSheet: CSSOM.StyleSheet, @unchecked Sendable {
    public let cssRules: CSSOM.CSSRuleList

    public init(rules: [CSSOM.CSSRule] = []) {
      self.cssRules = CSSOM.CSSRuleList(rules)
    }

    public func insertRule(_ rule: CSSOM.CSSRule, index: Int) {
      cssRules.insert(rule, at: index)
    }

    public func deleteRule(_ index: Int) {
      cssRules.delete(at: index)
    }

    public var cssText: String {
      var result = ""
      for rule in cssRules.items {
        let text = rule.cssText
        if !stringIsEmpty(text) {
          result = "\(result)\(text)\n"
        }
      }
      return result
    }
  }
}
