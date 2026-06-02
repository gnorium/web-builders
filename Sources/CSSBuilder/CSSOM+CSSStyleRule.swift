import CSSOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

private func smartJoiner(_ selector: String, joiner: String) -> String {
  if stringStartsWith(selector, "[") || stringStartsWith(selector, ":") { return selector }
  return "\(joiner)\(selector)"
}

// MARK: - Selector Overloads (String)

public func selector(_ sel: String, @CSSBuilder _ content: () -> CSSOM.CSSStyleDeclaration) -> CSSOM.CSSStyleRule {
  CSSOM.CSSStyleRule(sel, style: content())
}

@_disfavoredOverload
public func selector(_ s1: String, _ s2: String, @CSSBuilder _ content: () -> CSSOM.CSSStyleDeclaration) -> CSSOM.CSSStyleRule {
  CSSOM.CSSStyleRule("\(smartJoiner(s1, joiner: " ")),\(smartJoiner(s2, joiner: " "))", style: content())
}

@_disfavoredOverload
public func selector(_ s1: String, _ s2: String, _ s3: String, @CSSBuilder _ content: () -> CSSOM.CSSStyleDeclaration) -> CSSOM.CSSStyleRule {
  CSSOM.CSSStyleRule("\(smartJoiner(s1, joiner: " ")),\(smartJoiner(s2, joiner: " ")),\(smartJoiner(s3, joiner: " "))", style: content())
}

@_disfavoredOverload
public func selector(_ s1: String, _ s2: String, _ s3: String, _ s4: String, @CSSBuilder _ content: () -> CSSOM.CSSStyleDeclaration) -> CSSOM.CSSStyleRule {
  CSSOM.CSSStyleRule("\(smartJoiner(s1, joiner: " ")),\(smartJoiner(s2, joiner: " ")),\(smartJoiner(s3, joiner: " ")),\(smartJoiner(s4, joiner: " "))", style: content())
}

@_disfavoredOverload
public func selector(_ s1: String, _ s2: String, _ s3: String, _ s4: String, _ s5: String, @CSSBuilder _ content: () -> CSSOM.CSSStyleDeclaration) -> CSSOM.CSSStyleRule {
  CSSOM.CSSStyleRule("\(smartJoiner(s1, joiner: " ")),\(smartJoiner(s2, joiner: " ")),\(smartJoiner(s3, joiner: " ")),\(smartJoiner(s4, joiner: " ")),\(smartJoiner(s5, joiner: " "))", style: content())
}

@_disfavoredOverload
public func selector(_ s1: String, _ s2: String, _ s3: String, _ s4: String, _ s5: String, _ s6: String, @CSSBuilder _ content: () -> CSSOM.CSSStyleDeclaration) -> CSSOM.CSSStyleRule {
  CSSOM.CSSStyleRule("\(smartJoiner(s1, joiner: " ")),\(smartJoiner(s2, joiner: " ")),\(smartJoiner(s3, joiner: " ")),\(smartJoiner(s4, joiner: " ")),\(smartJoiner(s5, joiner: " ")),\(smartJoiner(s6, joiner: " "))", style: content())
}

@_disfavoredOverload
public func selector(_ s1: String, _ s2: String, _ s3: String, _ s4: String, _ s5: String, _ s6: String, _ s7: String, @CSSBuilder _ content: () -> CSSOM.CSSStyleDeclaration) -> CSSOM.CSSStyleRule {
  CSSOM.CSSStyleRule("\(smartJoiner(s1, joiner: " ")),\(smartJoiner(s2, joiner: " ")),\(smartJoiner(s3, joiner: " ")),\(smartJoiner(s4, joiner: " ")),\(smartJoiner(s5, joiner: " ")),\(smartJoiner(s6, joiner: " ")),\(smartJoiner(s7, joiner: " "))", style: content())
}

@_disfavoredOverload
public func selector(_ s1: String, _ s2: String, _ s3: String, _ s4: String, _ s5: String, _ s6: String, _ s7: String, _ s8: String, @CSSBuilder _ content: () -> CSSOM.CSSStyleDeclaration) -> CSSOM.CSSStyleRule {
  CSSOM.CSSStyleRule("\(smartJoiner(s1, joiner: " ")),\(smartJoiner(s2, joiner: " ")),\(smartJoiner(s3, joiner: " ")),\(smartJoiner(s4, joiner: " ")),\(smartJoiner(s5, joiner: " ")),\(smartJoiner(s6, joiner: " ")),\(smartJoiner(s7, joiner: " ")),\(smartJoiner(s8, joiner: " "))", style: content())
}

