#if !os(WASI)

import WebTypes

extension CSSColorScheme: JSValueProtocol {
	public var expression: JSExpression {
		.string(rawValue)
	}
}

#endif
