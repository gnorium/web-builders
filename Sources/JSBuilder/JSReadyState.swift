#if !os(WASI)


/// Document ready state values
public enum JSReadyState: String, Sendable {
	case loading = "loading"
	case interactive = "interactive"
	case complete = "complete"
}

extension JSReadyState: JSValue {
	public var expression: JSExpression {
		.string(rawValue)
	}
}

// Pre-registered ready state values
public let loading: JSReadyState = .loading
public let interactive: JSReadyState = .interactive
public let complete: JSReadyState = .complete

#endif
