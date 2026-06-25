import CSSBuilder
import CSSOMBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

/// Base protocol for all HTML elements - provides common attributes and methods
public protocol HTMLElementBuildable {
  var attributes: [(String, String)] { get }
  func addingAttribute(_ key: String, _ value: String) -> Self
}

/// Central helper for processing style blocks with prefix support.
/// Accepts [CSSOM.CSSRule] from @CSSBuilder rule-list context. An empty-selectorText
/// CSSStyleRule is the sentinel for inline declarations (set by CSSBuilder.buildFinalResult).
public func processStyleBlock(
  cssItems: [CSSOM.CSSRule],
  prefix: Bool,
  className: String,
  existingStyle: String?
) -> (inlineStyle: String, didAppendGlobalStyles: Bool) {
  var inlineDecl: CSSOM.CSSStyleDeclaration? = nil
  var styleRules: [CSSOM.CSSRule] = []

  for rule in cssItems {
    if let styleRule = rule as? CSSOM.CSSStyleRule, stringIsEmpty(styleRule.selectorText) {
      inlineDecl = styleRule.style
    } else {
      styleRules.append(rule)
    }
  }

  // 1. Build inline style string
  var inlineStyle = ""
  if let decl = inlineDecl, decl.length > 0 {
    var newStylePart = ""
    decl.forEach { property, value, priority in
      let important = stringEquals(priority, "important") ? " !important" : ""
      let line = "\(property): \(value)\(important);"
      newStylePart = stringIsEmpty(newStylePart) ? line : "\(newStylePart) \(line)"
    }

    var joined = ""
    if let existing = existingStyle, !stringIsEmpty(existing) {
      joined = "\(existing) \(newStylePart)"
    } else {
      joined = newStylePart
    }
    inlineStyle = stringTrim(joined)
  }

  // 2. If no other rules, done
  if styleRules.count == 0 {
    return (inlineStyle, false)
  }

  // 3. Build selector prefix from class name
  let classParts = stringSplit(className, separator: " ")
  var selectorPrefix = ""
  if prefix && !stringIsEmpty(className) {
    selectorPrefix = "."
    for (index, part) in classParts.enumerated() {
      selectorPrefix = "\(selectorPrefix)\(part)"
      if index < classParts.count - 1 { selectorPrefix = "\(selectorPrefix)." }
    }
  }

  // 4. Render rules, substituting empty-selector CSSStyleRule sentinels with selectorPrefix
  // at any nesting depth (e.g. inside @media rules).
  func applyPrefix(_ rule: CSSOM.CSSRule, currentPrefix: String) -> CSSOM.CSSRule {
    if stringIsEmpty(currentPrefix) { return rule }
    if let styleRule = rule as? CSSOM.CSSStyleRule {
      let sel: String
      if stringIsEmpty(styleRule.selectorText) {
        sel = currentPrefix
      } else {
        sel = CSSOM.joinSelectors(currentPrefix, styleRule.selectorText)
      }
      let inner = styleRule.nestedRules.map { applyPrefix($0, currentPrefix: sel) }
      return CSSOM.CSSStyleRule(sel, style: styleRule.style, nestedRules: inner)
    }
    if let mediaRule = rule as? CSSOM.CSSMediaRule {
      let inner = mediaRule.cssRules.items.map { applyPrefix($0, currentPrefix: currentPrefix) }
      return CSSOM.CSSMediaRule(mediaRule.conditionText, rules: inner)
    }
    if let groupRule = rule as? CSSOM.CSSGroupingRule {
      let inner = groupRule.cssRules.items.map { applyPrefix($0, currentPrefix: currentPrefix) }
      let newGroup = CSSOM.CSSGroupingRule()
      for r in inner { newGroup.cssRules.append(r) }
      return newGroup
    }
    return rule
  }

  var styleContent = ""
  for rule in styleRules {
    let text = applyPrefix(rule, currentPrefix: selectorPrefix).cssText
    if !stringIsEmpty(text) {
      styleContent = "\(styleContent)\(text)\n\n"
    }
  }

  // 5. Append to global styles
  if !stringIsEmpty(styleContent) {
    HTMLGlobalStyle.shared.append(styleContent)
  }

  return (inlineStyle, !stringIsEmpty(styleContent))
}

