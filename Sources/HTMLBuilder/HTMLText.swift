#if !os(WASI)

import Foundation

struct HTMLText: HTML {
	let content: String

	func render(indent: Int = 0) -> String {
		let lines = content.components(separatedBy: .newlines)
		let indentString = String(repeating: "  ", count: indent)
		return lines.map { line in
			line.isEmpty ? "" : indentString + line
		}.joined(separator: "\n")
	}
}

#endif
