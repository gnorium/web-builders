import EmbeddedSwiftUtilities
import WebTypes

/// https://drafts.csswg.org/cssom/#the-cssstylerule-interface
extension CSSOM {
  public final class CSSStyleRule: CSSOM.CSSRule, @unchecked Sendable {
    public var selectorText: String
    public let style: CSSOM.CSSStyleDeclaration
    public var nestedRules: [CSSOM.CSSRule]

    public init(
      _ selectorText: String,
      style: CSSOM.CSSStyleDeclaration = CSSOM.CSSStyleDeclaration(),
      nestedRules: [CSSOM.CSSRule] = []
    ) {
      self.selectorText = selectorText
      self.style = style
      // A declaration-context `@CSSBuilder` block stashes nested rules on the
      // declaration as a transient transport; move them onto the rule (where
      // they belong in CSSOM) and clear the declaration so it holds only
      // property declarations.
      self.nestedRules = nestedRules + style.nestedRules
      style.nestedRules = []
    }

    public override var type: UInt16 { 1 }

    public override var cssText: String {
      return renderFlattened(prefix: "")
    }

    /// Renders this rule and its nested rules as a sequence of flat rules, joining
    /// each nested rule's selector onto `prefix` (the resolved parent selector).
    /// E.g. `pseudoClass(.checked) { nextSibling(".checkbox-icon") { … } }` →
    /// `<prefix>:checked + .checkbox-icon { … }`.
    func renderFlattened(prefix: String) -> String {
      let full = CSSOM.joinSelectors(prefix, selectorText)
      // Build each flat rule as its own part and join with a single newline.
      // Crucially, no trailing newline per rule: an internal "\n\n" would be
      // split by HTMLGlobalStyle's dedup (which splits blocks on "\n\n"),
      // severing closing braces — breaking @media blocks.
      var parts: [String] = []
      let decls = style.renderLines(indent: 1)
      if !stringIsEmpty(decls) {
        parts.append("\(full) {\n\(decls)}")
      }
      for rule in nestedRules {
        if let styleRule = rule as? CSSOM.CSSStyleRule {
          let text = styleRule.renderFlattened(prefix: full)
          if !stringIsEmpty(text) { parts.append(text) }
        } else {
          let text = rule.cssText
          if !stringIsEmpty(text) { parts.append(text) }
        }
      }
      return stringJoin(parts, separator: "\n")
    }
  }

  /// Joins a parent selector with a child selector. If the child already carries a
  /// combinator/pseudo/attribute prefix (space, `>`, `+`, `~`, `:`, `[`, `&`), it is
  /// concatenated directly; otherwise a descendant combinator (space) is inserted.
  static func joinSelectors(_ parent: String, _ child: String) -> String {
    if stringIsEmpty(parent) { return child }
    if stringIsEmpty(child) { return parent }
    if stringStartsWith(child, " ") || stringStartsWith(child, ":")
      || stringStartsWith(child, ">") || stringStartsWith(child, "+")
      || stringStartsWith(child, "~") || stringStartsWith(child, "[")
      || stringStartsWith(child, "&")
    {
      return "\(parent)\(child)"
    }
    return "\(parent) \(child)"
  }
}

public func selector(_ sel: String, @CSSOMBuilder _ rules: () -> [CSSOM.CSSRule]) -> CSSOM.CSSStyleRule {
  CSSOM.CSSStyleRule(sel, nestedRules: rules())
}
