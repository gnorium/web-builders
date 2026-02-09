#if !os(WASI)

public enum CSSPseudoClass: String, CSSProtocol {
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
	
	public func render(indent: Int = 0) -> String {
		""
	}
}

public func pseudoClass(_ pseudoClass: CSSPseudoClass, @CSSBuilder _ content: () -> [any CSSProtocol]) -> CSSRuleset {
	CSSRuleset(pseudoClass.rawValue, content)
}

public func pseudoClass(_ p1: CSSPseudoClass, _ p2: CSSPseudoClass, @CSSBuilder _ content: () -> [any CSSProtocol]) -> CSSRuleset {
	CSSRuleset("\(p1.rawValue)\(p2.rawValue)", content)
}

public func pseudoClass(_ p1: CSSPseudoClass, _ p2: CSSPseudoClass, _ p3: CSSPseudoClass, @CSSBuilder _ content: () -> [any CSSProtocol]) -> CSSRuleset {
	CSSRuleset("\(p1.rawValue)\(p2.rawValue)\(p3.rawValue)", content)
}

public func pseudoClass(_ pseudoClass: CSSPseudoClass, _ combinator: String, @CSSBuilder _ content: () -> [any CSSProtocol]) -> CSSRuleset {
	let combinedSelector = pseudoClass.rawValue + combinator
	return CSSRuleset(combinedSelector, content)
}

public func pseudoClass(_ pseudoClass: CSSPseudoClass, _ combinator1: String, _ combinator2: String, @CSSBuilder _ content: () -> [any CSSProtocol]) -> CSSRuleset {
	let combinedSelector = pseudoClass.rawValue + combinator1 + combinator2
	return CSSRuleset(combinedSelector, content)
}

public func pseudoClass(_ pseudoClass: CSSPseudoClass, _ combinator1: String, _ combinator2: String, _ combinator3: String, @CSSBuilder _ content: () -> [any CSSProtocol]) -> CSSRuleset {
	let combinedSelector = pseudoClass.rawValue + combinator1 + combinator2 + combinator3
	return CSSRuleset(combinedSelector, content)
}

public func pseudoClass(_ selector: String, @CSSBuilder _ content: () -> [any CSSProtocol]) -> CSSRuleset {
	CSSRuleset(selector, content)
}

public func not(_ pseudoClass: CSSPseudoClass) -> String {
	":not(\(pseudoClass.rawValue))"
}

public func not(_ selector: String) -> String {
	":not(\(selector))"
}

#endif
