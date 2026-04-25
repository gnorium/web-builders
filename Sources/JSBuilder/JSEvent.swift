#if SERVER
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
#endif

#if CLIENT
  import EmbeddedSwiftUtilities

  public enum JSEvent: Sendable, RawRepresentable {
    // Event interfaces for createEvent
    case CustomEvent
    case Event
    case MouseEvent
    case KeyboardEvent
    case UIEvent

    // Event names for addEventListener
    case DOMContentLoaded
    case change
    case click
    case load
    case input

    public var rawValue: String {
      switch self {
      case .CustomEvent: return "CustomEvent"
      case .Event: return "Event"
      case .MouseEvent: return "MouseEvent"
      case .KeyboardEvent: return "KeyboardEvent"
      case .UIEvent: return "UIEvent"
      case .DOMContentLoaded: return "DOMContentLoaded"
      case .change: return "change"
      case .click: return "click"
      case .load: return "load"
      case .input: return "input"
      }
    }

    public init?(rawValue: String) {
      if stringEquals(rawValue, "CustomEvent") {
        self = .CustomEvent
      } else if stringEquals(rawValue, "Event") {
        self = .Event
      } else if stringEquals(rawValue, "MouseEvent") {
        self = .MouseEvent
      } else if stringEquals(rawValue, "KeyboardEvent") {
        self = .KeyboardEvent
      } else if stringEquals(rawValue, "UIEvent") {
        self = .UIEvent
      } else if stringEquals(rawValue, "DOMContentLoaded") {
        self = .DOMContentLoaded
      } else if stringEquals(rawValue, "change") {
        self = .change
      } else if stringEquals(rawValue, "click") {
        self = .click
      } else if stringEquals(rawValue, "load") {
        self = .load
      } else if stringEquals(rawValue, "input") {
        self = .input
      } else {
        return nil
      }
    }
  }
#endif

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
