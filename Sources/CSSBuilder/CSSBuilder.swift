import CSSOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

/// User-facing CSS result builder. Mirrors @HTMLBuilder.
/// Collects [Node] and resolves to either CSSOM.CSSStyleDeclaration (declaration
/// context) or [CSSOM.CSSRule] (rule-list context) via buildFinalResult overloads.
@resultBuilder
public struct CSSBuilder {
  /// Accumulator type. Enum is required because Embedded Swift (WASI) forbids
  /// existential types (any Protocol) and dynamic casting (as?).
  public enum Node {
    case property(CSS.Property)
    case rule(CSSOM.CSSRule)
  }

  public static func buildBlock(_ components: [Node]...) -> [Node] {
    components.flatMap { $0 }
  }

  public static func buildExpression(_ prop: CSS.Property) -> [Node] { [.property(prop)] }
  public static func buildExpression(_ rule: CSSOM.CSSRule) -> [Node] {
    if let styleRule = rule as? CSSOM.CSSStyleRule, stringIsEmpty(styleRule.selectorText) {
      var nodes: [Node] = []
      styleRule.style.forEach { prop, val, priority in
        nodes.append(.property(CSS.Property(prop, val, isImportant: stringEquals(priority, "important"))))
      }
      return nodes
    }
    return [.rule(rule)]
  }

  public static func buildExpression(_ rules: [CSSOM.CSSRule]) -> [Node] {
    var nodes: [Node] = []
    for rule in rules {
      if let styleRule = rule as? CSSOM.CSSStyleRule, stringIsEmpty(styleRule.selectorText) {
        styleRule.style.forEach { prop, val, priority in
          nodes.append(.property(CSS.Property(prop, val, isImportant: stringEquals(priority, "important"))))
        }
      } else {
        nodes.append(.rule(rule))
      }
    }
    return nodes
  }

  public static func buildExpression(_ decl: CSSOM.CSSStyleDeclaration) -> [Node] {
    var nodes: [Node] = []
    decl.forEach { prop, val, priority in
      nodes.append(.property(CSS.Property(prop, val, isImportant: stringEquals(priority, "important"))))
    }
    return nodes
  }

  public static func buildOptional(_ c: [Node]?) -> [Node] { c ?? [] }
  public static func buildEither(first c: [Node]) -> [Node] { c }
  public static func buildEither(second c: [Node]) -> [Node] { c }
  public static func buildArray(_ c: [[Node]]) -> [Node] { c.flatMap { $0 } }
  public static func buildLimitedAvailability(_ c: [Node]) -> [Node] { c }

  /// Declaration context — e.g. inside selector(), inline style() attribute.
  public static func buildFinalResult(_ nodes: [Node]) -> CSSOM.CSSStyleDeclaration {
    let decl = CSSOM.CSSStyleDeclaration()
    for node in nodes {
      switch node {
      case .property(let p): decl.set(p)
      case .rule(let r): decl.nestedRules.append(r)
      }
    }
    return decl
  }

  /// Rule-list context — e.g. component CSS helpers, top-level stylesheet.
  /// CSS.Property nodes are wrapped in an empty-selector CSSStyleRule (sentinel for
  /// processStyleBlock to extract as inline style="..." declarations).
  public static func buildFinalResult(_ nodes: [Node]) -> [CSSOM.CSSRule] {
    var result: [CSSOM.CSSRule] = []
    let inlineDecl = CSSOM.CSSStyleDeclaration()
    for node in nodes {
      switch node {
      case .property(let p): inlineDecl.set(p)
      case .rule(let r): result.append(r)
      }
    }
    if inlineDecl.length > 0 {
      result.insert(CSSOM.CSSStyleRule("", style: inlineDecl), at: 0)
    }
    return result
  }

  public static func render(@CSSBuilder _ content: () -> [CSSOM.CSSRule]) -> String {
    let rules = content()
    var result = ""
    for rule in rules {
      let text = rule.cssText
      if !stringIsEmpty(text) { result = "\(result)\(text)\n" }
    }
    return result
  }
}

public func renderCSS(@CSSBuilder _ content: () -> [CSSOM.CSSRule]) -> String {
  CSSBuilder.render(content)
}
