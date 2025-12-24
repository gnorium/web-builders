#if !os(WASI)


/// Event types and interface names for DOM events
public enum JSEvent: String, Sendable {
	// Event interfaces for createEvent
	case CustomEvent = "CustomEvent"
	case Event = "Event"
	case MouseEvent = "MouseEvent"
	case KeyboardEvent = "KeyboardEvent"
	case UIEvent = "UIEvent"

	// Event names for addEventListener
	case DOMContentLoaded = "DOMContentLoaded"
	case change = "change"
	case click = "click"
	case load = "load"
	case input = "input"
}

extension JSEvent: JSValue {
	public var expression: JSExpression {
		.string(rawValue)
	}
}

// Pre-registered event names (for addEventListener, etc.)
// Note: JSEvent interfaces (CustomEvent, MouseEvent, etc.) must use JSEvent.CustomEvent syntax
public let DOMContentLoaded: JSEvent = .DOMContentLoaded
public let change: JSEvent = .change
public let click: JSEvent = .click
public let load: JSEvent = .load
public let input: JSEvent = .input

#endif
