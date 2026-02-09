#if !os(WASI)

@resultBuilder
public struct JSBuilder: Sendable {
	public static func buildBlock(_ components: any JSProtocol...) -> [any JSProtocol] { components }
	public static func buildArray(_ components: [any JSProtocol]) -> [any JSProtocol] { components }
	public static func buildOptional(_ component: (any JSProtocol)?) -> [any JSProtocol] { [component].compactMap { $0 } }
	public static func buildEither(first component: [any JSProtocol]) -> [any JSProtocol] { component }
	public static func buildEither(second component: [any JSProtocol]) -> [any JSProtocol] { component }
	public static func buildExpression(_ expression: any JSProtocol) -> any JSProtocol { expression }
	public static func buildExpression(_ expression: JSStatement) -> any JSProtocol { expression }
	public static func buildExpression(_ expression: JSExpression) -> any JSProtocol { JSStatement.expression(expression) }
	public static func buildExpression(_ expression: JSBinaryOp) -> any JSProtocol { JSStatement.expression(expression.expression) }
	public static func buildExpression(_ expression: JSUnaryOp) -> any JSProtocol { JSStatement.expression(expression.expression) }
	public static func buildExpression(_ expression: JSIdentifier) -> any JSProtocol { JSStatement.expression(expression.expression) }
	public static func buildExpression(_ expression: JSTernaryIntermediate) -> any JSProtocol { JSStatement.expression(expression.expression) }
	public static func buildExpression(_ expression: JSPromiseChain) -> any JSProtocol { JSStatement.expression(expression.expression) }
}

#endif
