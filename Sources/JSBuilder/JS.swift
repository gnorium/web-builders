#if !os(WASI)

public protocol JS: Sendable {
	func render(indent: Int) -> String
}

extension JS {
	public func render() -> String { render(indent: 0) }
}

#endif
