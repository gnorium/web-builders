#if !os(WASI)

/// Global CSSProtocol accumulator - collects all non-inlineable styles during rendering
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
		// Return with trailing newline if there's content, for proper block separation
		return result.isEmpty ? result : result + "\n"
	}

	public func reset() {
		css = ""
	}
}

#endif
