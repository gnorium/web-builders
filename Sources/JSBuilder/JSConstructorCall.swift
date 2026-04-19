#if CLIENT

import EmbeddedSwiftUtilities

#endif

@dynamicMemberLookup
public struct JSConstructorCall: JSValue {
    let className: String
    var args: [JSExpression] = []

    public var expression: JSExpression {
        .new(className, args)
    }

    public func callAsFunction(_ args: JSExpression...) -> JSConstructorCall {
        var copy = self
        copy.args = args
        return copy
    }

    /// Member access for chained property paths: new.window.THREE.Scene
    public subscript(dynamicMember prop: String) -> JSConstructorCall {
        JSConstructorCall(className: "\(className).\(prop)")
    }
}
