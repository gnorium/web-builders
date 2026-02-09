#if !os(WASI)

public struct CSSImport: CSSProtocol {
	let url: String
	let mediaQueries: String?

	public init(_ url: String, media: String? = nil) {
		self.url = url
		self.mediaQueries = media
	}

	public func render(indent: Int = 0) -> String {
		let ind = String(repeating: "  ", count: indent)
		if let media = mediaQueries {
			return "\(ind)@import \(url) \(media);"
		}
		return "\(ind)@import \(url);"
	}
}

#endif
