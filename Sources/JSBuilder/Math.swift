#if CLIENT

import EmbeddedSwiftUtilities

#endif

/// Math namespace - JSContent Math built-in methods
public enum Math {
    public static func min(_ args: JSExpression...) -> JSExpression {
        identifier("Math.min(\(args.map { $0.serialize() }.joinedString(separator: ", ")))").expression
    }

    public static func max(_ args: JSExpression...) -> JSExpression {
        identifier("Math.max(\(args.map { $0.serialize() }.joinedString(separator: ", ")))").expression
    }

    public static func ceil(_ value: JSExpression) -> JSExpression {
        identifier("Math.ceil(\(value.serialize()))").expression
    }

    public static func floor(_ value: JSExpression) -> JSExpression {
        identifier("Math.floor(\(value.serialize()))").expression
    }
}
