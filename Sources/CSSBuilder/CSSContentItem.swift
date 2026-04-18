import WebTypes
public enum CSSContentItem: Sendable, ExpressibleByStringLiteral {
    case string(String)
    case counter(CSSCounter)

    public init(stringLiteral value: String) {
        self = .string(value)
    }
}