#if !os(WASI)

import WebTypes

extension CSSColorScheme: JSValue {
	public var expression: JSExpression {
		.string(rawValue)
	}
}

#endif
