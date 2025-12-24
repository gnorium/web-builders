#if !os(WASI)

@resultBuilder
public struct CSSBuilder {
	public static func buildBlock(_ components: [CSS]...) -> [CSS] { components.flatMap { $0 } }
	public static func buildArray(_ components: [[CSS]]) -> [CSS] { components.flatMap { $0 } }
	public static func buildOptional(_ component: [CSS]?) -> [CSS] { component ?? [] }
	public static func buildEither(first component: [CSS]) -> [CSS] { component }
	public static func buildEither(second component: [CSS]) -> [CSS] { component }
	public static func buildExpression(_ expression: CSS) -> [CSS] { [expression] }
	public static func buildExpression(_ expression: [CSS]) -> [CSS] { expression }
	public static func buildExpression(_ expression: CSSPseudoClass) -> [CSS] { [expression] }
	public static func buildExpression(_ expression: CSSPseudoElement) -> [CSS] { [expression] }
	public static func buildExpression(_ expression: CSSMedia) -> [CSS] { [expression] }
}

#endif
