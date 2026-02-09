#if !os(WASI)

public struct JSError: JSValueProtocol {
    let message: any JSValueProtocol

    public init(_ message: any JSValueProtocol) {
        self.message = message
    }

    public var expression: JSExpression {
        .new("Error", [message.expression]) // Note: JavaScript Error, not JSError
    }
}

#endif
