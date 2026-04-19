#if CLIENT

import EmbeddedSwiftUtilities

#endif

import CSSOMBuilder

@resultBuilder
public struct CSSBuilder {
	public static func buildBlock(_ components: [CSSRule]...) -> [CSSRule] {
        var result = [CSSRule]()
        for component in components {
            result.append(contentsOf: component)
        }
        return result
    }

	public static func buildArray(_ components: [[CSSRule]]) -> [CSSRule] {
        components.flatMap { $0 }
    }

	public static func buildOptional(_ component: [CSSRule]?) -> [CSSRule] { component ?? [] }
	public static func buildEither(first component: [CSSRule]) -> [CSSRule] { component }
	public static func buildEither(second component: [CSSRule]) -> [CSSRule] { component }
	
    public static func build(@CSSBuilder _ content: () -> [CSSRule]) -> [CSSRule] {
        content()
    }

	public static func buildExpression(_ expression: CSSRule) -> [CSSRule] { [expression] }
    public static func buildExpression(_ expression: [CSSRule]) -> [CSSRule] { expression }

    @_disfavoredOverload
    public static func buildExpression(_ expression: some CSSContent) -> [CSSRule] {
        [expression.render()]
    }

	public static func buildLimitedAvailability(_ component: [CSSRule]) -> [CSSRule] { component }

	/// The terminal builder call that returns the spec-compliant model.
	public static func render(@CSSBuilder _ content: () -> [CSSRule]) -> CSSRule {
		let items = content()
        return .fragment(items)
	}
}

/// Convenience entry point for generating raw CSS strings.
/// This matches the legacy renderCSS behavior while returning a String.
public func renderCSS(@CSSBuilder _ content: () -> [CSSRule]) -> String {
	CSSBuilder.render(content).serialize()
}

/// Explicit entry point for generating raw CSS strings.
public func serializeCSS(@CSSBuilder _ content: () -> [CSSRule]) -> String {
	renderCSS(content)
}
