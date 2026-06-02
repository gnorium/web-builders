import WebTypes

/// Result builder for CSSOM rule lists.
/// Mirrors @DOMBuilder — low-level, accepts CSSOM.CSSRule instances.
@resultBuilder
public struct CSSOMBuilder {
  public static func buildBlock(_ components: [CSSOM.CSSRule]...) -> [CSSOM.CSSRule] {
    components.flatMap { $0 }
  }
  public static func buildExpression(_ rule: CSSOM.CSSRule) -> [CSSOM.CSSRule] { [rule] }
  public static func buildExpression(_ rules: [CSSOM.CSSRule]) -> [CSSOM.CSSRule] { rules }
  public static func buildOptional(_ c: [CSSOM.CSSRule]?) -> [CSSOM.CSSRule] { c ?? [] }
  public static func buildEither(first c: [CSSOM.CSSRule]) -> [CSSOM.CSSRule] { c }
  public static func buildEither(second c: [CSSOM.CSSRule]) -> [CSSOM.CSSRule] { c }
  public static func buildArray(_ c: [[CSSOM.CSSRule]]) -> [CSSOM.CSSRule] { c.flatMap { $0 } }
  public static func buildLimitedAvailability(_ c: [CSSOM.CSSRule]) -> [CSSOM.CSSRule] { c }
  public static func buildFinalResult(_ c: [CSSOM.CSSRule]) -> [CSSOM.CSSRule] { c }
}
