#if !os(WASI)

import WebTypes

extension CSSDisplay.Outside: JSValueProtocol {
	public var expression: JSExpression {
		.string(rawValue)
	}
}

extension CSSDisplay.Inside: JSValueProtocol {
	public var expression: JSExpression {
		.string(rawValue)
	}
}

extension CSSDisplay.Legacy: JSValueProtocol {
	public var expression: JSExpression {
		.string(rawValue)
	}
}

#endif
