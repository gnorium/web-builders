#if !os(WASI)

@resultBuilder
public struct CSSBuilder {
	public static func buildBlock(_ components: [any CSS]...) -> [any CSS] { components.flatMap { $0 } }
	public static func buildArray(_ components: [[any CSS]]) -> [any CSS] { components.flatMap { $0 } }
	public static func buildOptional(_ component: [any CSS]?) -> [any CSS] { component ?? [] }
	public static func buildEither(first component: [any CSS]) -> [any CSS] { component }
	public static func buildEither(second component: [any CSS]) -> [any CSS] { component }
	public static func buildExpression(_ expression: any CSS) -> [any CSS] { [expression] }
	public static func buildExpression(_ expression: [any CSS]) -> [any CSS] { expression }
	public static func buildExpression(_ expression: CSSPseudoClass) -> [any CSS] { [expression] }
	public static func buildExpression(_ expression: CSSPseudoElement) -> [any CSS] { [expression] }
	public static func buildExpression(_ expression: CSSMedia) -> [any CSS] { [expression] }
}

#endif
