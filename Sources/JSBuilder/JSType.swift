#if SERVER
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
#endif

#if CLIENT
  import EmbeddedSwiftUtilities

  public enum JSType: Sendable, RawRepresentable {
    case undefined
    case boolean
    case number
    case string
    case function
    case object
    case symbol
    case bigint

    public var rawValue: String {
      switch self {
      case .undefined: return "undefined"
      case .boolean: return "boolean"
      case .number: return "number"
      case .string: return "string"
      case .function: return "function"
      case .object: return "object"
      case .symbol: return "symbol"
      case .bigint: return "bigint"
      }
    }

    public init?(rawValue: String) {
      if stringEquals(rawValue, "undefined") {
        self = .undefined
      } else if stringEquals(rawValue, "boolean") {
        self = .boolean
      } else if stringEquals(rawValue, "number") {
        self = .number
      } else if stringEquals(rawValue, "string") {
        self = .string
      } else if stringEquals(rawValue, "function") {
        self = .function
      } else if stringEquals(rawValue, "object") {
        self = .object
      } else if stringEquals(rawValue, "symbol") {
        self = .symbol
      } else if stringEquals(rawValue, "bigint") {
        self = .bigint
      } else {
        return nil
      }
    }
  }
#endif

extension JSType: JSValue {
  public var expression: JSExpression {
    .string(rawValue)
  }
}
