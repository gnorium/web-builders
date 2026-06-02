import WebTypes

/// https://drafts.csswg.org/cssom/#the-cssrulelist-interface
extension CSSOM {
  public final class CSSRuleList: @unchecked Sendable {
    private var rules: [CSSOM.CSSRule] = []

    public init() {}
    public init(_ rules: [CSSOM.CSSRule]) { self.rules = rules }

    public var length: Int { rules.count }

    public subscript(_ index: Int) -> CSSOM.CSSRule? {
      guard index >= 0 && index < rules.count else { return nil }
      return rules[index]
    }

    public func insert(_ rule: CSSOM.CSSRule, at index: Int) {
      rules.insert(rule, at: index)
    }

    public func delete(at index: Int) {
      guard index >= 0 && index < rules.count else { return }
      rules.remove(at: index)
    }

    public func append(_ rule: CSSOM.CSSRule) {
      rules.append(rule)
    }

    public var items: [CSSOM.CSSRule] { rules }
  }
}
