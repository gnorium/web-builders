import CSSOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

private func smartJoiner(_ selector: String, joiner: String) -> String {
  if stringStartsWith(selector, "[") || stringStartsWith(selector, ":") {
    return selector
  }
  return "\(joiner)\(selector)"
}

public struct CSSStyleRule: CSSContent {
  public let selector: String
  public var declarations: [CSSRule]
  public var nestedRules: [CSSRule]

  public init(_ selector: String, @CSSOMBuilder _ content: () -> [CSSRule] = { [] }) {
    self.selector = selector
    let allContent = content()
    var decs: [CSSRule] = []
    var rules: [CSSRule] = []
    for item in allContent {
      if case .styleDeclaration = item {
        decs.append(item)
      } else {
        rules.append(item)
      }
    }
    self.declarations = decs
    self.nestedRules = rules
  }

  public func render() -> CSSRule {
    .styleRule(selector: selector, style: declarations + nestedRules)
  }

  public var cssRuleType: CSSRuleType { .styleRule }

  public func style(_ property: String, _ value: String) -> CSSStyleRule {
    var copy = self
    copy.declarations.append(.styleDeclaration(property: property, value: value))
    return copy
  }
}

// MARK: - Selector Overloads (String)
// @_disfavoredOverload is used to prioritize TagName overloads when enums are passed.
// smartJoiner ensuring leading space for descendant matching when nested.

public func selector(_ selector: String, @CSSOMBuilder _ content: () -> [CSSRule]) -> CSSStyleRule {
  CSSStyleRule(selector, content)
}

@_disfavoredOverload
public func selector(_ s1: String, _ s2: String, @CSSOMBuilder _ content: () -> [CSSRule])
  -> CSSStyleRule
{
  CSSStyleRule("\(smartJoiner(s1, joiner: " ")),\(smartJoiner(s2, joiner: " "))", content)
}

@_disfavoredOverload
public func selector(
  _ s1: String, _ s2: String, _ s3: String, @CSSOMBuilder _ content: () -> [CSSRule]
) -> CSSStyleRule {
  CSSStyleRule(
    "\(smartJoiner(s1, joiner: " ")),\(smartJoiner(s2, joiner: " ")),\(smartJoiner(s3, joiner: " "))",
    content)
}

@_disfavoredOverload
public func selector(
  _ s1: String, _ s2: String, _ s3: String, _ s4: String, @CSSOMBuilder _ content: () -> [CSSRule]
) -> CSSStyleRule {
  CSSStyleRule(
    "\(smartJoiner(s1, joiner: " ")),\(smartJoiner(s2, joiner: " ")),\(smartJoiner(s3, joiner: " ")),\(smartJoiner(s4, joiner: " "))",
    content)
}

@_disfavoredOverload
public func selector(
  _ s1: String, _ s2: String, _ s3: String, _ s4: String, _ s5: String,
  @CSSOMBuilder _ content: () -> [CSSRule]
) -> CSSStyleRule {
  CSSStyleRule(
    "\(smartJoiner(s1, joiner: " ")),\(smartJoiner(s2, joiner: " ")),\(smartJoiner(s3, joiner: " ")),\(smartJoiner(s4, joiner: " ")),\(smartJoiner(s5, joiner: " "))",
    content)
}

@_disfavoredOverload
public func selector(
  _ s1: String, _ s2: String, _ s3: String, _ s4: String, _ s5: String, _ s6: String,
  @CSSOMBuilder _ content: () -> [CSSRule]
) -> CSSStyleRule {
  CSSStyleRule(
    "\(smartJoiner(s1, joiner: " ")),\(smartJoiner(s2, joiner: " ")),\(smartJoiner(s3, joiner: " ")),\(smartJoiner(s4, joiner: " ")),\(smartJoiner(s5, joiner: " ")),\(smartJoiner(s6, joiner: " "))",
    content)
}

@_disfavoredOverload
public func selector(
  _ s1: String, _ s2: String, _ s3: String, _ s4: String, _ s5: String, _ s6: String, _ s7: String,
  @CSSOMBuilder _ content: () -> [CSSRule]
) -> CSSStyleRule {
  CSSStyleRule(
    "\(smartJoiner(s1, joiner: " ")),\(smartJoiner(s2, joiner: " ")),\(smartJoiner(s3, joiner: " ")),\(smartJoiner(s4, joiner: " ")),\(smartJoiner(s5, joiner: " ")),\(smartJoiner(s6, joiner: " ")),\(smartJoiner(s7, joiner: " "))",
    content)
}

