#if !os(WASI)

@resultBuilder
public struct JSBuilder: Sendable {
	public static func buildBlock(_ components: any JS...) -> [any JS] { components }
	public static func buildArray(_ components: [any JS]) -> [any JS] { components }
	public static func buildOptional(_ component: (any JS)?) -> [any JS] { [component].compactMap { $0 } }
	public static func buildEither(first component: [any JS]) -> [any JS] { component }
	public static func buildEither(second component: [any JS]) -> [any JS] { component }
	public static func buildExpression(_ expression: any JS) -> any JS { expression }
	public static func buildExpression(_ expression: JSStatement) -> any JS { expression }
	public static func buildExpression(_ expression: JSExpression) -> any JS { JSStatement.expression(expression) }
	public static func buildExpression(_ expression: JSBinaryOp) -> any JS { JSStatement.expression(expression.expression) }
	public static func buildExpression(_ expression: JSUnaryOp) -> any JS { JSStatement.expression(expression.expression) }
	public static func buildExpression(_ expression: JSIdentifier) -> any JS { JSStatement.expression(expression.expression) }
	public static func buildExpression(_ expression: JSTernaryIntermediate) -> any JS { JSStatement.expression(expression.expression) }
	public static func buildExpression(_ expression: JSPromiseChain) -> any JS { JSStatement.expression(expression.expression) }
}

#endif
