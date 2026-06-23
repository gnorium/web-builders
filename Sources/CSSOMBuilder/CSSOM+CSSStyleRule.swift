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
    public func renderFlattened(prefix: String) -> String {
      let full: String
      if stringIsEmpty(prefix) {
        full = selectorText
      } else if stringStartsWith(selectorText, prefix) {
        full = selectorText
      } else {
        full = CSSOM.joinSelectors(prefix, selectorText)
      }
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
      return stringJoin(parts, separator: "\n\n")
    }
  }

  /// Joins a parent selector with a child selector. `&` in the child is substituted
  /// with the parent selector itself (CSS nesting semantics — `&` can stand anywhere
  /// in the child, e.g. `&[data-x]`, `&:hover`, `.foo &`). If the child carries some
  /// other combinator/pseudo/attribute prefix (space, `>`, `+`, `~`, `:`, `[`), it is
  /// concatenated directly; otherwise a descendant combinator (space) is inserted.
  public static func joinSelectors(_ parent: String, _ child: String) -> String {
    if stringIsEmpty(parent) { return child }
    if stringIsEmpty(child) { return parent }

    let parents = stringSplit(parent, separator: ",")
    let children = stringSplit(child, separator: ",")

    if parents.count <= 1 && children.count <= 1 {
      let trimmedParent = stringTrim(parent)
      let trimmedChild = stringTrim(child)
      if stringContains(trimmedChild, "&") {
        return stringReplace(trimmedChild, "&", trimmedParent)
      }
      if stringStartsWith(trimmedChild, " ") || stringStartsWith(trimmedChild, ":")
        || stringStartsWith(trimmedChild, ">") || stringStartsWith(trimmedChild, "+")
        || stringStartsWith(trimmedChild, "~") || stringStartsWith(trimmedChild, "[")
      {
        return "\(trimmedParent)\(trimmedChild)"
      }
      return "\(trimmedParent) \(trimmedChild)"
    }

    var result: [String] = []
    for p in parents {
      let trimmedP = stringTrim(p)
      if stringIsEmpty(trimmedP) { continue }
      for c in children {
        let trimmedC = stringTrim(c)
        if stringIsEmpty(trimmedC) { continue }
        result.append(joinSelectors(trimmedP, trimmedC))
      }
    }
    return stringJoin(result, separator: ", ")
  }
}

public func selector(_ sel: String, @CSSOMBuilder _ rules: () -> [CSSOM.CSSRule]) -> CSSOM.CSSStyleRule {
  CSSOM.CSSStyleRule(sel, nestedRules: rules())
}
