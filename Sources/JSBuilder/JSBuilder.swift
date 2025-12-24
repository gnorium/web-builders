#if !os(WASI)

@resultBuilder
public struct JSBuilder: Sendable {
	public static func buildBlock(_ components: JS...) -> [JS] { components }
	public static func buildArray(_ components: [JS]) -> [JS] { components }
	public static func buildOptional(_ component: JS?) -> [JS] { [component].compactMap { $0 } }
	public static func buildEither(first component: [JS]) -> [JS] { component }
	public static func buildEither(second component: [JS]) -> [JS] { component }
	public static func buildExpression(_ expression: JS) -> JS { expression }
	public static func buildExpression(_ expression: JSStatement) -> JS { expression }
	public static func buildExpression(_ expression: JSExpression) -> JS { JSStatement.expression(expression) }
	public static func buildExpression(_ expression: JSBinaryOp) -> JS { JSStatement.expression(expression.expression) }
	public static func buildExpression(_ expression: JSUnaryOp) -> JS { JSStatement.expression(expression.expression) }
	public static func buildExpression(_ expression: JSIdentifier) -> JS { JSStatement.expression(expression.expression) }
	public static func buildExpression(_ expression: JSTernaryIntermediate) -> JS { JSStatement.expression(expression.expression) }
	public static func buildExpression(_ expression: JSPromiseChain) -> JS { JSStatement.expression(expression.expression) }
}

#endif
