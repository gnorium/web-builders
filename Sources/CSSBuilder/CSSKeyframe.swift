#if !os(WASI)

import WebTypes

public struct CSSKeyframe: CSS {
	let selector: String
	var declarations: [CSSDeclaration]

	public init(_ selector: String, @CSSBuilder _ content: () -> [any CSS]) {
		self.selector = selector
		self.declarations = content().compactMap { $0 as? CSSDeclaration }
	}

	public func render(indent: Int = 0) -> String {
		let ind = String(repeating: "  ", count: indent)
		let declString = declarations.map { $0.render(indent: indent + 1) }.joined(separator: "\n")
		return "\(ind)\(selector) {\n\(declString)\n\(ind)}"
	}
}

public func keyframe(_ selector: String, @CSSBuilder _ content: () -> [any CSS]) -> CSSKeyframe {
	CSSKeyframe(selector, content)
}

public func keyframe(_ selector: Percentage, @CSSBuilder _ content: () -> [any CSS]) -> CSSKeyframe {
	CSSKeyframe(selector.value, content)
}

public func from(@CSSBuilder _ content: () -> [any CSS]) -> CSSKeyframe {
	CSSKeyframe("from", content)
}

public func to(@CSSBuilder _ content: () -> [any CSS]) -> CSSKeyframe {
	CSSKeyframe("to", content)
}

#endif
