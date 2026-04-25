#if CLIENT
  import EmbeddedSwiftUtilities
#endif

/// Protocol for anything that can be a JSContent value
public protocol JSValue: Sendable {
  var expression: JSExpression { get }
}

// MARK: - Operator Declarations

precedencegroup JSTernaryPrecedence {
  associativity: right
  higherThan: AssignmentPrecedence
}

infix operator ?> : JSTernaryPrecedence
infix operator |> : JSTernaryPrecedence
infix operator <| : JSTernaryPrecedence
infix operator ?| : JSTernaryPrecedence
infix operator |= : AssignmentPrecedence
infix operator => : AssignmentPrecedence

// MARK: - Literal Conformances

extension Int: JSValue {
  public var expression: JSExpression { .number(Double(self)) }
}

extension Double: JSValue {
  public var expression: JSExpression { .number(self) }
}

extension String: JSValue {
  public var expression: JSExpression { .string(self) }
}

extension Bool: JSValue {
  public var expression: JSExpression { .bool(self) }
}

// MARK: - Operators

/// Postfix increment: varName++
public postfix func ++ (name: String) -> JSExpression {
  .postIncrement(name)
}

/// Assignment with +=
public func += (lhs: JSIdentifier, rhs: JSExpression) -> JSStatement {
  .expression(.compoundAssign("+", lhs.expression, rhs.expression))
}

/// Binary operations
public func + (lhs: JSExpression, rhs: JSExpression) -> JSBinaryOp {
  JSBinaryOp(.binary("+", lhs, rhs))
}

public func - (lhs: JSExpression, rhs: JSExpression) -> JSBinaryOp {
  JSBinaryOp(.binary("-", lhs, rhs))
}

public func * (lhs: JSExpression, rhs: JSExpression) -> JSBinaryOp {
  JSBinaryOp(.binary("*", lhs, rhs))
}

public func / (lhs: JSExpression, rhs: JSExpression) -> JSBinaryOp {
  JSBinaryOp(.binary("/", lhs, rhs))
}

/// Comparison operations
public func > (lhs: JSExpression, rhs: JSExpression) -> JSBinaryOp {
  JSBinaryOp(.binary(">", lhs, rhs))
}

public func < (lhs: JSExpression, rhs: JSExpression) -> JSBinaryOp {
  JSBinaryOp(.binary("<", lhs, rhs))
}

public func >= (lhs: JSExpression, rhs: JSExpression) -> JSBinaryOp {
  JSBinaryOp(.binary(">=", lhs, rhs))
}

public func <= (lhs: JSExpression, rhs: JSExpression) -> JSBinaryOp {
  JSBinaryOp(.binary("<=", lhs, rhs))
}

public func == (lhs: JSExpression, rhs: JSExpression) -> JSBinaryOp {
  JSBinaryOp(.binary("===", lhs, rhs))
}

public func != (lhs: JSExpression, rhs: JSExpression) -> JSBinaryOp {
  JSBinaryOp(.binary("!==", lhs, rhs))
}

/// Logical operations
public func && (lhs: JSExpression, rhs: JSExpression) -> JSBinaryOp {
  JSBinaryOp(.binary("&&", lhs, rhs))
}

public func || (lhs: JSExpression, rhs: JSExpression) -> JSBinaryOp {
  JSBinaryOp(.binary("||", lhs, rhs))
}

/// In operator for JSContent: "property" <| object
public func <| (_ lhs: JSExpression, _ rhs: JSExpression) -> JSBinaryOp {
  JSBinaryOp(.binary("in", lhs, rhs))
}

/// Wrapper for binary operations
public struct JSBinaryOp: JSValue {
  public let expression: JSExpression
  init(_ expr: JSExpression) { self.expression = expr }
}

/// Unary not: !expr
public prefix func ! (value: JSExpression) -> JSUnaryOp {
  JSUnaryOp(.unary("!", value))
}

public struct JSUnaryOp: JSValue {
  public let expression: JSExpression
  init(_ expr: JSExpression) { self.expression = expr }
}

/// Ternary operator: condition ?> trueValue |> falseValue
/// Using double arrow ?> and vertical bar |>
public struct JSTernaryIntermediate: JSValue {
  let condition: JSExpression
  let trueExpr: JSExpression

  public var expression: JSExpression {
    .ternary(condition, trueExpr, .bool(false))
  }

  public static func |> (lhs: JSTernaryIntermediate, rhs: JSExpression) -> JSExpression {
    .ternary(lhs.condition, lhs.trueExpr, rhs)
  }
}

public func ?> (condition: JSExpression, trueValue: JSExpression) -> JSTernaryIntermediate {
  JSTernaryIntermediate(condition: condition, trueExpr: trueValue)
}
