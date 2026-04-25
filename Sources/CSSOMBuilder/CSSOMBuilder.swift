import WebTypes

/// The shared core result builder for CSSOM content.
/// Mirrors DOMBuilder to provide a buildable model before serialization.
@resultBuilder
public struct CSSOMBuilder {
  public static func buildBlock(_ components: [CSSRule]...) -> [CSSRule] {
    components.flatMap { $0 }
  }

  public static func buildExpression(_ rule: CSSRule) -> [CSSRule] {
    [rule]
  }

  public static func buildExpression(_ rules: [CSSRule]) -> [CSSRule] {
    rules
  }

  @_disfavoredOverload
  public static func buildExpression(_ convertible: some CSSRuleConvertible) -> [CSSRule] {
    [convertible.render()]
  }

  public static func buildOptional(_ component: [CSSRule]?) -> [CSSRule] {
    component ?? []
  }

  public static func buildEither(first component: [CSSRule]) -> [CSSRule] {
    component
  }

  public static func buildEither(second component: [CSSRule]) -> [CSSRule] {
    component
  }

  public static func buildArray(_ components: [[CSSRule]]) -> [CSSRule] {
    components.flatMap { $0 }
  }

  public static func buildLimitedAvailability(_ component: [CSSRule]) -> [CSSRule] {
    component
  }

  public static func buildFinalResult(_ components: [CSSRule]) -> [CSSRule] {
    components
  }

  public static func buildFinalResult(_ components: [CSSRule]) -> CSSRule {
    if components.count == 1 { return components[0] }
    return .fragment(components)
  }
}
