import EmbeddedSwiftUtilities

/// Global CSSContent accumulator - collects all non-inlineable styles during rendering.
/// Deduplicates identical CSS blocks (pseudo-classes, media queries, etc.) to avoid bloat
/// when many elements share the same class and pseudo-class styles.
public final class HTMLGlobalStyle: @unchecked Sendable {
	public static let shared = HTMLGlobalStyle()

	private var blocks: [String] = []
	private var seen: Set<String> = []

	private init() {}

	public func append(_ content: String) {
		// Split into individual CSS blocks and deduplicate
		for block in stringSplit(content, separator: "\n\n") {
			let trimmed = stringTrim(block)
			guard !trimmed.isEmpty else { continue }
			if seen.insert(trimmed).inserted {
				blocks.append(trimmed)
			}
		}
	}

	public func getAndReset() -> String {
		let result = blocks.joinedString(separator: "\n\n")
		blocks = []
		seen = []
		return result.isEmpty ? result : result + "\n"
	}

	public func reset() {
		blocks = []
		seen = []
	}
}
