import WebTypes

public struct CSSRuleset: CSSContent {
	public let selector: String
	public var declarations: [AnyCSSContent]
	public var nestedRules: [AnyCSSContent]  // Media queries, etc. nested inside this selector

	public init(_ selector: String, @CSSBuilder _ content: () -> [AnyCSSContent] = { [] }) {
		self.selector = selector
		let allContent = content()
		var decs: [AnyCSSContent] = []
		var rules: [AnyCSSContent] = []
		for item in allContent {
			if item.cssRuleType == .declaration {
				decs.append(item)
			} else {
				rules.append(item)
			}
		}
		self.declarations = decs
		self.nestedRules = rules
	}
	
	public func render(prefix: String, indent: Int) -> String {
		let ind = String(repeating: "  ", count: indent)
		
		let fullSelector: String
		if prefix.isEmpty {
			fullSelector = selector
		} else {
			if selector.hasPrefix(":") || selector.hasPrefix("[") || selector.hasPrefix(".") || selector.hasPrefix("#") {
				fullSelector = prefix + selector
			} else {
				fullSelector = prefix + " " + selector
			}
		}

		var declString = ""
        for (index, d) in declarations.enumerated() {
            declString += d.render(prefix: "", indent: indent + 1)
            if index < declarations.count - 1 {
                declString += "\n"
            }
		}
		
		var result = ""
		if !declarations.isEmpty {
			result += "\(ind)\(fullSelector) {\n\(declString)\n\(ind)}\n\n"
		}
		
		for (_, nested) in nestedRules.enumerated() {
			if nested.cssRuleType == .styleRule {
				result += nested.render(prefix: fullSelector, indent: indent)
			} else {
				result += nested.render(prefix: "", indent: indent) + "\n"
			}
		}
		
		return result
	}
	
	public func declaration(_ property: String, _ value: String) -> CSSRuleset {
		var copy = self
        copy.declarations.append(AnyCSSContent(CSSDeclaration(property, value)))
		return copy
	}
}

public func selector(_ selector: String, @CSSBuilder _ content: () -> [AnyCSSContent]) -> CSSRuleset {
	CSSRuleset(" \(selector)", content)
}

public func selector(_ s1: String, _ s2: String, @CSSBuilder _ content: () -> [AnyCSSContent]) -> CSSRuleset {
	CSSRuleset(" \(s1), \(s2)", content)
}

public func selector(_ s1: String, _ s2: String, _ s3: String, @CSSBuilder _ content: () -> [AnyCSSContent]) -> CSSRuleset {
	CSSRuleset(" \(s1), \(s2), \(s3)", content)
}

public func selector(_ t1: TagName, _ t2: TagName, @CSSBuilder _ content: () -> [AnyCSSContent]) -> CSSRuleset {
	CSSRuleset(" \(t1.value), \(t2.value)", content)
}

public func selector(_ t1: TagName, _ t2: TagName, _ t3: TagName, @CSSBuilder _ content: () -> [AnyCSSContent]) -> CSSRuleset {
	CSSRuleset(" \(t1.value), \(t2.value), \(t3.value)", content)
}

public func selector(_ t1: TagName, _ t2: TagName, _ t3: TagName, _ t4: TagName, @CSSBuilder _ content: () -> [AnyCSSContent]) -> CSSRuleset {
	CSSRuleset(" \(t1.value), \(t2.value), \(t3.value), \(t4.value)", content)
}

public func selector(_ t1: TagName, _ t2: TagName, _ t3: TagName, _ t4: TagName, _ t5: TagName, @CSSBuilder _ content: () -> [AnyCSSContent]) -> CSSRuleset {
	CSSRuleset(" \(t1.value), \(t2.value), \(t3.value), \(t4.value), \(t5.value)", content)
}

public func selector(_ t1: TagName, _ t2: TagName, _ t3: TagName, _ t4: TagName, _ t5: TagName, _ t6: TagName, @CSSBuilder _ content: () -> [AnyCSSContent]) -> CSSRuleset {
	CSSRuleset(" \(t1.value), \(t2.value), \(t3.value), \(t4.value), \(t5.value), \(t6.value)", content)
}

