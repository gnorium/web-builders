import CSSOMBuilder

// Core overloads for the internal CSSOMBuilder
extension CSSOMBuilder {
    public static func buildExpression(_ rule: CSSStyleRule) -> [CSSRule] { [rule.render()] }
    public static func buildExpression(_ rules: [CSSStyleRule]) -> [CSSRule] { rules.map { $0.render() } }
    public static func buildExpression(_ decl: CSSStyleDeclaration) -> [CSSRule] { [decl.render()] }
    public static func buildExpression(_ media: CSSMediaRule) -> [CSSRule] { [media.render()] } // Wait, this should be CSSRule
    public static func buildExpression(_ fontFace: CSSFontFaceRule) -> [CSSRule] { [fontFace.render()] }
    public static func buildExpression(_ importRule: CSSImportRule) -> [CSSRule] { [importRule.render()] }
    public static func buildExpression(_ keyframes: CSSKeyframesRule) -> [CSSRule] { [keyframes.render()] }
    public static func buildExpression(_ keyframe: CSSKeyframeRule) -> [CSSRule] { [keyframe.render()] }
}

// DSL overloads for user-facing CSSBuilder
extension CSSBuilder {
    public static func buildExpression(_ rule: CSSStyleRule) -> [CSSRule] { [rule.render()] }
    public static func buildExpression(_ rules: [CSSStyleRule]) -> [CSSRule] { rules.map { $0.render() } }
    public static func buildExpression(_ decl: CSSStyleDeclaration) -> [CSSRule] { [decl.render()] }
    public static func buildExpression(_ media: CSSMediaRule) -> [CSSRule] { [media.render()] }
    public static func buildExpression(_ fontFace: CSSFontFaceRule) -> [CSSRule] { [fontFace.render()] }
    public static func buildExpression(_ importRule: CSSImportRule) -> [CSSRule] { [importRule.render()] }
    public static func buildExpression(_ keyframes: CSSKeyframesRule) -> [CSSRule] { [keyframes.render()] }
    public static func buildExpression(_ keyframe: CSSKeyframeRule) -> [CSSRule] { [keyframe.render()] }
}
