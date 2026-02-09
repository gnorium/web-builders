#if !os(WASI)

import Foundation

public protocol SVGProtocol: Sendable {
	func render(indent: Int) -> String
}

extension SVGProtocol {
	public func render() -> String { render(indent: 0) }
}

#endif