/// Default implementations for universal HTML attributes (ARIA, Data, Events, Role)
/// Colliding modifiers (style, class, id) are intentionally omitted here and
/// provided by concrete extensions to resolve modular ambiguity.
extension HTMLElementBuildable {
  // MARK: - Core Style & Identity
  public func `class`(_ value: String) -> Self {
    addingAttribute("class", value)
  }

  public func id(_ value: String) -> Self {
    addingAttribute("id", value)
  }

  public func style(prefix: Bool = true, @CSSBuilder _ content: () -> [CSSOM.CSSRule]) -> Self {
    let (inlineStyle, _) = processStyleBlock(
      cssItems: content(),
      prefix: prefix,
      className: attributes.first(where: { stringEquals($0.0, "class") })?.1 ?? "",
      existingStyle: attributes.first(where: { stringEquals($0.0, "style") })?.1
    )

    return stringIsEmpty(inlineStyle) ? self : addingAttribute("style", inlineStyle)
  }

  // MARK: - Core Attributes
  public func title(_ value: String) -> Self {
    addingAttribute("title", value)
  }

  public func lang(_ value: String) -> Self {
    addingAttribute("lang", value)
  }

  public func lang(_ value: HTML.Lang) -> Self {
    addingAttribute("lang", value.rawValue)
  }

  public func dir(_ value: String) -> Self {
    addingAttribute("dir", value)
  }

  // MARK: - ARIA & Role
  public func role(_ value: String) -> Self {
    addingAttribute("role", value)
  }

  public func role(_ value: ARIA.Role) -> Self {
    addingAttribute("role", value.rawValue)
  }

  public func aria(label: String) -> Self {
    addingAttribute("aria-label", label)
  }

  public func aria(hidden: Bool) -> Self {
    addingAttribute("aria-hidden", hidden ? "true" : "false")
  }

  // MARK: - Universal Attributes
  public func data(_ key: String, _ value: String) -> Self {
    addingAttribute("data-\(key)", value)
  }

  public func data(_ key: String, _ value: Bool) -> Self {
    addingAttribute("data-\(key)", value ? "true" : "false")
  }

  public func data(_ key: String, _ value: Int) -> Self {
    addingAttribute("data-\(key)", intToString(value))
  }

  // ARIA attributes
  public func ariaLabel(_ value: String?) -> Self {
    guard let value = value else { return self }
    return addingAttribute("aria-label", value)
  }

  public func ariaHidden(_ value: Bool) -> Self {
    addingAttribute("aria-hidden", value ? "true" : "false")
  }

  public func ariaDisabled(_ value: Bool) -> Self {
    addingAttribute("aria-disabled", value ? "true" : "false")
  }

  public func ariaValueNow(_ value: Int) -> Self {
    addingAttribute("aria-valuenow", intToString(value))
  }

  public func ariaValueMin(_ value: Int) -> Self {
    addingAttribute("aria-valuemin", intToString(value))
  }

  public func ariaValueMax(_ value: Int) -> Self {
    addingAttribute("aria-valuemax", intToString(value))
  }

  public func ariaExpanded(_ value: String) -> Self {
    addingAttribute("aria-expanded", value)
  }

  public func ariaExpanded(_ value: Bool) -> Self {
    addingAttribute("aria-expanded", value ? "true" : "false")
  }

  public func ariaPressed(_ value: Bool) -> Self {
    addingAttribute("aria-pressed", value ? "true" : "false")
  }

  public func ariaPressed(_ value: String) -> Self {
    addingAttribute("aria-pressed", value)
  }

