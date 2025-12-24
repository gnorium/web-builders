#if !os(WASI)

import WebTypes

public struct CSSRuleset: CSS {
	public let selector: String
	public var declarations: [CSSDeclaration]
	public var nestedRules: [CSS]  // Media queries, etc. nested inside this selector

	public init(_ selector: String, @CSSBuilder _ content: () -> [CSS] = { [] }) {
		self.selector = selector
		let allContent = content()
		self.declarations = allContent.compactMap { $0 as? CSSDeclaration }
		self.nestedRules = allContent.filter { !($0 is CSSDeclaration) }
	}
	
	public func render(indent: Int = 0) -> String {
		let ind = String(repeating: "  ", count: indent)
		let declString = declarations.map { $0.render(indent: indent + 1) }.joined(separator: "\n")
		
		if declarations.isEmpty {
			return "\(ind)\(selector) {}"
		}
		
		return "\(ind)\(selector) {\n\(declString)\n\(ind)}"
	}
	
	public func declaration(_ property: String, _ value: String) -> CSSRuleset {
		var copy = self
		copy.declarations.append(CSSDeclaration(property, value))
		return copy
	}
}

public func selector(_ selector: String, @CSSBuilder _ content: () -> [CSS]) -> CSSRuleset {
	CSSRuleset(selector, content)
}

public func selector(_ s1: String, _ s2: String, @CSSBuilder _ content: () -> [CSS]) -> CSSRuleset {
	CSSRuleset("\(s1), \(s2)", content)
}

public func selector(_ s1: String, _ s2: String, _ s3: String, @CSSBuilder _ content: () -> [CSS]) -> CSSRuleset {
	CSSRuleset("\(s1), \(s2), \(s3)", content)
}

public func selector(_ t1: TagName, _ t2: TagName, @CSSBuilder _ content: () -> [CSS]) -> CSSRuleset {
	CSSRuleset("\(t1.value), \(t2.value)", content)
}

public func selector(_ t1: TagName, _ t2: TagName, _ t3: TagName, @CSSBuilder _ content: () -> [CSS]) -> CSSRuleset {
	CSSRuleset("\(t1.value), \(t2.value), \(t3.value)", content)
}

public func selector(_ t1: TagName, _ t2: TagName, _ t3: TagName, _ t4: TagName, @CSSBuilder _ content: () -> [CSS]) -> CSSRuleset {
	CSSRuleset("\(t1.value), \(t2.value), \(t3.value), \(t4.value)", content)
}

public func selector(_ t1: TagName, _ t2: TagName, _ t3: TagName, _ t4: TagName, _ t5: TagName, @CSSBuilder _ content: () -> [CSS]) -> CSSRuleset {
	CSSRuleset("\(t1.value), \(t2.value), \(t3.value), \(t4.value), \(t5.value)", content)
}

public func selector(_ t1: TagName, _ t2: TagName, _ t3: TagName, _ t4: TagName, _ t5: TagName, _ t6: TagName, @CSSBuilder _ content: () -> [CSS]) -> CSSRuleset {
	CSSRuleset("\(t1.value), \(t2.value), \(t3.value), \(t4.value), \(t5.value), \(t6.value)", content)
}

