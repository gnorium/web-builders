import JSONLDFormat
import JSONImportMapFormat

@resultBuilder
public struct JSBuilder: Sendable {
	public static func buildBlock(_ components: [AnyJSContent]...) -> [AnyJSContent] {
        var result: [AnyJSContent] = []
        for component in components {
            result.append(contentsOf: component)
        }
        return result
    }

    public static func buildBlock(_ component: [AnyJSContent]) -> [AnyJSContent] { component }
	public static func buildArray(_ components: [AnyJSContent]) -> [AnyJSContent] { components }
    public static func buildArray(_ components: [[AnyJSContent]]) -> [AnyJSContent] {
        var result: [AnyJSContent] = []
        for component in components {
            result.append(contentsOf: component)
        }
        return result
    }
	public static func buildOptional(_ component: [AnyJSContent]?) -> [AnyJSContent] { component ?? [] }
	public static func buildEither(first component: [AnyJSContent]) -> [AnyJSContent] { component }
	public static func buildEither(second component: [AnyJSContent]) -> [AnyJSContent] { component }

	public static func buildExpression(_ expression: JSStatement) -> [AnyJSContent] { [AnyJSContent(expression)] }
	public static func buildExpression(_ expression: JSExpression) -> [AnyJSContent] { [AnyJSContent(JSStatement.expression(expression))] }
	public static func buildExpression(_ expression: JSIdentifier) -> [AnyJSContent] { [AnyJSContent(expression)] }
	public static func buildExpression(_ expression: AnyJSContent) -> [AnyJSContent] { [expression] }
	public static func buildExpression(_ expression: [AnyJSContent]) -> [AnyJSContent] { expression }
	public static func buildExpression(_ expression: String) -> [AnyJSContent] { [AnyJSContent(render: { _ in expression })] }
    #if !os(WASI)

	
    public static func buildExpression(_ expression: JSONLDObject) -> [AnyJSContent] { [AnyJSContent(render: { _ in expression.encodeJSON() })] }
	public static func buildExpression(_ expression: JSONImportMap) -> [AnyJSContent] { [AnyJSContent(render: { _ in expression.encodeJSON() })] }
    
    #endif

    /// Helper for generating raw JS strings.
	public static func render(@JSBuilder _ content: () -> [AnyJSContent]) -> String {
		let items = content()
        var result = ""
        for (index, item) in items.enumerated() {
            result += item.render()
            if index < items.count - 1 {
                result += "\n"
            }
        }
        return result
	}
}

/// Helper for generating raw JS strings.
public func renderJS(@JSBuilder _ content: () -> [AnyJSContent]) -> String {
	JSBuilder.render(content)
}
