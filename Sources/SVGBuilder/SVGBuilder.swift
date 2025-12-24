#if !os(WASI)

import Foundation

@resultBuilder
public struct SVGBuilder {
	public static func buildBlock(_ components: [SVG]...) -> [SVG] {
		components.flatMap { $0 }
	}
	public static func buildArray(_ components: [[SVG]]) -> [SVG] { components.flatMap { $0 } }
	public static func buildOptional(_ component: [SVG]?) -> [SVG] { component ?? [] }
	public static func buildEither(first component: [SVG]) -> [SVG] { component }
	public static func buildEither(second component: [SVG]) -> [SVG] { component }
	public static func buildExpression(_ expression: SVG) -> [SVG] { [expression] }
	public static func buildExpression(_ expression: [SVG]) -> [SVG] { expression }
	public static func buildLimitedAvailability(_ component: [SVG]) -> [SVG] { component }
}

#endif
