#if !os(WASI)

import Foundation

@resultBuilder
public struct SVGBuilder {
	public static func buildBlock(_ components: [any SVGProtocol]...) -> [any SVGProtocol] {
		components.flatMap { $0 }
	}
	public static func buildArray(_ components: [[any SVGProtocol]]) -> [any SVGProtocol] { components.flatMap { $0 } }
	public static func buildOptional(_ component: [any SVGProtocol]?) -> [any SVGProtocol] { component ?? [] }
	public static func buildEither(first component: [any SVGProtocol]) -> [any SVGProtocol] { component }
	public static func buildEither(second component: [any SVGProtocol]) -> [any SVGProtocol] { component }
	public static func buildExpression(_ expression: any SVGProtocol) -> [any SVGProtocol] { [expression] }
	public static func buildExpression(_ expression: [any SVGProtocol]) -> [any SVGProtocol] { expression }
	public static func buildLimitedAvailability(_ component: [any SVGProtocol]) -> [any SVGProtocol] { component }
}

#endif