@_disfavoredOverload
public func selector(
  _ s1: String, _ s2: String, _ s3: String, _ s4: String, _ s5: String, _ s6: String, _ s7: String,
  _ s8: String, @CSSOMBuilder _ content: () -> [CSSRule]
) -> CSSStyleRule {
  CSSStyleRule(
    "\(smartJoiner(s1, joiner: " ")),\(smartJoiner(s2, joiner: " ")),\(smartJoiner(s3, joiner: " ")),\(smartJoiner(s4, joiner: " ")),\(smartJoiner(s5, joiner: " ")),\(smartJoiner(s6, joiner: " ")),\(smartJoiner(s7, joiner: " ")),\(smartJoiner(s8, joiner: " "))",
    content)
}

@_disfavoredOverload
public func selector(
  _ s1: String, _ s2: String, _ s3: String, _ s4: String, _ s5: String, _ s6: String, _ s7: String,
  _ s8: String, _ s9: String, @CSSOMBuilder _ content: () -> [CSSRule]
) -> CSSStyleRule {
  CSSStyleRule(
    "\(smartJoiner(s1, joiner: " ")),\(smartJoiner(s2, joiner: " ")),\(smartJoiner(s3, joiner: " ")),\(smartJoiner(s4, joiner: " ")),\(smartJoiner(s5, joiner: " ")),\(smartJoiner(s6, joiner: " ")),\(smartJoiner(s7, joiner: " ")),\(smartJoiner(s8, joiner: " ")),\(smartJoiner(s9, joiner: " "))",
    content)
}

@_disfavoredOverload
public func selector(
  _ s1: String, _ s2: String, _ s3: String, _ s4: String, _ s5: String, _ s6: String, _ s7: String,
  _ s8: String, _ s9: String, _ s10: String, @CSSOMBuilder _ content: () -> [CSSRule]
) -> CSSStyleRule {
  CSSStyleRule(
    "\(smartJoiner(s1, joiner: " ")),\(smartJoiner(s2, joiner: " ")),\(smartJoiner(s3, joiner: " ")),\(smartJoiner(s4, joiner: " ")),\(smartJoiner(s5, joiner: " ")),\(smartJoiner(s6, joiner: " ")),\(smartJoiner(s7, joiner: " ")),\(smartJoiner(s8, joiner: " ")),\(smartJoiner(s9, joiner: " ")),\(smartJoiner(s10, joiner: " "))",
    content)
}

// MARK: - Selector Overloads (TagName)

@_disfavoredOverload
public func selector(_ t1: TagName, _ t2: TagName, @CSSOMBuilder _ content: () -> [CSSRule])
  -> CSSStyleRule
{
  CSSStyleRule("\(t1.value), \(t2.value)", content)
}

@_disfavoredOverload
public func selector(
  _ t1: TagName, _ t2: TagName, _ t3: TagName, @CSSOMBuilder _ content: () -> [CSSRule]
) -> CSSStyleRule {
  CSSStyleRule("\(t1.value), \(t2.value), \(t3.value)", content)
}

@_disfavoredOverload
public func selector(
  _ t1: TagName, _ t2: TagName, _ t3: TagName, _ t4: TagName,
  @CSSOMBuilder _ content: () -> [CSSRule]
) -> CSSStyleRule {
  CSSStyleRule("\(t1.value), \(t2.value), \(t3.value), \(t4.value)", content)
}

@_disfavoredOverload
public func selector(
  _ t1: TagName, _ t2: TagName, _ t3: TagName, _ t4: TagName, _ t5: TagName,
  @CSSOMBuilder _ content: () -> [CSSRule]
) -> CSSStyleRule {
  CSSStyleRule("\(t1.value), \(t2.value), \(t3.value), \(t4.value), \(t5.value)", content)
}

@_disfavoredOverload
public func selector(
  _ t1: TagName, _ t2: TagName, _ t3: TagName, _ t4: TagName, _ t5: TagName, _ t6: TagName,
  @CSSOMBuilder _ content: () -> [CSSRule]
) -> CSSStyleRule {
  CSSStyleRule(
    "\(t1.value), \(t2.value), \(t3.value), \(t4.value), \(t5.value), \(t6.value)", content)
}

@_disfavoredOverload
public func selector(
  _ t1: TagName, _ t2: TagName, _ t3: TagName, _ t4: TagName, _ t5: TagName, _ t6: TagName,
  _ t7: TagName, @CSSOMBuilder _ content: () -> [CSSRule]
) -> CSSStyleRule {
  CSSStyleRule(
    "\(t1.value), \(t2.value), \(t3.value), \(t4.value), \(t5.value), \(t6.value), \(t7.value)",
    content)
}

