#if !os(WASI)

public protocol CSSProtocol: Sendable {
	func render(indent: Int) -> String
}

extension CSSProtocol {
	public func render() -> String { render(indent: 0) }
}

#endif
