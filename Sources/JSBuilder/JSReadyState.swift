/// Document ready state values
#if SERVER
  public enum JSReadyState: String, Sendable {
    case loading = "loading"
    case interactive = "interactive"
    case complete = "complete"
  }
#endif

#if CLIENT
  import EmbeddedSwiftUtilities

  public enum JSReadyState: Sendable, RawRepresentable {
    case loading
    case interactive
    case complete

    public var rawValue: String {
      switch self {
      case .loading: return "loading"
      case .interactive: return "interactive"
      case .complete: return "complete"
      }
    }

    public init?(rawValue: String) {
      if stringEquals(rawValue, "loading") {
        self = .loading
      } else if stringEquals(rawValue, "interactive") {
        self = .interactive
      } else if stringEquals(rawValue, "complete") {
        self = .complete
      } else {
        return nil
      }
    }
  }
#endif

extension JSReadyState: JSValue {
  public var expression: JSExpression {
    .string(rawValue)
  }
}

// Pre-registered ready state values
public let loading: JSReadyState = .loading
public let interactive: JSReadyState = .interactive
public let complete: JSReadyState = .complete