@_disfavoredOverload
public func selector(_ s1: String, _ s2: String, _ s3: String, _ s4: String, _ s5: String, _ s6: String, _ s7: String, _ s8: String, _ s9: String, @CSSBuilder _ content: () -> CSSOM.CSSStyleDeclaration) -> CSSOM.CSSStyleRule {
  CSSOM.CSSStyleRule("\(smartJoiner(s1, joiner: " ")),\(smartJoiner(s2, joiner: " ")),\(smartJoiner(s3, joiner: " ")),\(smartJoiner(s4, joiner: " ")),\(smartJoiner(s5, joiner: " ")),\(smartJoiner(s6, joiner: " ")),\(smartJoiner(s7, joiner: " ")),\(smartJoiner(s8, joiner: " ")),\(smartJoiner(s9, joiner: " "))", style: content())
}

@_disfavoredOverload
public func selector(_ s1: String, _ s2: String, _ s3: String, _ s4: String, _ s5: String, _ s6: String, _ s7: String, _ s8: String, _ s9: String, _ s10: String, @CSSBuilder _ content: () -> CSSOM.CSSStyleDeclaration) -> CSSOM.CSSStyleRule {
  CSSOM.CSSStyleRule("\(smartJoiner(s1, joiner: " ")),\(smartJoiner(s2, joiner: " ")),\(smartJoiner(s3, joiner: " ")),\(smartJoiner(s4, joiner: " ")),\(smartJoiner(s5, joiner: " ")),\(smartJoiner(s6, joiner: " ")),\(smartJoiner(s7, joiner: " ")),\(smartJoiner(s8, joiner: " ")),\(smartJoiner(s9, joiner: " ")),\(smartJoiner(s10, joiner: " "))", style: content())
}

// MARK: - Selector Overloads (TagName)

@_disfavoredOverload
public func selector(_ t1: HTML.TagName, _ t2: HTML.TagName, @CSSBuilder _ content: () -> CSSOM.CSSStyleDeclaration) -> CSSOM.CSSStyleRule {
  CSSOM.CSSStyleRule("\(t1.value), \(t2.value)", style: content())
}

@_disfavoredOverload
public func selector(_ t1: HTML.TagName, _ t2: HTML.TagName, _ t3: HTML.TagName, @CSSBuilder _ content: () -> CSSOM.CSSStyleDeclaration) -> CSSOM.CSSStyleRule {
  CSSOM.CSSStyleRule("\(t1.value), \(t2.value), \(t3.value)", style: content())
}

@_disfavoredOverload
public func selector(_ t1: HTML.TagName, _ t2: HTML.TagName, _ t3: HTML.TagName, _ t4: HTML.TagName, @CSSBuilder _ content: () -> CSSOM.CSSStyleDeclaration) -> CSSOM.CSSStyleRule {
  CSSOM.CSSStyleRule("\(t1.value), \(t2.value), \(t3.value), \(t4.value)", style: content())
}

@_disfavoredOverload
public func selector(_ t1: HTML.TagName, _ t2: HTML.TagName, _ t3: HTML.TagName, _ t4: HTML.TagName, _ t5: HTML.TagName, @CSSBuilder _ content: () -> CSSOM.CSSStyleDeclaration) -> CSSOM.CSSStyleRule {
  CSSOM.CSSStyleRule("\(t1.value), \(t2.value), \(t3.value), \(t4.value), \(t5.value)", style: content())
}

@_disfavoredOverload
public func selector(_ t1: HTML.TagName, _ t2: HTML.TagName, _ t3: HTML.TagName, _ t4: HTML.TagName, _ t5: HTML.TagName, _ t6: HTML.TagName, @CSSBuilder _ content: () -> CSSOM.CSSStyleDeclaration) -> CSSOM.CSSStyleRule {
  CSSOM.CSSStyleRule("\(t1.value), \(t2.value), \(t3.value), \(t4.value), \(t5.value), \(t6.value)", style: content())
}

@_disfavoredOverload
public func selector(_ t1: HTML.TagName, _ t2: HTML.TagName, _ t3: HTML.TagName, _ t4: HTML.TagName, _ t5: HTML.TagName, _ t6: HTML.TagName, _ t7: HTML.TagName, @CSSBuilder _ content: () -> CSSOM.CSSStyleDeclaration) -> CSSOM.CSSStyleRule {
  CSSOM.CSSStyleRule("\(t1.value), \(t2.value), \(t3.value), \(t4.value), \(t5.value), \(t6.value), \(t7.value)", style: content())
}

