#if CLIENT

import EmbeddedSwiftUtilities

#endif

import CSSOMBuilder
import WebTypes

public struct CSSKeyframesRule: CSSContent {
	public let name: String
	public var rules: [CSSRule]
	
	public init(_ name: String, @CSSOMBuilder _ content: () -> [CSSRule]) {
		self.name = name
        var kf: [CSSRule] = []
        for item in content() {
            if case .keyframeRule = item {
                kf.append(item)
            }
        }
		self.rules = kf
	}
	
	public func render() -> CSSRule {
        .keyframesRule(name: name, rules: rules)
	}

    public var cssRuleType: CSSRuleType { .keyframesRule }
}

public func keyframes(_ name: String, @CSSOMBuilder _ content: () -> [CSSRule]) -> CSSKeyframesRule {
	CSSKeyframesRule(name, content)
}
