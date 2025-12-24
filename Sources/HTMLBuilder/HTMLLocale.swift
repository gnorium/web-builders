public struct HTMLLocale: ExpressibleByStringLiteral, CustomStringConvertible, Sendable {
	public let value: String

	public init(stringLiteral value: String) {
		self.value = value
	}

	public var description: String {
		value
	}

	// Common locales
	public static let enUS = HTMLLocale(stringLiteral: "en_US")
	public static let enGB = HTMLLocale(stringLiteral: "en_GB")
}
