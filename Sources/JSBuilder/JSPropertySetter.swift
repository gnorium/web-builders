/// Represents a property setter in JavaScript that generates assignment syntax
/// Used for: elem.innerHTML |= value → elem.innerHTML = value
public struct JSPropertySetter: Sendable, JSValue {
    let property: JSExpression

    public var expression: JSExpression { property }
}