@available(*, deprecated)
public func ruleset(_ selector: String, @CSSBuilder _ content: () -> [CSS] = { [] }) -> CSSRuleset {
	CSSRuleset(selector, content)
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

public func attribute(_ name: String, _ value: CSSColorScheme) -> String {
	"[\(name)=\"\(value.rawValue)\"]"
}

/// Attribute selector with content - creates a scoped CSS ruleset
/// Example: attribute("[aria-pressed=\"true\"]") { ... }
public func attribute(_ selector: String, @CSSBuilder _ content: () -> [CSS]) -> CSSRuleset {
	CSSRuleset(selector, content)
}

/// Attribute selector combined with pseudo-class
/// Example: attribute(ariaPressed(true), .hover) { ... }
public func attribute(_ selector: String, _ pseudoClass: CSSPseudoClass, @CSSBuilder _ content: () -> [CSS]) -> CSSRuleset {
	CSSRuleset("[\(selector)]\(pseudoClass.rawValue)", content)
}

/// Attribute selector combined with pseudo-class
/// Example: attribute(ariaPressed(true), .hover) { ... }
public func attribute(_ pseudoClass: CSSPseudoClass, _ selector: String, @CSSBuilder _ content: () -> [CSS]) -> CSSRuleset {
	CSSRuleset("[\(selector)]\(pseudoClass.rawValue)", content)
}

/// Attribute selector with just a pseudo-class (for simple attributes like [disabled])
/// Example: attribute(.disabled) { ... }
public func attribute(_ pseudoClass: CSSPseudoClass, @CSSBuilder _ content: () -> [CSS]) -> CSSRuleset {
	CSSRuleset(pseudoClass.rawValue, content)
}

/// Attribute selector with multiple pseudo-classes
/// Example: attribute(ariaPressed(false), .checked, .disabled) { ... }
public func attribute(_ selector: String, _ p1: CSSPseudoClass, _ p2: CSSPseudoClass, @CSSBuilder _ content: () -> [CSS]) -> CSSRuleset {
	CSSRuleset("[\(selector)]\(p1.rawValue)\(p2.rawValue)", content)
}

/// Attribute selector with three pseudo-classes
/// Example: attribute(ariaPressed(false), .checked, .hover, .focus) { ... }
public func attribute(_ selector: String, _ p1: CSSPseudoClass, _ p2: CSSPseudoClass, _ p3: CSSPseudoClass, @CSSBuilder _ content: () -> [CSS]) -> CSSRuleset {
	CSSRuleset("[\(selector)]\(p1.rawValue)\(p2.rawValue)\(p3.rawValue)", content)
}

/// Type-safe aria-pressed attribute selector for CSS
/// Returns the attribute name and value (without brackets) for use with attribute()
public func ariaPressed(_ value: Bool) -> String {
	"aria-pressed=\"\(value ? "true" : "false")\""
}

/// Descendant combinator (space) - Selects all elements that are descendants of a specified element
/// Example: descendant("p") targets all <p> descendants
public func descendant(_ selector: String, @CSSBuilder _ content: () -> [CSS]) -> CSSRuleset {
	CSSRuleset(" \(selector)", content)
}

/// Descendant combinator with attribute selector
/// Example: descendant(attribute("open"), ".icon") targets .icon descendants of elements with [open]
public func descendant(_ attrSelector: String, _ selector: String, @CSSBuilder _ content: () -> [CSS]) -> CSSRuleset {
	CSSRuleset("\(attrSelector) \(selector)", content)
}

/// Child combinator (>) - Selects all elements that are direct children of a specified element
/// Example: child(".item") targets all direct children with class "item"
public func child(_ selector: String, @CSSBuilder _ content: () -> [CSS]) -> CSSRuleset {
	CSSRuleset("> \(selector)", content)
}

/// Child combinator with attribute selector
/// Example: child(attribute("open"), ".icon")
public func child(_ attrSelector: String, _ selector: String, @CSSBuilder _ content: () -> [CSS]) -> CSSRuleset {
	CSSRuleset("\(attrSelector) > \(selector)", content)
}

/// Next sibling combinator (+) - Selects the element that is immediately after another specific element
/// Example: nextSibling(".icon") targets the next sibling with class "icon"
public func nextSibling(_ selector: String, @CSSBuilder _ content: () -> [CSS]) -> CSSRuleset {
	CSSRuleset("+ \(selector)", content)
}

/// Next sibling combinator with attribute selector
/// Example: nextSibling(attribute("checked"), ".icon")
public func nextSibling(_ attrSelector: String, _ selector: String, @CSSBuilder _ content: () -> [CSS]) -> CSSRuleset {
	CSSRuleset("\(attrSelector) + \(selector)", content)
}

/// Subsequent sibling combinator (~) - Selects all elements that are next siblings of a specified element
/// Example: subsequentSibling(".item") targets all following siblings with class "item"
public func subsequentSibling(_ selector: String, @CSSBuilder _ content: () -> [CSS]) -> CSSRuleset {
	CSSRuleset("~ \(selector)", content)
}

/// Subsequent sibling combinator with attribute selector
/// Example: subsequentSibling(attribute("disabled"), ".label")
public func subsequentSibling(_ attrSelector: String, _ selector: String, @CSSBuilder _ content: () -> [CSS]) -> CSSRuleset {
	CSSRuleset("\(attrSelector) ~ \(selector)", content)
}

#endif
