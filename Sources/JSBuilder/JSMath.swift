#if !os(WASI)


/// Math namespace - JS Math built-in methods
public enum Math {
    public static func min(_ args: JSValue...) -> JSIdentifier {
        JSIdentifier(expression: .call("Math.min", args.map(\.expression)))
    }

    public static func max(_ args: JSValue...) -> JSIdentifier {
        JSIdentifier(expression: .call("Math.max", args.map(\.expression)))
    }

    public static func ceil(_ value: JSValue) -> JSIdentifier {
        JSIdentifier(expression: .call("Math.ceil", [value.expression]))
    }

    public static func floor(_ value: JSValue) -> JSIdentifier {
        JSIdentifier(expression: .call("Math.floor", [value.expression]))
    }
}


#endif
