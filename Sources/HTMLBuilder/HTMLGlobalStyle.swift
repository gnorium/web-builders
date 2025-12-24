#if !os(WASI)

/// Global CSS accumulator - collects all non-inlineable styles during rendering
public final class HTMLGlobalStyle: @unchecked Sendable {
	public static let shared = HTMLGlobalStyle()

	private var css: String = ""

	private init() {}

	public func append(_ content: String) {
		css += content
	}

	public func getAndReset() -> String {
		let result = css.trimmingCharacters(in: .newlines)
		css = ""
		return result
	}

	public func reset() {
		css = ""
	}
}

#endif
