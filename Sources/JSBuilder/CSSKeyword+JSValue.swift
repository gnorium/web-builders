#if !os(WASI)

import WebTypes

extension CSSKeyword.None: JSValueProtocol {
	public var expression: JSExpression {
		.string(rawValue)
	}
}

extension CSSKeyword.Auto: JSValueProtocol {
	public var expression: JSExpression {
		.string(rawValue)
	}
}

extension CSSKeyword.All: JSValueProtocol {
	public var expression: JSExpression {
		.string(rawValue)
	}
}

extension CSSKeyword.Length: JSValueProtocol {
	public var expression: JSExpression {
		.string(rawValue)
	}
}

extension CSSKeyword.Global: JSValueProtocol {
	public var expression: JSExpression {
		.string(rawValue)
	}
}

#endif
