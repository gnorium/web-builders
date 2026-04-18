public struct AnyJSContent: JSContent {
    private let renderClosure: @Sendable (Int) -> String

    public init(_ content: JSStatement) { self.renderClosure = { i in content.render(indent: i) } }
    public init(_ content: JSExpression) { self.renderClosure = { i in content.render(indent: i) } }
    public init(_ content: JSIdentifier) { self.renderClosure = { i in content.render(indent: i) } }

    public init(render: @escaping @Sendable (Int) -> String) {
        self.renderClosure = render
    }

    public func render(indent: Int) -> String {
        renderClosure(indent)
    }
}
