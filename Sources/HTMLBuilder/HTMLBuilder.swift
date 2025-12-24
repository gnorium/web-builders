#if !os(WASI)

import Foundation

@resultBuilder
public struct HTMLBuilder {
	public static func buildBlock(_ components: [HTML]...) -> [HTML] {
		components.flatMap { $0 }
	}

	public static func buildBlock(_ component: [HTML]) -> [HTML] {
		component
	}

	public static func buildBlock(_ component: String) -> [HTML] {
		[HTMLText(content: component)]
	}

	public static func buildArray(_ components: [HTML]) -> [HTML] { components }
	public static func buildOptional(_ component: [HTML]?) -> [HTML] { component ?? [] }
	public static func buildEither(first component: [HTML]) -> [HTML] { component }
	public static func buildEither(second component: [HTML]) -> [HTML] { component }
	public static func buildExpression(_ expression: HTML) -> [HTML] { [expression] }
	public static func buildExpression(_ expression: String) -> [HTML] { [HTMLText(content: expression)] }
	public static func buildExpression(_ expression: [HTML]) -> [HTML] { expression }
	public static func buildLimitedAvailability(_ component: [HTML]) -> [HTML] { component }
}

#endif
