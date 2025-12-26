#if !os(WASI)

import Foundation

@resultBuilder
public struct HTMLBuilder {
	public static func buildBlock(_ components: [any HTML]...) -> [any HTML] {
		components.flatMap { $0 }
	}

	public static func buildBlock(_ component: [any HTML]) -> [any HTML] {
		component
	}

	public static func buildBlock(_ component: String) -> [any HTML] {
		[HTMLText(content: component)]
	}

	public static func buildArray(_ components: [any HTML]) -> [any HTML] { components }
	public static func buildOptional(_ component: [any HTML]?) -> [any HTML] { component ?? [] }
	public static func buildEither(first component: [any HTML]) -> [any HTML] { component }
	public static func buildEither(second component: [any HTML]) -> [any HTML] { component }
	public static func buildExpression(_ expression: any HTML) -> [any HTML] { [expression] }
	public static func buildExpression(_ expression: String) -> [any HTML] { [HTMLText(content: expression)] }
	public static func buildExpression(_ expression: [any HTML]) -> [any HTML] { expression }
	public static func buildLimitedAvailability(_ component: [any HTML]) -> [any HTML] { component }
}

#endif
