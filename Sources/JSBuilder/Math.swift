/// Math namespace - JSContent Math built-in methods
public enum Math {
    public static func min(_ args: JSExpression...) -> JSIdentifier {
        identifier("Math.min(\(args.map { $0.render() }.joinedString(separator: ", ")))")
    }

    public static func max(_ args: JSExpression...) -> JSIdentifier {
        identifier("Math.max(\(args.map { $0.render() }.joinedString(separator: ", ")))")
    }

    public static func ceil(_ value: JSExpression) -> JSIdentifier {
        identifier("Math.ceil(\(value.render()))")
    }

    public static func floor(_ value: JSExpression) -> JSIdentifier {
        identifier("Math.floor(\(value.render()))")
    }
}