@_disfavoredOverload
public func selector(_ t1: HTML.TagName, _ t2: HTML.TagName, _ t3: HTML.TagName, _ t4: HTML.TagName, _ t5: HTML.TagName, _ t6: HTML.TagName, _ t7: HTML.TagName, _ t8: HTML.TagName, @CSSBuilder _ content: () -> CSSOM.CSSStyleDeclaration) -> CSSOM.CSSStyleRule {
  CSSOM.CSSStyleRule("\(t1.value), \(t2.value), \(t3.value), \(t4.value), \(t5.value), \(t6.value), \(t7.value), \(t8.value)", style: content())
}

@_disfavoredOverload
public func selector(_ t1: HTML.TagName, _ t2: HTML.TagName, _ t3: HTML.TagName, _ t4: HTML.TagName, _ t5: HTML.TagName, _ t6: HTML.TagName, _ t7: HTML.TagName, _ t8: HTML.TagName, _ t9: HTML.TagName, @CSSBuilder _ content: () -> CSSOM.CSSStyleDeclaration) -> CSSOM.CSSStyleRule {
  CSSOM.CSSStyleRule("\(t1.value), \(t2.value), \(t3.value), \(t4.value), \(t5.value), \(t6.value), \(t7.value), \(t8.value), \(t9.value)", style: content())
}

@_disfavoredOverload
public func selector(_ t1: HTML.TagName, _ t2: HTML.TagName, _ t3: HTML.TagName, _ t4: HTML.TagName, _ t5: HTML.TagName, _ t6: HTML.TagName, _ t7: HTML.TagName, _ t8: HTML.TagName, _ t9: HTML.TagName, _ t10: HTML.TagName, @CSSBuilder _ content: () -> CSSOM.CSSStyleDeclaration) -> CSSOM.CSSStyleRule {
  CSSOM.CSSStyleRule("\(t1.value), \(t2.value), \(t3.value), \(t4.value), \(t5.value), \(t6.value), \(t7.value), \(t8.value), \(t9.value), \(t10.value)", style: content())
}

// MARK: - Attribute Selectors

public func attribute(_ name: String) -> String { "[\(name)]" }
public func attribute(_ name: HTMLAttributeName) -> String { "[\(name.rawValue)]" }
public func attribute(_ name: String, _ value: String) -> String { "[\(name)=\"\(value)\"]" }
public func attribute(_ name: HTMLAttributeName, _ value: Bool) -> String { "[\(name.rawValue)=\"\(value ? "true" : "false")\"]" }
public func attribute(_ name: HTMLAttributeName, _ value: String) -> String { "[\(name.rawValue)=\"\(value)\"]" }
public func attribute(_ name: String, _ value: CSS.ColorScheme) -> String { "[\(name)=\"\(value.rawValue)\"]" }

public func attribute(_ selector: String, @CSSBuilder _ content: () -> CSSOM.CSSStyleDeclaration) -> CSSOM.CSSStyleRule {
  CSSOM.CSSStyleRule(selector, style: content())
}

public func attribute(_ name: HTMLAttributeName, @CSSBuilder _ content: () -> CSSOM.CSSStyleDeclaration) -> CSSOM.CSSStyleRule {
  CSSOM.CSSStyleRule("[\(name.rawValue)]", style: content())
}

public func attribute(
  _ name: String, _ value: String, @CSSBuilder _ content: () -> CSSOM.CSSStyleDeclaration
) -> CSSOM.CSSStyleRule {
  CSSOM.CSSStyleRule("[\(name)=\"\(value)\"]", style: content())
}

public func attribute(
  _ name: HTMLAttributeName, _ value: String, @CSSBuilder _ content: () -> CSSOM.CSSStyleDeclaration
) -> CSSOM.CSSStyleRule {
  CSSOM.CSSStyleRule("[\(name.rawValue)=\"\(value)\"]", style: content())
}

public func attribute(_ selector: String, _ pseudoClass: CSS.PseudoClass, @CSSBuilder _ content: () -> CSSOM.CSSStyleDeclaration) -> CSSOM.CSSStyleRule {
  CSSOM.CSSStyleRule("[\(selector)]\(pseudoClass.rawValue)", style: content())
}

