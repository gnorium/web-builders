import EmbeddedSwiftUtilities
import WebTypes

/// https://drafts.csswg.org/css-animations/#interface-csskeyframesrule
extension CSSOM {
  public final class CSSKeyframesRule: CSSOM.CSSRule, @unchecked Sendable {
    public var name: String
    public let cssRules: CSSOM.CSSRuleList

    public init(_ name: String, rules: [CSSOM.CSSRule] = []) {
      self.name = name
      self.cssRules = CSSOM.CSSRuleList(rules)
    }

    public override var type: UInt16 { 7 }

    public override var cssText: String {
      let items = cssRules.items
      if items.isEmpty { return "" }
      var body = ""
      for rule in items {
        body = "\(body)\(rule.cssText)\n"
      }
      return "@keyframes \(name) {\n\(body)}"
    }

    public func appendRule(_ rule: CSSOM.CSSKeyframeRule) {
      cssRules.append(rule)
    }
  }
}

public func keyframes(_ name: String, @CSSOMBuilder _ content: () -> [CSSOM.CSSRule]) -> CSSOM.CSSKeyframesRule {
  CSSOM.CSSKeyframesRule(name, rules: content())
}
