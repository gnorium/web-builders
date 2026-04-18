public enum CSSRuleType: Int, Sendable {
    case declaration = 0
    case styleRule = 1
    case charsetRule = 2
    case importRule = 3
    case mediaRule = 4
    case fontFaceRule = 5
    case pageRule = 6
    case keyframesRule = 7
    case keyframeRule = 8
    case namespaceRule = 10
    case counterStyleRule = 11
    case supportsRule = 12
}