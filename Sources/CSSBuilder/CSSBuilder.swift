@resultBuilder
public struct CSSBuilder {
	public static func buildBlock(_ components: [AnyCSSContent]...) -> [AnyCSSContent] {
        var result = [AnyCSSContent]()
        for component in components {
            for item in component {
                result.append(item)
            }
        }
        return result
    }

	public static func buildArray(_ components: [[AnyCSSContent]]) -> [AnyCSSContent] {
        var result = [AnyCSSContent]()
        for component in components {
            for item in component {
                result.append(item)
            }
        }
        return result
    }

	public static func buildOptional(_ component: [AnyCSSContent]?) -> [AnyCSSContent] { component ?? [] }
	public static func buildEither(first component: [AnyCSSContent]) -> [AnyCSSContent] { component }
	public static func buildEither(second component: [AnyCSSContent]) -> [AnyCSSContent] { component }
	
    public static func build(@CSSBuilder _ content: () -> [AnyCSSContent]) -> [AnyCSSContent] {
        content()
    }

	public static func buildExpression(_ expression: CSSDeclaration) -> [AnyCSSContent] { [AnyCSSContent(expression)] }
	public static func buildExpression(_ expression: CSSRuleset) -> [AnyCSSContent] { [AnyCSSContent(expression)] }
	public static func buildExpression(_ expression: CSSPseudoClass) -> [AnyCSSContent] { [AnyCSSContent(expression)] }
	public static func buildExpression(_ expression: CSSPseudoElement) -> [AnyCSSContent] { [AnyCSSContent(expression)] }
	public static func buildExpression(_ expression: CSSMedia) -> [AnyCSSContent] { [AnyCSSContent(expression)] }
	public static func buildExpression(_ expression: CSSFontFace) -> [AnyCSSContent] { [AnyCSSContent(expression)] }
	public static func buildExpression(_ expression: CSSKeyframes) -> [AnyCSSContent] { [AnyCSSContent(expression)] }
	public static func buildExpression(_ expression: CSSKeyframe) -> [AnyCSSContent] { [AnyCSSContent(expression)] }
	public static func buildExpression(_ expression: CSSImport) -> [AnyCSSContent] { [AnyCSSContent(expression)] }
	public static func buildExpression(_ expression: AnyCSSContent) -> [AnyCSSContent] { [expression] }

	@_disfavoredOverload
	public static func buildExpression<T: CSSContent>(_ expression: T) -> [AnyCSSContent] { [AnyCSSContent(expression)] }
	
	@_disfavoredOverload
	public static func buildExpression<T: CSSContent>(_ expression: [T]) -> [AnyCSSContent] { expression.map { AnyCSSContent($0) } }

    #if !os(WASI)
	@_disfavoredOverload
	public static func buildExpression(_ expression: any CSSContent) -> [AnyCSSContent] { [AnyCSSContent(expression)] }
	
	@_disfavoredOverload
	public static func buildExpression(_ expression: [any CSSContent]) -> [AnyCSSContent] { expression.map { AnyCSSContent($0) } }
    #endif
	
	public static func buildLimitedAvailability(_ component: [AnyCSSContent]) -> [AnyCSSContent] { component }

	/// Helper for generating raw CSS strings for use in <style> blocks.
	public static func render(@CSSBuilder _ content: () -> [AnyCSSContent]) -> String {
		let items = content()
        var result = ""
        for (index, item) in items.enumerated() {
            result += item.render(prefix: "", indent: 0)
            if index < items.count - 1 {
                result += "\n"
            }
        }
        return result
	}
}


/// Helper for generating raw CSS strings for use in <style> blocks.
public func renderCSS(@CSSBuilder _ content: () -> [AnyCSSContent]) -> String {
	CSSBuilder.render(content)
}
