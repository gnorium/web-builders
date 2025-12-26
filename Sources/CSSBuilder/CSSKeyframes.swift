#if !os(WASI)

public struct CSSKeyframes: CSS {
	let name: String
	var keyframes: [CSSKeyframe]
	
	public init(_ name: String, @CSSBuilder _ content: () -> [any CSS]) {
		self.name = name
		self.keyframes = content().compactMap { $0 as? CSSKeyframe }
	}
	
	public func render(indent: Int = 0) -> String {
		let ind = String(repeating: "  ", count: indent)
		let keyframesString = keyframes.map { $0.render(indent: indent + 1) }.joined(separator: "\n\n")
		return "\(ind)@keyframes \(name) {\n\(keyframesString)\n\(ind)}"
	}
}

public func keyframes(_ name: String, @CSSBuilder _ content: () -> [any CSS]) -> CSSKeyframes {
	CSSKeyframes(name, content)
}

#endif
