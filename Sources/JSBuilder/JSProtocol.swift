#if !os(WASI)

public protocol JSProtocol: Sendable {
	func render(indent: Int) -> String
}

extension JSProtocol {
	public func render() -> String { render(indent: 0) }
}

#endif
