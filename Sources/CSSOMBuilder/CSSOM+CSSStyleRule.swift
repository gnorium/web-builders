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
      // severing closing braces—breaking @media blocks.
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
  /// with the parent selector itself (CSS nesting semantics—`&` can stand anywhere
  /// in the child, e.g. `&[data-x]`, `&:hover`, `.foo &`). If the child carries some
  /// other combinator/pseudo/attribute prefix (space, `>`, `+`, `~`, `:`, `[`), it is
  /// concatenated directly; otherwise a descendant combinator (space) is inserted.
  public static func joinSelectors(_ parent: String, _ child: String) -> String {
    if stringIsEmpty(stringTrim(parent)) {
      if stringContains(child, "&") { return stringTrim(stringReplace(child, "&", "")) }
      return child
    }
    if stringIsEmpty(child) { return parent }

    let parents = splitSelectorList(parent)
    let children = splitSelectorList(child)

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

  /// Splits a selector list on its top-level commas only: a comma inside
  /// `:is(…)`, `:where(…)`, `:not(…)`, `:has(…)`, an attribute selector or a
  /// quoted string belongs to that one selector, and splitting there would
  /// scope the inner list's later items as if they were selectors of their own.
  public static func splitSelectorList(_ list: String) -> [String] {
    let bytes = Array(list.utf8)
    var results: [String] = []
    var depth = 0
    var quote: UInt8 = 0
    var start = 0
    var i = 0
    while i < bytes.count {
      let byte = bytes[i]
      if quote != 0 {
        if byte == 0x5C { i += 2; continue }  // backslash escape
        if byte == quote { quote = 0 }
      } else if byte == 0x22 || byte == 0x27 {  // " '
        quote = byte
      } else if byte == 0x28 || byte == 0x5B {  // ( [
        depth += 1
      } else if (byte == 0x29 || byte == 0x5D) && depth > 0 {  // ) ]
        depth -= 1
      } else if byte == 0x2C && depth == 0 {  // ,
        results.append(String(decoding: bytes[start..<i], as: UTF8.self))
        start = i + 1
      }
      i += 1
    }
    results.append(String(decoding: bytes[start..<bytes.count], as: UTF8.self))
    return results
  }
}

/// Low-level rule-list variant. The declaration-oriented `@CSSBuilder`
/// overload is the preferred public DSL when both builders are imported.
@_disfavoredOverload
public func selector(_ sel: String, @CSSOMBuilder _ rules: () -> [CSSOM.CSSRule]) -> CSSOM.CSSStyleRule {
  CSSOM.CSSStyleRule(sel, nestedRules: rules())
}
