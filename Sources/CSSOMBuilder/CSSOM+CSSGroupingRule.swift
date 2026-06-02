import WebTypes

/// https://drafts.csswg.org/cssom/#the-cssgroupingrule-interface
extension CSSOM {
  open class CSSGroupingRule: CSSOM.CSSRule, @unchecked Sendable {
    public let cssRules: CSSOM.CSSRuleList = CSSOM.CSSRuleList()

    public func insertRule(_ rule: CSSOM.CSSRule, index: Int) {
      cssRules.insert(rule, at: index)
    }

    public func deleteRule(_ index: Int) {
      cssRules.delete(at: index)
    }
  }
}
