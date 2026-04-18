import WebTypes

public struct CSSMedia: CSSContent {
	public let condition: String
	public var rules: [AnyCSSContent]

	public init(_ condition: String, @CSSBuilder _ content: () -> [AnyCSSContent]) {
		self.condition = condition
		self.rules = content()
	}

	public func render(prefix: String, indent: Int) -> String {
		let ind = String(repeating: "  ", count: indent)
		var rulesString = ""
        
        var declarations: [AnyCSSContent] = []
        var otherRules: [AnyCSSContent] = []
        for r in rules {
            if r.cssRuleType == .declaration {
                declarations.append(r)
            } else {
                otherRules.append(r)
            }
        }
        
        if !declarations.isEmpty {
            var declBody = ""
            for (index, d) in declarations.enumerated() {
                declBody += d.render(prefix: "", indent: indent + 2)
                if index < declarations.count - 1 {
                    declBody += "\n"
                }
            }
            if !prefix.isEmpty {
                rulesString += "\(ind)  \(prefix) {\n\(declBody)\n\(ind)  }\n\n"
            } else {
                rulesString += "\(declBody)\n\n"
            }
        }
        if !otherRules.isEmpty {
            for (index, r) in otherRules.enumerated() {
                rulesString += r.render(prefix: prefix, indent: indent + 1)
                if index < otherRules.count - 1 {
                    rulesString += "\n\n"
                }
            }
        }
        
		return "\(ind)@media \(condition) {\n\(rulesString)\n\(ind)}"
    }

    public var cssRuleType: CSSRuleType { .mediaRule }

	public static func minWidth(_ value: String) -> String {
		"(min-width: \(value))"
	}

	public static func maxWidth(_ value: String) -> String {
		"(max-width: \(value))"
	}

	public static func minHeight(_ value: String) -> String {
		"(min-height: \(value))"
	}

	public static func maxHeight(_ value: String) -> String {
		"(max-height: \(value))"
	}

	public static func prefersColorScheme(_ scheme: CSSPrefersColorScheme) -> String {
		"(prefers-color-scheme: \(scheme.rawValue))"
	}

	public static func prefersContrast(_ value: CSSPrefersContrast) -> String {
		"(prefers-contrast: \(value.rawValue))"
	}

	public static func prefersReducedMotion(_ value: CSSPrefersReducedMotion) -> String {
		"(prefers-reduced-motion: \(value.rawValue))"
	}
}

public func media(_ condition: String, @CSSBuilder _ content: () -> [AnyCSSContent]) -> CSSMedia {
	CSSMedia(condition, content)
}

public func media(_ condition1: String, _ condition2: String, @CSSBuilder _ content: () -> [AnyCSSContent]) -> CSSMedia {
	CSSMedia(condition1 + " and " + condition2, content)
}

public func minWidth(_ value: String) -> String {
	CSSMedia.minWidth(value)
}

public func minWidth(_ value: Length) -> String {
	CSSMedia.minWidth(value.value)
}

public func maxWidth(_ value: Length) -> String {
	CSSMedia.maxWidth(value.value)
}

public func maxWidth(_ value: String) -> String {
	CSSMedia.maxWidth(value)
}

public func minHeight(_ value: String) -> String {
	CSSMedia.minHeight(value)
}

public func maxHeight(_ value: String) -> String {
	CSSMedia.maxHeight(value)
}

public func prefersReducedMotion(_ value: CSSPrefersReducedMotion) -> String {
	CSSMedia.prefersReducedMotion(value)
}

public func prefersColorScheme(_ scheme: CSSPrefersColorScheme) -> String {
	CSSMedia.prefersColorScheme(scheme)
}

public func prefersContrast(_ value: CSSPrefersContrast) -> String {
	CSSMedia.prefersContrast(value)
}
