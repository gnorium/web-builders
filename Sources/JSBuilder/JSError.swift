public struct JSError: JSValue {
    let message: JSExpression

    public init(_ message: JSExpression) {
        self.message = message
    }

    public var expression: JSExpression {
        .new("Error", [message.expression]) // Note: JavaScript Error, not JSError
    }
}
