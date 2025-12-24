#if !os(WASI)

public struct JSError: JSValue {
    let message: JSValue

    public init(_ message: JSValue) {
        self.message = message
    }

    public var expression: JSExpression {
        .new("Error", [message.expression]) // Note: JavaScript Error, not JSError
    }
}

#endif
