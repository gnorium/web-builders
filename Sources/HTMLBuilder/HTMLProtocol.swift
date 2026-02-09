#if !os(WASI)

import Foundation

public protocol HTMLProtocol: Sendable {
	func render(indent: Int) -> String
}

extension HTMLProtocol {
	public func render() -> String { render(indent: 0) }
}

extension [any HTMLProtocol]: HTMLProtocol {
	public func render(indent: Int = 0) -> String {
		map { $0.render(indent: indent) }.joined(separator: "\n")
	}
}

#endif
