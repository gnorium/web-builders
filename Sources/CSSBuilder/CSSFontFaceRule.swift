#if CLIENT

import EmbeddedSwiftUtilities

#endif

import CSSOMBuilder
import WebTypes

public struct CSSFontFaceRule: CSSContent {
	public var style: [CSSRule]

	public init(@CSSOMBuilder _ content: () -> [CSSRule]) {
		var decs: [CSSRule] = []
        for item in content() {
            if case .styleDeclaration = item {
                decs.append(item)
            }
        }
        self.style = decs
	}

	public func render() -> CSSRule {
        .fontFaceRule(style: style)
	}

    public var cssRuleType: CSSRuleType { .fontFaceRule }
}

public func fontFace(@CSSOMBuilder _ content: () -> [CSSRule]) -> CSSFontFaceRule {
	CSSFontFaceRule(content)
}
