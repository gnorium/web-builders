#if !os(WASI)

public enum JSType: String, Sendable {
	case undefined = "undefined"
	case boolean = "boolean"
	case number = "number"
	case string = "string"
	case function = "function"
	case object = "object"
	case symbol = "symbol"
	case bigint = "bigint"
}

extension JSType: JSValueProtocol {
	public var expression: JSExpression {
		.string(rawValue)
	}
}

#endif
