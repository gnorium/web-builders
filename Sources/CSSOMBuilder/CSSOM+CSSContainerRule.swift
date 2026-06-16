import EmbeddedSwiftUtilities
import WebTypes

/// https://drafts.csswg.org/css-contain-3/#the-csscontainerrule-interface
extension CSSOM {
  public final class CSSContainerRule: CSSOM.CSSGroupingRule, @unchecked Sendable {
    public let conditionText: String

    public init(_ conditionText: String, rules: [CSSOM.CSSRule] = []) {
      self.conditionText = conditionText
      super.init()
      for rule in rules { self.cssRules.append(rule) }
    }

    public override var type: UInt16 { 4 }

    public override var cssText: String {
      let items = cssRules.items
      if items.isEmpty { return "" }
      var parts: [String] = []
      for rule in items {
        let text = rule.cssText
        if !stringIsEmpty(text) {
          parts.append(CSSOM.indentLines(text))
        }
      }
      if parts.isEmpty { return "" }
      return "@container \(conditionText) {\n\(stringJoin(parts, separator: "\n\n"))\n}"
    }
  }
}
