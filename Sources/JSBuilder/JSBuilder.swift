#if CLIENT

import EmbeddedSwiftUtilities

#endif

import JSONLDFormat
import JSONImportMapFormat

@resultBuilder
public struct JSBuilder: Sendable {
	public static func buildBlock(_ components: [JSStatement]...) -> [JSStatement] {
        var result: [JSStatement] = []
        for component in components {
            result.append(contentsOf: component)
        }
        return result
    }

    public static func buildBlock(_ component: [JSStatement]) -> [JSStatement] { component }
	public static func buildArray(_ components: [JSStatement]) -> [JSStatement] { components }
    public static func buildArray(_ components: [[JSStatement]]) -> [JSStatement] {
        components.flatMap { $0 }
    }
	public static func buildOptional(_ component: [JSStatement]?) -> [JSStatement] { component ?? [] }
	public static func buildEither(first component: [JSStatement]) -> [JSStatement] { component }
	public static func buildEither(second component: [JSStatement]) -> [JSStatement] { component }

	public static func buildExpression(_ expression: JSStatement) -> [JSStatement] { [expression] }
	public static func buildExpression(_ expression: JSExpression) -> [JSStatement] { [.expression(expression)] }
	public static func buildExpression(_ expression: [JSStatement]) -> [JSStatement] { expression }
	public static func buildExpression(_ expression: String) -> [JSStatement] { [.raw(expression)] }
    #if SERVER

	
    public static func buildExpression(_ expression: JSONLDObject) -> [JSStatement] { [.raw(expression.encodeJSON())] }
	public static func buildExpression(_ expression: JSONImportMap) -> [JSStatement] { [.raw(expression.encodeJSON())] }
    
    #endif

    /// Helper for generating the JavaScript model.
	public static func render(@JSBuilder _ content: () -> [JSStatement]) -> JSStatement {
        .block(content())
	}
}

/// Helper for generating the JavaScript model.
public func renderJS(@JSBuilder _ content: () -> [JSStatement]) -> JSStatement {
	JSBuilder.render(content)
}