@_disfavoredOverload
public func selector(
  _ t1: TagName, _ t2: TagName, _ t3: TagName, _ t4: TagName, _ t5: TagName, _ t6: TagName,
  _ t7: TagName, _ t8: TagName, @CSSOMBuilder _ content: () -> [CSSRule]
) -> CSSStyleRule {
  CSSStyleRule(
    "\(t1.value), \(t2.value), \(t3.value), \(t4.value), \(t5.value), \(t6.value), \(t7.value), \(t8.value)",
    content)
}

@_disfavoredOverload
public func selector(
  _ t1: TagName, _ t2: TagName, _ t3: TagName, _ t4: TagName, _ t5: TagName, _ t6: TagName,
  _ t7: TagName, _ t8: TagName, _ t9: TagName, @CSSOMBuilder _ content: () -> [CSSRule]
) -> CSSStyleRule {
  CSSStyleRule(
    "\(t1.value), \(t2.value), \(t3.value), \(t4.value), \(t5.value), \(t6.value), \(t7.value), \(t8.value), \(t9.value)",
    content)
}

@_disfavoredOverload
public func selector(
  _ t1: TagName, _ t2: TagName, _ t3: TagName, _ t4: TagName, _ t5: TagName, _ t6: TagName,
  _ t7: TagName, _ t8: TagName, _ t9: TagName, _ t10: TagName,
  @CSSOMBuilder _ content: () -> [CSSRule]
) -> CSSStyleRule {
  CSSStyleRule(
    "\(t1.value), \(t2.value), \(t3.value), \(t4.value), \(t5.value), \(t6.value), \(t7.value), \(t8.value), \(t9.value), \(t10.value)",
    content)
}

@available(*, deprecated, renamed: "CSSStyleRule")
public func ruleset(_ selector: String, @CSSOMBuilder _ content: () -> [CSSRule] = { [] })
  -> CSSStyleRule
{
  CSSStyleRule(selector, content)
}

/// Attribute selector - returns a string like [attribute] or [attribute="value"]
/// Example: attribute("open") -> "[open]"
/// Example: attribute("type", "text") -> "[type=\"text\"]"
public func attribute(_ name: String) -> String {
  "[\(name)]"
}

public func attribute(_ name: String, _ value: String) -> String {
  "[\(name)=\"\(value)\"]"
}

public func attribute(_ name: HTMLAttributeName, _ value: Bool) -> String {
  "[\(name.rawValue)=\"\(value ? "true" : "false")\"]"
}

public func attribute(_ name: HTMLAttributeName, _ value: String) -> String {
  "[\(name.rawValue)=\"\(value)\"]"
}

public func attribute(_ name: String, _ value: CSSColorScheme) -> String {
  "[\(name)=\"\(value.rawValue)\"]"
}

/// Attribute selector with content - creates a scoped CSSContent ruleset
/// Example: attribute("[aria-pressed=\"true\"]") { ... }
public func attribute(_ selector: String, @CSSOMBuilder _ content: () -> [CSSRule]) -> CSSStyleRule
{
  CSSStyleRule(selector, content)
}

/// Attribute selector combined with pseudo-class
/// Example: attribute(ariaPressed(true), .hover) { ... }
public func attribute(
  _ selector: String, _ pseudoClass: CSSPseudoClass, @CSSOMBuilder _ content: () -> [CSSRule]
) -> CSSStyleRule {
  CSSStyleRule("[\(selector)]\(pseudoClass.rawValue)", content)
}

/// Attribute selector combined with pseudo-class
/// Example: attribute(ariaPressed(true), .hover) { ... }
public func attribute(
  _ pseudoClass: CSSPseudoClass, _ selector: String, @CSSOMBuilder _ content: () -> [CSSRule]
) -> CSSStyleRule {
  CSSStyleRule("[\(selector)]\(pseudoClass.rawValue)", content)
}

/// Attribute selector with just a pseudo-class (for simple attributes like [disabled])
/// Example: attribute(.disabled) { ... }
public func attribute(_ pseudoClass: CSSPseudoClass, @CSSOMBuilder _ content: () -> [CSSRule])
  -> CSSStyleRule
{
  CSSStyleRule(pseudoClass.rawValue, content)
}

/// Attribute selector with multiple pseudo-classes
/// Example: attribute(ariaPressed(false), .checked, .disabled) { ... }
public func attribute(
  _ selector: String, _ p1: CSSPseudoClass, _ p2: CSSPseudoClass,
  @CSSOMBuilder _ content: () -> [CSSRule]
) -> CSSStyleRule {
  CSSStyleRule("[\(selector)]\(p1.rawValue)\(p2.rawValue)", content)
}