@available(*, deprecated)
public func ruleset(_ selector: String, @CSSBuilder _ content: () -> [AnyCSSContent] = { [] }) -> CSSRuleset {
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
public func attribute(_ selector: String, @CSSBuilder _ content: () -> [AnyCSSContent]) -> CSSRuleset {
	CSSRuleset(selector, content)
}

/// Attribute selector combined with pseudo-class
/// Example: attribute(ariaPressed(true), .hover) { ... }
public func attribute(_ selector: String, _ pseudoClass: CSSPseudoClass, @CSSBuilder _ content: () -> [AnyCSSContent]) -> CSSRuleset {
	CSSRuleset("[\(selector)]\(pseudoClass.rawValue)", content)
}

/// Attribute selector combined with pseudo-class
/// Example: attribute(ariaPressed(true), .hover) { ... }
public func attribute(_ pseudoClass: CSSPseudoClass, _ selector: String, @CSSBuilder _ content: () -> [AnyCSSContent]) -> CSSRuleset {
	CSSRuleset("[\(selector)]\(pseudoClass.rawValue)", content)
}

/// Attribute selector with just a pseudo-class (for simple attributes like [disabled])
/// Example: attribute(.disabled) { ... }
public func attribute(_ pseudoClass: CSSPseudoClass, @CSSBuilder _ content: () -> [AnyCSSContent]) -> CSSRuleset {
	CSSRuleset(pseudoClass.rawValue, content)
}

/// Attribute selector with multiple pseudo-classes
/// Example: attribute(ariaPressed(false), .checked, .disabled) { ... }
public func attribute(_ selector: String, _ p1: CSSPseudoClass, _ p2: CSSPseudoClass, @CSSBuilder _ content: () -> [AnyCSSContent]) -> CSSRuleset {
	CSSRuleset("[\(selector)]\(p1.rawValue)\(p2.rawValue)", content)
}

/// Attribute selector with three pseudo-classes
/// Example: attribute(ariaPressed(false), .checked, .hover, .focus) { ... }
public func attribute(_ selector: String, _ p1: CSSPseudoClass, _ p2: CSSPseudoClass, _ p3: CSSPseudoClass, @CSSBuilder _ content: () -> [AnyCSSContent]) -> CSSRuleset {
	CSSRuleset("[\(selector)]\(p1.rawValue)\(p2.rawValue)\(p3.rawValue)", content)
}

/// Attribute selector with pseudo-class and string combinator (for not() expressions)
/// Example: attribute(ariaPressed(true), .hover, not(.disabled)) { ... }
public func attribute(_ selector: String, _ pseudoClass: CSSPseudoClass, _ combinator: String, @CSSBuilder _ content: () -> [AnyCSSContent]) -> CSSRuleset {
	CSSRuleset("[\(selector)]\(pseudoClass.rawValue)\(combinator)", content)
}

/// Attribute selector with pseudo-class and two string combinators
/// Example: attribute(ariaPressed(true), .hover, not(.disabled), not(.readonly)) { ... }
public func attribute(_ selector: String, _ pseudoClass: CSSPseudoClass, _ c1: String, _ c2: String, @CSSBuilder _ content: () -> [AnyCSSContent]) -> CSSRuleset {
	CSSRuleset("[\(selector)]\(pseudoClass.rawValue)\(c1)\(c2)", content)
}

/// Type-safe aria-pressed attribute selector for CSSContent
/// Returns the attribute name and value (without brackets) for use with attribute()
public func ariaPressed(_ value: Bool) -> String {
	"aria-pressed=\"\(value ? "true" : "false")\""
}


/// Descendant combinator (space) - Selects all elements that are descendants of a specified element
/// Example: descendant("p") targets all <p> descendants
public func descendant(_ selector: String, @CSSBuilder _ content: () -> [AnyCSSContent]) -> CSSRuleset {
	CSSRuleset(" \(selector)", content)
}

/// Descendant combinator with multiple selectors
@_disfavoredOverload
public func descendant(_ s1: String, _ s2: String, @CSSBuilder _ content: () -> [AnyCSSContent]) -> [CSSRuleset] {
	let items = content()
	return [CSSRuleset(" \(s1)", { items }), CSSRuleset(" \(s2)", { items })]
}

/// Descendant combinator with three selectors
@_disfavoredOverload
public func descendant(_ s1: String, _ s2: String, _ s3: String, @CSSBuilder _ content: () -> [AnyCSSContent]) -> [CSSRuleset] {
	let items = content()
	return [CSSRuleset(" \(s1)", { items }), CSSRuleset(" \(s2)", { items }), CSSRuleset(" \(s3)", { items })]
}

/// Descendant combinator with attribute selector
/// Example: descendant(attribute("open"), ".icon") targets .icon descendants of elements with [open]
public func descendant(_ attrSelector: String, _ selector: String, @CSSBuilder _ content: () -> [AnyCSSContent]) -> CSSRuleset {
	CSSRuleset(" \(attrSelector) \(selector)", content)
}

/// Child combinator (>) - Selects all elements that are direct children of a specified element
/// Example: child(".item") targets all direct children with class "item"
public func child(_ selector: String, @CSSBuilder _ content: () -> [AnyCSSContent]) -> CSSRuleset {
	CSSRuleset(" > \(selector)", content)
}

/// Child combinator with multiple selectors - generates separate rulesets for each selector
@_disfavoredOverload
public func child(_ s1: String, _ s2: String, @CSSBuilder _ content: () -> [AnyCSSContent]) -> [CSSRuleset] {
	let items = content()
	return [CSSRuleset(" > \(s1)", { items }), CSSRuleset(" > \(s2)", { items })]
}

/// Child combinator with three selectors
@_disfavoredOverload
public func child(_ s1: String, _ s2: String, _ s3: String, @CSSBuilder _ content: () -> [AnyCSSContent]) -> [CSSRuleset] {
	let items = content()
	return [CSSRuleset(" > \(s1)", { items }), CSSRuleset(" > \(s2)", { items }), CSSRuleset(" > \(s3)", { items })]
}

/// Child combinator with attribute selector
/// Example: child(attribute("open"), ".icon")
public func child(_ attrSelector: String, _ selector: String, @CSSBuilder _ content: () -> [AnyCSSContent]) -> CSSRuleset {
	CSSRuleset(" \(attrSelector) > \(selector)", content)
}

/// Next sibling combinator (+) - Selects the element that is immediately after another specific element
/// Example: nextSibling(".icon") targets the next sibling with class "icon"
public func nextSibling(_ selector: String, @CSSBuilder _ content: () -> [AnyCSSContent]) -> CSSRuleset {
	CSSRuleset(" + \(selector)", content)
}

/// Next sibling combinator with attribute selector
/// Example: nextSibling(attribute("checked"), ".icon")
public func nextSibling(_ attrSelector: String, _ selector: String, @CSSBuilder _ content: () -> [AnyCSSContent]) -> CSSRuleset {
	CSSRuleset(" \(attrSelector) + \(selector)", content)
}

/// Subsequent sibling combinator (~) - Selects all elements that are next siblings of a specified element
/// Example: subsequentSibling(".item") targets all following siblings with class "item"
public func subsequentSibling(_ selector: String, @CSSBuilder _ content: () -> [AnyCSSContent]) -> CSSRuleset {
	CSSRuleset(" ~ \(selector)", content)
}

/// Subsequent sibling combinator with attribute selector
/// Example: subsequentSibling(attribute("disabled"), ".label")
public func subsequentSibling(_ attrSelector: String, _ selector: String, @CSSBuilder _ content: () -> [AnyCSSContent]) -> CSSRuleset {
	CSSRuleset(" \(attrSelector) ~ \(selector)", content)
}
