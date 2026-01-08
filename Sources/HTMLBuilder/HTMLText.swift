#if !os(WASI)

import Foundation

public struct HTMLText: HTML, Sendable {
	let content: String

	public init(content: String) {
		self.content = content
	}

	public func render(indent: Int = 0) -> String {
		let lines = content.components(separatedBy: .newlines)
		let indentString = String(repeating: "  ", count: indent)
		return lines.map { line in
			line.isEmpty ? "" : indentString + line
		}.joined(separator: "\n")
	}
}

/// Creates raw HTML content that is rendered without escaping
public func raw(_ content: String) -> HTMLText {
	HTMLText(content: content)
}

#endif
