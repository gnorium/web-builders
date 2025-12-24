#if !os(WASI)

public protocol CSS: Sendable {
	func render(indent: Int) -> String
}

extension CSS {
	public func render() -> String { render(indent: 0) }
}

#endif
