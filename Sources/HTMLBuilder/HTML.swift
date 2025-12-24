#if !os(WASI)

import Foundation

public protocol HTML: Sendable {
	func render(indent: Int) -> String
}

extension HTML {
	public func render() -> String { render(indent: 0) }
}

extension [HTML]: HTML {
	public func render(indent: Int = 0) -> String {
		map { $0.render(indent: indent) }.joined(separator: "\n")
	}
}

#endif
