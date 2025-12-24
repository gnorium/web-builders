#if !os(WASI)

import WebTypes

extension CSSDisplay.Outside: JSValue {
	public var expression: JSExpression {
		.string(rawValue)
	}
}

extension CSSDisplay.Inside: JSValue {
	public var expression: JSExpression {
		.string(rawValue)
	}
}

extension CSSDisplay.Legacy: JSValue {
	public var expression: JSExpression {
		.string(rawValue)
	}
}

#endif
