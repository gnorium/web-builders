import EmbeddedSwiftUtilities
import WebTypes

/// https://drafts.csswg.org/cssom/#the-cssmediarule-interface
extension CSSOM {
  public final class CSSMediaRule: CSSOM.CSSGroupingRule, @unchecked Sendable {
    public let media: CSSOM.MediaList
    public let conditionText: String

    public init(_ conditionText: String, rules: [CSSOM.CSSRule] = []) {
      self.conditionText = conditionText
      self.media = CSSOM.MediaList(conditionText)
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
      return "@media \(conditionText) {\n\(stringJoin(parts, separator: "\n\n"))\n}"
    }

  }

  /// Indents every non-empty line of `text` by two spaces (used to nest rules
  /// inside grouping rules like `@media`). Preserves the no-trailing-newline
  /// contract so the dedup split on "\n\n" stays intact.
  static func indentLines(_ text: String) -> String {
    var result = ""
    for line in stringSplit(text, separator: "\n") {
      let rendered = stringIsEmpty(line) ? "" : "  \(line)"
      result = stringIsEmpty(result) ? rendered : "\(result)\n\(rendered)"
    }
    return result
  }
}
