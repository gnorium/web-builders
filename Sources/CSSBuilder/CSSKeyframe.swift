import WebTypes

public struct CSSKeyframe: CSSContent {
	let selector: String
	var declarations: [AnyCSSContent]

	public init(_ selector: String, @CSSBuilder _ content: () -> [AnyCSSContent]) {
		self.selector = selector
		var decs: [AnyCSSContent] = []
        for item in content() {
            if item.cssRuleType == .declaration {
                decs.append(item)
            }
        }
        self.declarations = decs
	}

	public func render(prefix: String, indent: Int) -> String {
		let ind = String(repeating: "  ", count: indent)
		var declString = ""
        for (index, decl) in declarations.enumerated() {
            declString += decl.render(prefix: "", indent: indent + 1)
            if index < declarations.count - 1 {
                declString += "\n"
            }
        }
		return "\(ind)\(selector) {\n\(declString)\n\(ind)}"
	}

    public var cssRuleType: CSSRuleType { .keyframeRule }
}

public func keyframe(_ selector: String, @CSSBuilder _ content: () -> [AnyCSSContent]) -> CSSKeyframe {
	CSSKeyframe(selector, content)
}

public func keyframe(_ selector: Percentage, @CSSBuilder _ content: () -> [AnyCSSContent]) -> CSSKeyframe {
	CSSKeyframe(selector.value, content)
}

public func from(@CSSBuilder _ content: () -> [AnyCSSContent]) -> CSSKeyframe {
	CSSKeyframe("from", content)
}

public func to(@CSSBuilder _ content: () -> [AnyCSSContent]) -> CSSKeyframe {
	CSSKeyframe("to", content)
}