/// Attribute selector with three pseudo-classes
/// Example: attribute(ariaPressed(false), .checked, .hover, .focus) { ... }
public func attribute(
  _ selector: String, _ p1: CSSPseudoClass, _ p2: CSSPseudoClass, _ p3: CSSPseudoClass,
  @CSSOMBuilder _ content: () -> [CSSRule]
) -> CSSStyleRule {
  CSSStyleRule("[\(selector)]\(p1.rawValue)\(p2.rawValue)\(p3.rawValue)", content)
}

/// Attribute selector with pseudo-class and string combinator (for not() expressions)
/// Example: attribute(ariaPressed(true), .hover, not(.disabled)) { ... }
public func attribute(
  _ selector: String, _ pseudoClass: CSSPseudoClass, _ combinator: String,
  @CSSOMBuilder _ content: () -> [CSSRule]
) -> CSSStyleRule {
  CSSStyleRule("[\(selector)]\(pseudoClass.rawValue)\(combinator)", content)
}

/// Attribute selector with pseudo-class and two string combinators
/// Example: attribute(ariaPressed(true), .hover, not(.disabled), not(.readonly)) { ... }
public func attribute(
  _ selector: String, _ pseudoClass: CSSPseudoClass, _ c1: String, _ c2: String,
  @CSSOMBuilder _ content: () -> [CSSRule]
) -> CSSStyleRule {
  CSSStyleRule("[\(selector)]\(pseudoClass.rawValue)\(c1)\(c2)", content)
}

/// Type-safe aria-pressed attribute selector for CSSContent
/// Returns the attribute name and value (without brackets) for use with attribute()
public func ariaPressed(_ value: Bool) -> String {
  "aria-pressed=\"\(value ? "true" : "false")\""
}

/// Descendant combinator (space) - Selects all elements that are descendants of a specified element
/// Example: descendant("p") targets all <p> descendants
public func descendant(_ selector: String, @CSSOMBuilder _ content: () -> [CSSRule]) -> CSSStyleRule
{
  CSSStyleRule(selector, content)
}

/// Descendant combinator with multiple selectors (chains them using spaces)
/// Example: descendant(".a", ".b") -> " .a .b" (or "[open] .b" if starts with [)
public func descendant(_ s1: String, _ s2: String, @CSSOMBuilder _ content: () -> [CSSRule])
  -> CSSStyleRule
{
  CSSStyleRule("\(smartJoiner(s1, joiner: " ")) \(s2)", content)
}

/// Descendant combinator with three selectors
public func descendant(
  _ s1: String, _ s2: String, _ s3: String, @CSSOMBuilder _ content: () -> [CSSRule]
) -> CSSStyleRule {
  CSSStyleRule("\(smartJoiner(s1, joiner: " ")) \(s2) \(s3)", content)
}

/// Descendant combinator with four selectors
public func descendant(
  _ s1: String, _ s2: String, _ s3: String, _ s4: String, @CSSOMBuilder _ content: () -> [CSSRule]
) -> CSSStyleRule {
  CSSStyleRule("\(smartJoiner(s1, joiner: " ")) \(s2) \(s3) \(s4)", content)
}

/// Descendant combinator with five selectors
public func descendant(
  _ s1: String, _ s2: String, _ s3: String, _ s4: String, _ s5: String,
  @CSSOMBuilder _ content: () -> [CSSRule]
) -> CSSStyleRule {
  CSSStyleRule("\(smartJoiner(s1, joiner: " ")) \(s2) \(s3) \(s4) \(s5)", content)
}

/// Descendant combinator with six selectors
public func descendant(
  _ s1: String, _ s2: String, _ s3: String, _ s4: String, _ s5: String, _ s6: String,
  @CSSOMBuilder _ content: () -> [CSSRule]
) -> CSSStyleRule {
  CSSStyleRule("\(smartJoiner(s1, joiner: " ")) \(s2) \(s3) \(s4) \(s5) \(s6)", content)
}

/// Descendant combinator with seven selectors
public func descendant(
  _ s1: String, _ s2: String, _ s3: String, _ s4: String, _ s5: String, _ s6: String, _ s7: String,
  @CSSOMBuilder _ content: () -> [CSSRule]
) -> CSSStyleRule {
  CSSStyleRule("\(smartJoiner(s1, joiner: " ")) \(s2) \(s3) \(s4) \(s5) \(s6) \(s7)", content)
}

