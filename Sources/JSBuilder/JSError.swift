#if !os(WASI)

public struct JSError: JSValue {
    let message: any JSValue

    public init(_ message: any JSValue) {
        self.message = message
    }

    public var expression: JSExpression {
        .new("Error", [message.expression]) // Note: JavaScript Error, not JSError
    }
}

#endif
