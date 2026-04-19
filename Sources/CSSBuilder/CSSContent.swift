import CSSOMBuilder
import WebTypes

public protocol CSSContent: Sendable {
    func render() -> CSSRule
    var cssRuleType: CSSRuleType { get }
}

extension CSSContent {
    public var cssRuleType: CSSRuleType { .styleRule }

    /// Helper for quick serialization to string.
    public func serialize(indent: Int = 0) -> String {
        render().serialize(indent: indent)
    }
}