/// Descendant combinator with eight selectors
public func descendant(
  _ s1: String, _ s2: String, _ s3: String, _ s4: String, _ s5: String, _ s6: String, _ s7: String,
  _ s8: String, @CSSOMBuilder _ content: () -> [CSSRule]
) -> CSSStyleRule {
  CSSStyleRule("\(smartJoiner(s1, joiner: " ")) \(s2) \(s3) \(s4) \(s5) \(s6) \(s7) \(s8)", content)
}

/// Descendant combinator with nine selectors
public func descendant(
  _ s1: String, _ s2: String, _ s3: String, _ s4: String, _ s5: String, _ s6: String, _ s7: String,
  _ s8: String, _ s9: String, @CSSOMBuilder _ content: () -> [CSSRule]
) -> CSSStyleRule {
  CSSStyleRule(
    "\(smartJoiner(s1, joiner: " ")) \(s2) \(s3) \(s4) \(s5) \(s6) \(s7) \(s8) \(s9)", content)
}

/// Descendant combinator with ten selectors
public func descendant(
  _ s1: String, _ s2: String, _ s3: String, _ s4: String, _ s5: String, _ s6: String, _ s7: String,
  _ s8: String, _ s9: String, _ s10: String, @CSSOMBuilder _ content: () -> [CSSRule]
) -> CSSStyleRule {
  CSSStyleRule(
    "\(smartJoiner(s1, joiner: " ")) \(s2) \(s3) \(s4) \(s5) \(s6) \(s7) \(s8) \(s9) \(s10)",
    content)
}

/// Child combinator (>) - Selects all elements that are direct children of a specified element
/// Example: child(".item") targets all direct children with class "item"
public func child(_ selector: String, @CSSOMBuilder _ content: () -> [CSSRule]) -> CSSStyleRule {
  CSSStyleRule(" > \(selector)", content)
}

/// Child combinator with multiple selectors (chains them using >)
/// Example: child(".a", ".b") -> " > .a > .b" (or "[open] > .b" if starts with [)
public func child(_ s1: String, _ s2: String, @CSSOMBuilder _ content: () -> [CSSRule])
  -> CSSStyleRule
{
  CSSStyleRule("\(smartJoiner(s1, joiner: " > ")) > \(s2)", content)
}

/// Child combinator with three selectors
public func child(
  _ s1: String, _ s2: String, _ s3: String, @CSSOMBuilder _ content: () -> [CSSRule]
) -> CSSStyleRule {
  CSSStyleRule("\(smartJoiner(s1, joiner: " > ")) > \(s2) > \(s3)", content)
}

/// Next sibling combinator (+) - Selects the element that is immediately after another specific element
/// Example: nextSibling(".icon") targets the next sibling with class "icon"
public func nextSibling(_ selector: String, @CSSOMBuilder _ content: () -> [CSSRule])
  -> CSSStyleRule
{
  CSSStyleRule(" + \(selector)", content)
}

/// Next sibling combinator with multiple selectors
/// Example: nextSibling(attribute("checked"), ".icon") -> "[checked] + .icon"
public func nextSibling(_ s1: String, _ s2: String, @CSSOMBuilder _ content: () -> [CSSRule])
  -> CSSStyleRule
{
  CSSStyleRule("\(smartJoiner(s1, joiner: " + ")) + \(s2)", content)
}

/// Next sibling combinator with three selectors
public func nextSibling(
  _ s1: String, _ s2: String, _ s3: String, @CSSOMBuilder _ content: () -> [CSSRule]
) -> CSSStyleRule {
  CSSStyleRule("\(smartJoiner(s1, joiner: " + ")) + \(s2) + \(s3)", content)
}

/// Subsequent sibling combinator (~) - Selects all elements that are next siblings of a specified element
/// Example: subsequentSibling(".item") targets all following siblings with class "item"
public func subsequentSibling(_ selector: String, @CSSOMBuilder _ content: () -> [CSSRule])
  -> CSSStyleRule
{
  CSSStyleRule(" ~ \(selector)", content)
}

/// Subsequent sibling combinator with multiple selectors
/// Example: subsequentSibling(attribute("disabled"), ".label") -> "[disabled] ~ .label"
public func subsequentSibling(_ s1: String, _ s2: String, @CSSOMBuilder _ content: () -> [CSSRule])
  -> CSSStyleRule
{
  CSSStyleRule("\(smartJoiner(s1, joiner: " ~ ")) ~ \(s2)", content)
}

/// Subsequent sibling combinator with three selectors
public func subsequentSibling(
  _ s1: String, _ s2: String, _ s3: String, @CSSOMBuilder _ content: () -> [CSSRule]
) -> CSSStyleRule {
  CSSStyleRule("\(smartJoiner(s1, joiner: " ~ ")) ~ \(s2) ~ \(s3)", content)
}
