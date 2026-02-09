#if !os(WASI)

import Foundation

@resultBuilder
public struct HTMLBuilder {
	public static func buildBlock(_ components: [any HTMLProtocol]...) -> [any HTMLProtocol] {
		components.flatMap { $0 }
	}

	public static func buildBlock(_ component: [any HTMLProtocol]) -> [any HTMLProtocol] {
		component
	}

	public static func buildBlock(_ component: String) -> [any HTMLProtocol] {
		[HTMLText(content: component)]
	}

	public static func buildArray(_ components: [any HTMLProtocol]) -> [any HTMLProtocol] { components }
	public static func buildOptional(_ component: [any HTMLProtocol]?) -> [any HTMLProtocol] { component ?? [] }
	public static func buildEither(first component: [any HTMLProtocol]) -> [any HTMLProtocol] { component }
	public static func buildEither(second component: [any HTMLProtocol]) -> [any HTMLProtocol] { component }
	public static func buildExpression(_ expression: any HTMLProtocol) -> [any HTMLProtocol] { [expression] }
	public static func buildExpression(_ expression: String) -> [any HTMLProtocol] { [HTMLText(content: expression)] }
	public static func buildExpression(_ expression: [any HTMLProtocol]) -> [any HTMLProtocol] { expression }
	public static func buildLimitedAvailability(_ component: [any HTMLProtocol]) -> [any HTMLProtocol] { component }
}

#endif
