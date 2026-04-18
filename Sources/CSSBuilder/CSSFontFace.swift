public struct CSSFontFace: CSSContent {
	var declarations: [AnyCSSContent]

	public init(@CSSBuilder _ content: () -> [AnyCSSContent]) {
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
		return "\(ind)@font-face {\n\(declString)\n\(ind)}"
	}

    public var cssRuleType: CSSRuleType { .fontFaceRule }
}

public func fontFace(@CSSBuilder _ content: () -> [AnyCSSContent]) -> CSSFontFace {
	CSSFontFace(content)
}
