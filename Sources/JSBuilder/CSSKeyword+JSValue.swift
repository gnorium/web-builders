#if !os(WASI)

import WebTypes

extension CSSKeyword.None: JSValue {
	public var expression: JSExpression {
		.string(rawValue)
	}
}

extension CSSKeyword.Auto: JSValue {
	public var expression: JSExpression {
		.string(rawValue)
	}
}

extension CSSKeyword.All: JSValue {
	public var expression: JSExpression {
		.string(rawValue)
	}
}

extension CSSKeyword.Length: JSValue {
	public var expression: JSExpression {
		.string(rawValue)
	}
}

extension CSSKeyword.Global: JSValue {
	public var expression: JSExpression {
		.string(rawValue)
	}
}

#endif
