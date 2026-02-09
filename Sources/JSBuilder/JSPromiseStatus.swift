#if !os(WASI)


/// Promise/Fetch status values for JSProtocol
public enum JSPromiseStatus: String, Sendable {
	case pending = "pending"
	case resolved = "resolved"
	case error = "error"
}

extension JSPromiseStatus: JSValueProtocol {
	public var expression: JSExpression {
		.string(rawValue)
	}
}

// Pre-registered promise status values
public let pending: JSPromiseStatus = .pending
public let resolved: JSPromiseStatus = .resolved
public let error: JSPromiseStatus = .error

#endif
