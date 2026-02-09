#if !os(WASI)

@resultBuilder
public struct CSSBuilder {
	public static func buildBlock(_ components: [any CSSProtocol]...) -> [any CSSProtocol] { components.flatMap { $0 } }
	public static func buildArray(_ components: [[any CSSProtocol]]) -> [any CSSProtocol] { components.flatMap { $0 } }
	public static func buildOptional(_ component: [any CSSProtocol]?) -> [any CSSProtocol] { component ?? [] }
	public static func buildEither(first component: [any CSSProtocol]) -> [any CSSProtocol] { component }
	public static func buildEither(second component: [any CSSProtocol]) -> [any CSSProtocol] { component }
	public static func buildExpression(_ expression: any CSSProtocol) -> [any CSSProtocol] { [expression] }
	public static func buildExpression(_ expression: [any CSSProtocol]) -> [any CSSProtocol] { expression }
	public static func buildExpression(_ expression: CSSPseudoClass) -> [any CSSProtocol] { [expression] }
	public static func buildExpression(_ expression: CSSPseudoElement) -> [any CSSProtocol] { [expression] }
	public static func buildExpression(_ expression: CSSMedia) -> [any CSSProtocol] { [expression] }
}

#endif
