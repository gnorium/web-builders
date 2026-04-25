import CSSOMBuilder
import WebTypes

#if CLIENT
  import EmbeddedSwiftUtilities
#endif

public struct CSSMediaRule: CSSContent {
  public let condition: String
  public var rules: [CSSRule]

  public init(_ condition: String, @CSSOMBuilder _ content: () -> [CSSRule]) {
    self.condition = condition
    self.rules = content()
  }

  public func render() -> CSSRule {
    .mediaRule(condition: condition, rules: rules)
  }

  public var cssRuleType: CSSRuleType { .mediaRule }

  public static func minWidth(_ value: String) -> String {
    "(min-width: \(value))"
  }

  public static func maxWidth(_ value: String) -> String {
    "(max-width: \(value))"
  }

  public static func minHeight(_ value: String) -> String {
    "(min-height: \(value))"
  }

  public static func maxHeight(_ value: String) -> String {
    "(max-height: \(value))"
  }

  public static func prefersColorScheme(_ scheme: CSSPrefersColorScheme) -> String {
    "(prefers-color-scheme: \(scheme.rawValue))"
  }

  public static func prefersContrast(_ value: CSSPrefersContrast) -> String {
    "(prefers-contrast: \(value.rawValue))"
  }

  public static func prefersReducedMotion(_ value: CSSPrefersReducedMotion) -> String {
    "(prefers-reduced-motion: \(value.rawValue))"
  }
}

public func media(_ condition: String, @CSSOMBuilder _ content: () -> [CSSRule]) -> CSSMediaRule {
  CSSMediaRule(condition, content)
}

public func media(
  _ condition1: String, _ condition2: String, @CSSOMBuilder _ content: () -> [CSSRule]
) -> CSSMediaRule {
  CSSMediaRule("\(condition1) and \(condition2)", content)
}

public func minWidth(_ value: String) -> String {
  CSSMediaRule.minWidth(value)
}

public func minWidth(_ value: Length) -> String {
  CSSMediaRule.minWidth(value.value)
}

public func maxWidth(_ value: Length) -> String {
  CSSMediaRule.maxWidth(value.value)
}

public func maxWidth(_ value: String) -> String {
  CSSMediaRule.maxWidth(value)
}

public func minHeight(_ value: String) -> String {
  CSSMediaRule.minHeight(value)
}

public func maxHeight(_ value: String) -> String {
  CSSMediaRule.maxHeight(value)
}

public func prefersReducedMotion(_ value: CSSPrefersReducedMotion) -> String {
  CSSMediaRule.prefersReducedMotion(value)
}

public func prefersColorScheme(_ scheme: CSSPrefersColorScheme) -> String {
  CSSMediaRule.prefersColorScheme(scheme)
}

public func prefersContrast(_ value: CSSPrefersContrast) -> String {
  CSSMediaRule.prefersContrast(value)
}
