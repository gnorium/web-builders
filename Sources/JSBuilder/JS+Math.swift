#if CLIENT
  import EmbeddedSwiftUtilities
#endif
import WebTypes

extension JS {
  /// JavaScript Math built-in namespace
  public enum Math {
    public static func min(_ args: JSExpression...) -> JSExpression {
      identifier("Math.min(\(args.map { $0.build() }.joinedString(separator: ", ")))").expression
    }

    public static func max(_ args: JSExpression...) -> JSExpression {
      identifier("Math.max(\(args.map { $0.build() }.joinedString(separator: ", ")))").expression
    }

    public static func ceil(_ value: JSExpression) -> JSExpression {
      identifier("Math.ceil(\(value.build()))").expression
    }

    public static func floor(_ value: JSExpression) -> JSExpression {
      identifier("Math.floor(\(value.build()))").expression
    }
  }
}
