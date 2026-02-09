#if !os(WASI)

/// Represents a property setter in JavaScript that generates assignment syntax
/// Used for: elem.innerHTML |= value → elem.innerHTML = value
public struct JSPropertySetter: Sendable, JSValueProtocol {
    let property: JSExpression

    public var expression: JSExpression { property }
}

/// Represents an array element setter in JavaScript
/// Used for: view[index] |= value → view[index] = value
public struct JSArrayElementSetter: Sendable, JSValueProtocol {
    let element: JSExpression

    public var expression: JSExpression { element }
}

#endif
