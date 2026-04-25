import WebTypes

public enum CSSContentItem: Sendable, ExpressibleByStringLiteral {
  case string(String)
  case counter(CSSCounter)
  case counters(CSSCounters)

  public init(stringLiteral value: String) {
    self = .string(value)
  }
}
