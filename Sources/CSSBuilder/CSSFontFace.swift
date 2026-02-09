#if !os(WASI)

public struct CSSFontFace: CSSProtocol {
	var declarations: [CSSDeclaration]

	public init(@CSSBuilder _ content: () -> [any CSSProtocol]) {
		self.declarations = content().compactMap { $0 as? CSSDeclaration }
	}

	public func render(indent: Int = 0) -> String {
		let ind = String(repeating: "  ", count: indent)
		let declString = declarations.map { $0.render(indent: indent + 1) }.joined(separator: "\n")
		return "\(ind)@font-face {\n\(declString)\n\(ind)}"
	}
}

public func fontFace(@CSSBuilder _ content: () -> [any CSSProtocol]) -> CSSFontFace {
	CSSFontFace(content)
}

#endif