  public func ariaLive(_ value: String) -> Self {
    addingAttribute("aria-live", value)
  }

  public func ariaDescribedby(_ value: String?) -> Self {
    guard let value = value else { return self }
    return addingAttribute("aria-describedby", value)
  }

  public func ariaBusy(_ value: Bool) -> Self {
    addingAttribute("aria-busy", value ? "true" : "false")
  }

  public func ariaModal(_ value: Bool) -> Self {
    addingAttribute("aria-modal", value ? "true" : "false")
  }

  public func ariaSelected(_ value: Bool) -> Self {
    addingAttribute("aria-selected", value ? "true" : "false")
  }

  public func ariaMultiselectable(_ value: Bool) -> Self {
    addingAttribute("aria-multiselectable", value ? "true" : "false")
  }

  public func ariaInvalid(_ value: Bool) -> Self {
    addingAttribute("aria-invalid", value ? "true" : "false")
  }

  public func ariaHaspopup(_ value: ARIA.Haspopup) -> Self {
    addingAttribute("aria-haspopup", value.rawValue)
  }

  public func ariaHaspopup(_ value: String) -> Self {
    addingAttribute("aria-haspopup", value)
  }

  public func ariaAutocomplete(_ value: String) -> Self {
    addingAttribute("aria-autocomplete", value)
  }

  public func ariaControls(_ value: String?) -> Self {
    guard let value = value else { return self }
    return addingAttribute("aria-controls", value)
  }

  public func ariaLabelledby(_ value: String?) -> Self {
    guard let value = value else { return self }
    return addingAttribute("aria-labelledby", value)
  }

  public func ariaCurrent(_ value: ARIA.Current) -> Self {
    addingAttribute("aria-current", value.rawValue)
  }

  public func ariaCurrent(_ value: String) -> Self {
    addingAttribute("aria-current", value)
  }

  public func tabindex(_ value: String) -> Self {
    addingAttribute("tabindex", value)
  }

  public func tabindex(_ value: Int) -> Self {
    addingAttribute("tabindex", intToString(value))
  }

  // Event attributes
  public func onclick(_ value: String) -> Self {
    addingAttribute("onclick", value)
  }

  public func onchange(_ value: String) -> Self {
    addingAttribute("onchange", value)
  }

  public func onsubmit(_ value: String) -> Self {
    addingAttribute("onsubmit", value)
  }

  public func oninput(_ value: String) -> Self {
    addingAttribute("oninput", value)
  }

  public func onfocus(_ value: String) -> Self {
    addingAttribute("onfocus", value)
  }

  public func onblur(_ value: String) -> Self {
    addingAttribute("onblur", value)
  }

  public func onkeydown(_ value: String) -> Self {
    addingAttribute("onkeydown", value)
  }

  public func onkeyup(_ value: String) -> Self {
    addingAttribute("onkeyup", value)
  }

  public func onmouseenter(_ value: String) -> Self {
    addingAttribute("onmouseenter", value)
  }

  public func onmouseleave(_ value: String) -> Self {
    addingAttribute("onmouseleave", value)
  }

  // Boolean attributes
  public func hidden(_ value: Bool = true) -> Self {
    value ? addingAttribute("hidden", "hidden") : self
  }

  public func draggable(_ value: Bool = true) -> Self {
    addingAttribute("draggable", value ? "true" : "false")
  }

  public func translate(_ value: HTML.Translate) -> Self {
    addingAttribute("translate", value.rawValue)
  }

  public func setAttribute(_ name: String, _ value: String) -> Self {
    addingAttribute(name, value)
  }

  public func setAttribute(_ name: String, _ value: Bool) -> Self {
    addingAttribute(name, value ? "true" : "false")
  }

  public func setAttribute(_ name: String, _ value: Int) -> Self {
    addingAttribute(name, intToString(value))
  }

  public func setAttribute(_ name: String, _ value: Double) -> Self {
    addingAttribute(name, doubleToString(value))
  }
}