public func attribute(_ pseudoClass: CSS.PseudoClass, _ selector: String, @CSSBuilder _ content: () -> CSSOM.CSSStyleDeclaration) -> CSSOM.CSSStyleRule {
  CSSOM.CSSStyleRule("[\(selector)]\(pseudoClass.rawValue)", style: content())
}

public func attribute(_ pseudoClass: CSS.PseudoClass, @CSSBuilder _ content: () -> CSSOM.CSSStyleDeclaration) -> CSSOM.CSSStyleRule {
  CSSOM.CSSStyleRule(pseudoClass.rawValue, style: content())
}

public func attribute(_ selector: String, _ p1: CSS.PseudoClass, _ p2: CSS.PseudoClass, @CSSBuilder _ content: () -> CSSOM.CSSStyleDeclaration) -> CSSOM.CSSStyleRule {
  CSSOM.CSSStyleRule("[\(selector)]\(p1.rawValue)\(p2.rawValue)", style: content())
}

public func attribute(_ selector: String, _ p1: CSS.PseudoClass, _ p2: CSS.PseudoClass, _ p3: CSS.PseudoClass, @CSSBuilder _ content: () -> CSSOM.CSSStyleDeclaration) -> CSSOM.CSSStyleRule {
  CSSOM.CSSStyleRule("[\(selector)]\(p1.rawValue)\(p2.rawValue)\(p3.rawValue)", style: content())
}

public func attribute(_ selector: String, _ pseudoClass: CSS.PseudoClass, _ combinator: String, @CSSBuilder _ content: () -> CSSOM.CSSStyleDeclaration) -> CSSOM.CSSStyleRule {
  CSSOM.CSSStyleRule("[\(selector)]\(pseudoClass.rawValue)\(combinator)", style: content())
}

public func attribute(_ selector: String, _ pseudoClass: CSS.PseudoClass, _ c1: String, _ c2: String, @CSSBuilder _ content: () -> CSSOM.CSSStyleDeclaration) -> CSSOM.CSSStyleRule {
  CSSOM.CSSStyleRule("[\(selector)]\(pseudoClass.rawValue)\(c1)\(c2)", style: content())
}

public func ariaPressed(_ value: Bool) -> String { "aria-pressed=\"\(value ? "true" : "false")\"" }

// MARK: - Combinator Selectors

public func descendant(_ selector: String, @CSSBuilder _ content: () -> CSSOM.CSSStyleDeclaration) -> CSSOM.CSSStyleRule {
  CSSOM.CSSStyleRule(selector, style: content())
}

public func descendant(_ s1: String, _ s2: String, @CSSBuilder _ content: () -> CSSOM.CSSStyleDeclaration) -> CSSOM.CSSStyleRule {
  CSSOM.CSSStyleRule("\(smartJoiner(s1, joiner: " ")) \(s2)", style: content())
}

public func descendant(_ s1: String, _ s2: String, _ s3: String, @CSSBuilder _ content: () -> CSSOM.CSSStyleDeclaration) -> CSSOM.CSSStyleRule {
  CSSOM.CSSStyleRule("\(smartJoiner(s1, joiner: " ")) \(s2) \(s3)", style: content())
}

public func descendant(_ s1: String, _ s2: String, _ s3: String, _ s4: String, @CSSBuilder _ content: () -> CSSOM.CSSStyleDeclaration) -> CSSOM.CSSStyleRule {
  CSSOM.CSSStyleRule("\(smartJoiner(s1, joiner: " ")) \(s2) \(s3) \(s4)", style: content())
}

public func descendant(_ s1: String, _ s2: String, _ s3: String, _ s4: String, _ s5: String, @CSSBuilder _ content: () -> CSSOM.CSSStyleDeclaration) -> CSSOM.CSSStyleRule {
  CSSOM.CSSStyleRule("\(smartJoiner(s1, joiner: " ")) \(s2) \(s3) \(s4) \(s5)", style: content())
}

public func descendant(_ s1: String, _ s2: String, _ s3: String, _ s4: String, _ s5: String, _ s6: String, @CSSBuilder _ content: () -> CSSOM.CSSStyleDeclaration) -> CSSOM.CSSStyleRule {
  CSSOM.CSSStyleRule("\(smartJoiner(s1, joiner: " ")) \(s2) \(s3) \(s4) \(s5) \(s6)", style: content())
}

public func descendant(_ s1: String, _ s2: String, _ s3: String, _ s4: String, _ s5: String, _ s6: String, _ s7: String, @CSSBuilder _ content: () -> CSSOM.CSSStyleDeclaration) -> CSSOM.CSSStyleRule {
  CSSOM.CSSStyleRule("\(smartJoiner(s1, joiner: " ")) \(s2) \(s3) \(s4) \(s5) \(s6) \(s7)", style: content())
}

