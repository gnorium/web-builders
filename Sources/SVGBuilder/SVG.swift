#if !os(WASI)

import Foundation

public protocol SVG: Sendable {
	func render(indent: Int) -> String
}

extension SVG {
	public func render() -> String { render(indent: 0) }
}

#endif
