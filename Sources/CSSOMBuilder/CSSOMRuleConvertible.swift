import WebTypes

/// Protocol for types that can produce a CSSOM.CSSRule for inclusion in rule lists.
public protocol CSSOMRuleConvertible: Sendable {
  func toCSSRule() -> CSSOM.CSSRule
}
