public struct CSSImport: CSSContent {
	let url: String
	let mediaQueries: String?

	public init(_ url: String, media: String? = nil) {
		self.url = url
		self.mediaQueries = media
	}

	public func render(prefix: String, indent: Int) -> String {
		let ind = String(repeating: "  ", count: indent)
		if let media = mediaQueries {
			return "\(ind)@import \(url) \(media);"
		}
		return "\(ind)@import \(url);"
	}
}