public func descendant(_ s1: String, _ s2: String, _ s3: String, _ s4: String, _ s5: String, _ s6: String, _ s7: String, _ s8: String, @CSSBuilder _ content: () -> CSSOM.CSSStyleDeclaration) -> CSSOM.CSSStyleRule {
  CSSOM.CSSStyleRule("\(smartJoiner(s1, joiner: " ")) \(s2) \(s3) \(s4) \(s5) \(s6) \(s7) \(s8)", style: content())
}

public func descendant(_ s1: String, _ s2: String, _ s3: String, _ s4: String, _ s5: String, _ s6: String, _ s7: String, _ s8: String, _ s9: String, @CSSBuilder _ content: () -> CSSOM.CSSStyleDeclaration) -> CSSOM.CSSStyleRule {
  CSSOM.CSSStyleRule("\(smartJoiner(s1, joiner: " ")) \(s2) \(s3) \(s4) \(s5) \(s6) \(s7) \(s8) \(s9)", style: content())
}

public func descendant(_ s1: String, _ s2: String, _ s3: String, _ s4: String, _ s5: String, _ s6: String, _ s7: String, _ s8: String, _ s9: String, _ s10: String, @CSSBuilder _ content: () -> CSSOM.CSSStyleDeclaration) -> CSSOM.CSSStyleRule {
  CSSOM.CSSStyleRule("\(smartJoiner(s1, joiner: " ")) \(s2) \(s3) \(s4) \(s5) \(s6) \(s7) \(s8) \(s9) \(s10)", style: content())
}

public func child(_ selector: String, @CSSBuilder _ content: () -> CSSOM.CSSStyleDeclaration) -> CSSOM.CSSStyleRule {
  CSSOM.CSSStyleRule(" > \(selector)", style: content())
}

public func child(_ s1: String, _ s2: String, @CSSBuilder _ content: () -> CSSOM.CSSStyleDeclaration) -> CSSOM.CSSStyleRule {
  CSSOM.CSSStyleRule("\(smartJoiner(s1, joiner: " > ")) > \(s2)", style: content())
}

public func child(_ s1: String, _ s2: String, _ s3: String, @CSSBuilder _ content: () -> CSSOM.CSSStyleDeclaration) -> CSSOM.CSSStyleRule {
  CSSOM.CSSStyleRule("\(smartJoiner(s1, joiner: " > ")) > \(s2) > \(s3)", style: content())
}

public func nextSibling(_ selector: String, @CSSBuilder _ content: () -> CSSOM.CSSStyleDeclaration) -> CSSOM.CSSStyleRule {
  CSSOM.CSSStyleRule(" + \(selector)", style: content())
}

public func nextSibling(_ s1: String, _ s2: String, @CSSBuilder _ content: () -> CSSOM.CSSStyleDeclaration) -> CSSOM.CSSStyleRule {
  CSSOM.CSSStyleRule("\(smartJoiner(s1, joiner: " + ")) + \(s2)", style: content())
}

public func nextSibling(_ s1: String, _ s2: String, _ s3: String, @CSSBuilder _ content: () -> CSSOM.CSSStyleDeclaration) -> CSSOM.CSSStyleRule {
  CSSOM.CSSStyleRule("\(smartJoiner(s1, joiner: " + ")) + \(s2) + \(s3)", style: content())
}

public func subsequentSibling(_ selector: String, @CSSBuilder _ content: () -> CSSOM.CSSStyleDeclaration) -> CSSOM.CSSStyleRule {
  CSSOM.CSSStyleRule(" ~ \(selector)", style: content())
}

public func subsequentSibling(_ s1: String, _ s2: String, @CSSBuilder _ content: () -> CSSOM.CSSStyleDeclaration) -> CSSOM.CSSStyleRule {
  CSSOM.CSSStyleRule("\(smartJoiner(s1, joiner: " ~ ")) ~ \(s2)", style: content())
}

public func subsequentSibling(_ s1: String, _ s2: String, _ s3: String, @CSSBuilder _ content: () -> CSSOM.CSSStyleDeclaration) -> CSSOM.CSSStyleRule {
  CSSOM.CSSStyleRule("\(smartJoiner(s1, joiner: " ~ ")) ~ \(s2) ~ \(s3)", style: content())
}
