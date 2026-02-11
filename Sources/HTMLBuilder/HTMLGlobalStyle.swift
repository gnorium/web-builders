#if !os(WASI)

/// Global CSSProtocol accumulator - collects all non-inlineable styles during rendering.
/// Deduplicates identical CSS blocks (pseudo-classes, media queries, etc.) to avoid bloat
/// when many elements share the same class and pseudo-class styles.
public final class HTMLGlobalStyle: @unchecked Sendable {
	public static let shared = HTMLGlobalStyle()

	private var blocks: [String] = []
	private var seen: Set<String> = []

	private init() {}

	public func append(_ content: String) {
		// Split into individual CSS blocks and deduplicate
		for block in content.components(separatedBy: "\n\n") {
			let trimmed = block.trimmingCharacters(in: .whitespacesAndNewlines)
			guard !trimmed.isEmpty else { continue }
			if seen.insert(trimmed).inserted {
				blocks.append(trimmed)
			}
		}
	}

	public func getAndReset() -> String {
		let result = blocks.joined(separator: "\n\n")
		blocks = []
		seen = []
		return result.isEmpty ? result : result + "\n"
	}

	public func reset() {
		blocks = []
		seen = []
	}
}

#endif
