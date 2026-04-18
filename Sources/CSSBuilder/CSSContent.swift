public protocol CSSContent: Sendable {
    func render(prefix: String, indent: Int) -> String
    var cssRuleType: CSSRuleType { get }
}

extension CSSContent {
    public func render() -> String { render(prefix: "", indent: 0) }
    public func render(indent: Int) -> String { render(prefix: "", indent: indent) }
    public var cssRuleType: CSSRuleType { .styleRule }

    /// Manual type-erasure for Zero-Existentials architecture.
    public var erased: AnyCSSContent {
        AnyCSSContent(
            render: { p, i in self.render(prefix: p, indent: i) },
            cssRuleType: { self.cssRuleType }
        )
    }
}
