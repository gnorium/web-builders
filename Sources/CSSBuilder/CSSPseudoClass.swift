#if CLIENT

import EmbeddedSwiftUtilities

#endif

import CSSOMBuilder
import WebTypes

public enum CSSPseudoClass: String, CSSContent {
	case root = ":root"
	case hover = ":hover"
	case focus = ":focus"
	case focusVisible = ":focus-visible"
	case focusWithin = ":focus-within"
	case active = ":active"
	case visited = ":visited"
	case link = ":link"
	case disabled = ":disabled"
	case enabled = ":enabled"
	case checked = ":checked"
	case indeterminate = ":indeterminate"
	case firstChild = ":first-child"
	case lastChild = ":last-child"
	case nthChild = ":nth-child"
	case nthOfType = ":nth-of-type"
	case firstOfType = ":first-of-type"
	case lastOfType = ":last-of-type"
	case onlyChild = ":only-child"
	case onlyOfType = ":only-of-type"
	case empty = ":empty"
	case target = ":target"
	case optional = ":optional"
	case required = ":required"
	case valid = ":valid"
	case invalid = ":invalid"
	case inRange = ":in-range"
	case outOfRange = ":out-of-range"
	case readOnly = ":read-only"
	case readWrite = ":read-write"
	
	public static func not(_ pseudoClass: CSSPseudoClass) -> String {
		":not(\(pseudoClass.rawValue))"
	}

	public static func not(_ selector: String) -> String {
		":not(\(selector))"
	}
	
	public func render() -> CSSRule {
		.raw("")
	}

    public var cssRuleType: CSSRuleType { .styleRule }
}

public func pseudoClass(_ pseudoClass: CSSPseudoClass, @CSSOMBuilder _ content: () -> [CSSRule]) -> CSSStyleRule {
	CSSStyleRule(pseudoClass.rawValue, content)
}

public func pseudoClass(_ p1: CSSPseudoClass, _ p2: CSSPseudoClass, @CSSOMBuilder _ content: () -> [CSSRule]) -> CSSStyleRule {
	CSSStyleRule("\(p1.rawValue)\(p2.rawValue)", content)
}

public func pseudoClass(_ p1: CSSPseudoClass, _ p2: CSSPseudoClass, _ p3: CSSPseudoClass, @CSSOMBuilder _ content: () -> [CSSRule]) -> CSSStyleRule {
	CSSStyleRule("\(p1.rawValue)\(p2.rawValue)\(p3.rawValue)", content)
}

public func pseudoClass(_ pseudoClass: CSSPseudoClass, _ combinator: String, @CSSOMBuilder _ content: () -> [CSSRule]) -> CSSStyleRule {
	let combinedSelector = pseudoClass.rawValue + combinator
	return CSSStyleRule(combinedSelector, content)
}

public func pseudoClass(_ pseudoClass: CSSPseudoClass, _ combinator1: String, _ combinator2: String, @CSSOMBuilder _ content: () -> [CSSRule]) -> CSSStyleRule {
	let combinedSelector = pseudoClass.rawValue + combinator1 + combinator2
	return CSSStyleRule(combinedSelector, content)
}

public func pseudoClass(_ pseudoClass: CSSPseudoClass, _ combinator1: String, _ combinator2: String, _ combinator3: String, @CSSOMBuilder _ content: () -> [CSSRule]) -> CSSStyleRule {
	let combinedSelector = pseudoClass.rawValue + combinator1 + combinator2 + combinator3
	return CSSStyleRule(combinedSelector, content)
}

public func pseudoClass(_ selector: String, @CSSOMBuilder _ content: () -> [CSSRule]) -> CSSStyleRule {
	CSSStyleRule(selector, content)
}

public func not(_ selector: String) -> String {
	":not(\(selector))"
}

public func not(_ pseudo: CSSPseudoClass) -> String {
	":not(\(pseudo.rawValue))"
}

public func nthChild(_ arg: String) -> String {
	":nth-child(\(arg))"
}

public func nthChild(_ arg: Int) -> String {
	":nth-child(\(arg))"
}

public func nthOfType(_ arg: String) -> String {
	":nth-of-type(\(arg))"
}

public func nthOfType(_ arg: Int) -> String {
	":nth-of-type(\(arg))"
}

public func pseudoClass(_ selector: String, _ pseudoClass: CSSPseudoClass) -> String {
	selector + pseudoClass.rawValue
}

public func pseudoClass(_ pseudoClass: CSSPseudoClass) -> String {
	pseudoClass.rawValue
}
