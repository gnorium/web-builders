/// Represents an array element setter in JavaScript
/// Used for: view[index] |= value → view[index] = value
public struct JSArrayElementSetter: Sendable, JSValue {
  let element: JSExpression

  public var expression: JSExpression { element }
}
