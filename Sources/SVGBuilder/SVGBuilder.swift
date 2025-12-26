#if !os(WASI)

import Foundation

@resultBuilder
public struct SVGBuilder {
	public static func buildBlock(_ components: [any SVG]...) -> [any SVG] {
		components.flatMap { $0 }
	}
	public static func buildArray(_ components: [[any SVG]]) -> [any SVG] { components.flatMap { $0 } }
	public static func buildOptional(_ component: [any SVG]?) -> [any SVG] { component ?? [] }
	public static func buildEither(first component: [any SVG]) -> [any SVG] { component }
	public static func buildEither(second component: [any SVG]) -> [any SVG] { component }
	public static func buildExpression(_ expression: any SVG) -> [any SVG] { [expression] }
	public static func buildExpression(_ expression: [any SVG]) -> [any SVG] { expression }
	public static func buildLimitedAvailability(_ component: [any SVG]) -> [any SVG] { component }
}

#endif
