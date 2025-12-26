#if !os(WASI)

import WebTypes

public struct CSSMedia: CSS {
	public let condition: String
	public var rules: [any CSS]

	public init(_ condition: String, @CSSBuilder _ content: () -> [any CSS]) {
		self.condition = condition
		self.rules = content()
	}

	public func render(indent: Int = 0) -> String {
		let ind = String(repeating: "  ", count: indent)
		let rulesString = rules.map { $0.render(indent: indent + 1) }.joined(separator: "\n\n")
		return "\(ind)@media \(condition) {\n\(rulesString)\n\(ind)}"
	}

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

public func media(_ condition: String, @CSSBuilder _ content: () -> [any CSS]) -> CSSMedia {
	CSSMedia(condition, content)
}

public func media(_ condition1: String, _ condition2: String, @CSSBuilder _ content: () -> [any CSS]) -> CSSMedia {
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

#endif
