public struct CSSKeyframes: CSSContent {
	let name: String
	var keyframes: [AnyCSSContent]
	
	public init(_ name: String, @CSSBuilder _ content: () -> [AnyCSSContent]) {
		self.name = name
        var kf: [AnyCSSContent] = []
        for item in content() {
            if item.cssRuleType == .keyframeRule {
                kf.append(item)
            }
        }
		self.keyframes = kf
	}
	
	public func render(prefix: String, indent: Int) -> String {
		let ind = String(repeating: "  ", count: indent)
		var keyframesString = ""
        for (index, item) in keyframes.enumerated() {
            keyframesString += item.render(prefix: "", indent: indent + 1)
            if index < keyframes.count - 1 {
                keyframesString += "\n\n"
            }
        }
		return "\(ind)@keyframes \(name) {\n\(keyframesString)\n\(ind)}"
	}

    public var cssRuleType: CSSRuleType { .keyframesRule }
}

public func keyframes(_ name: String, @CSSBuilder _ content: () -> [AnyCSSContent]) -> CSSKeyframes {
	CSSKeyframes(name, content)
}
