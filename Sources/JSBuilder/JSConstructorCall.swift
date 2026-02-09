#if !os(WASI)

@dynamicMemberLookup
public struct JSConstructorCall: JSValueProtocol {
    let className: String
    var args: [JSExpression] = []

    public var expression: JSExpression {
        .new(className, args)
    }

    public func callAsFunction(_ args: any JSValueProtocol...) -> JSConstructorCall {
        var copy = self
        copy.args = args.map(\.expression)
        return copy
    }

    /// Member access for chained property paths: new.window.THREE.Scene
    public subscript(dynamicMember prop: String) -> JSConstructorCall {
        JSConstructorCall(className: "\(className).\(prop)")
    }
}

#endif
