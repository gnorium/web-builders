/// Promise/Fetch status values for JSContent
#if SERVER
  public enum JSPromiseStatus: String, Sendable {
    case pending = "pending"
    case resolved = "resolved"
    case error = "error"
  }
#endif

#if CLIENT
  import EmbeddedSwiftUtilities

  public enum JSPromiseStatus: Sendable, RawRepresentable {
    case pending
    case resolved
    case error

    public var rawValue: String {
      switch self {
      case .pending: return "pending"
      case .resolved: return "resolved"
      case .error: return "error"
      }
    }

    public init?(rawValue: String) {
      if stringEquals(rawValue, "pending") {
        self = .pending
      } else if stringEquals(rawValue, "resolved") {
        self = .resolved
      } else if stringEquals(rawValue, "error") {
        self = .error
      } else {
        return nil
      }
    }
  }
#endif

extension JSPromiseStatus: JSValue {
  public var expression: JSExpression {
    .string(rawValue)
  }
}

// Pre-registered promise status values
public let pending: JSPromiseStatus = .pending
public let resolved: JSPromiseStatus = .resolved
public let error: JSPromiseStatus = .error
