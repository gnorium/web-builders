import CSSOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

public func media(_ condition: String, @CSSBuilder _ content: () -> [CSSOM.CSSRule]) -> CSSOM.CSSMediaRule {
  CSSOM.CSSMediaRule(condition, rules: content())
}

public func media(_ c1: String, _ c2: String, @CSSBuilder _ content: () -> [CSSOM.CSSRule]) -> CSSOM.CSSMediaRule {
  CSSOM.CSSMediaRule("\(c1) and \(c2)", rules: content())
}

public func minWidth(_ value: String) -> String { "(min-width: \(value))" }
public func minWidth(_ value: CSS.Length) -> String { "(min-width: \(value.value))" }
public func maxWidth(_ value: String) -> String { "(max-width: \(value))" }
public func maxWidth(_ value: CSS.Length) -> String { "(max-width: \(value.value))" }
public func minHeight(_ value: String) -> String { "(min-height: \(value))" }
public func maxHeight(_ value: String) -> String { "(max-height: \(value))" }
public func prefersColorScheme(_ scheme: CSS.PrefersColorScheme) -> String {
  "(prefers-color-scheme: \(scheme.rawValue))"
}
public func prefersContrast(_ value: CSS.PrefersContrast) -> String {
  "(prefers-contrast: \(value.rawValue))"
}
public func prefersReducedMotion(_ value: CSS.PrefersReducedMotion) -> String {
  "(prefers-reduced-motion: \(value.rawValue))"
}
