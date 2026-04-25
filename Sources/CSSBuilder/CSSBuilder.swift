import CSSOMBuilder

@resultBuilder
public struct CSSBuilder {
  public static func buildBlock(_ components: [CSSRule]...) -> [CSSRule] {
    var result = [CSSRule]()
    for component in components {
      result.append(contentsOf: component)
    }
    return result
  }

  public static func buildArray(_ components: [[CSSRule]]) -> [CSSRule] {
    components.flatMap { $0 }
  }

  public static func buildOptional(_ component: [CSSRule]?) -> [CSSRule] { component ?? [] }
  public static func buildEither(first component: [CSSRule]) -> [CSSRule] { component }
  public static func buildEither(second component: [CSSRule]) -> [CSSRule] { component }

  public static func render(@CSSBuilder _ content: () -> [CSSRule]) -> [CSSRule] {
    content()
  }

  public static func buildExpression(_ expression: CSSRule) -> [CSSRule] { [expression] }
  public static func buildExpression(_ expression: [CSSRule]) -> [CSSRule] { expression }
  public static func buildExpression(_ expression: ()) -> [CSSRule] { [] }

  @_disfavoredOverload
  public static func buildExpression(_ convertible: some CSSRuleConvertible) -> [CSSRule] {
    [convertible.render()]
  }

  public static func buildExpression(_ declaration: CSSDeclaration) -> [CSSRule] {
    [.styleDeclaration(property: declaration.property, value: declaration.value, isImportant: declaration.isImportant)]
  }

  public static func buildExpression(_ declarations: [CSSDeclaration]) -> [CSSRule] {
    declarations.map { .styleDeclaration(property: $0.property, value: $0.value, isImportant: $0.isImportant) }
  }

  public static func buildLimitedAvailability(_ component: [CSSRule]) -> [CSSRule] { component }

  /// The terminal builder call that returns the spec-compliant model.
  public static func render(@CSSBuilder _ content: () -> [CSSRule]) -> CSSRule {
    let items = content()
    return .fragment(items)
  }

  /// Explicit entry point for generating raw CSS strings.
  public static func build(@CSSBuilder _ content: () -> [CSSRule]) -> String {
    render(content).build()
  }
}

/// Explicit entry point for generating raw CSS strings.
public func buildCSS(@CSSBuilder _ content: () -> [CSSRule]) -> String {
  CSSBuilder.build(content)
}
