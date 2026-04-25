#if CLIENT
  import EmbeddedSwiftUtilities
#endif

/// JSIdentifier reference (bare names like `memory`, `elem`)
@dynamicMemberLookup
@dynamicCallable
public struct JSIdentifier: JSValue, JSContent {
  let expr: JSExpression

  public init(_ name: String) {
    self.expr = .identifier(name)
  }

  init(expression: JSExpression) {
    self.expr = expression
  }

  public var expression: JSExpression { expr }

  public func render() -> JSStatement { .expression(expr) }

  public func build(indent: Int = 0) -> String {
    JSStatement.expression(expr).build(indent: indent)
  }

  /// Member access: obj.property
  public subscript(dynamicMember prop: String) -> JSIdentifier {
    JSIdentifier(expression: .member(expr, prop))
  }

  /// Method call via dynamic member: obj.methodName(args...)
  public func dynamicallyCall(withArguments args: [JSExpression]) -> JSExpression {
    // When called as a method on a member access, use the member as method name
    if case .member(let obj, let methodName) = expr {
      return .methodCall(obj, methodName, args)
    }
    // Otherwise treat as function call
    if case .identifier(let name) = expr {
      return .call(name, args)
    }
    return .call(expr.build(), args)
  }

  /// Variadic call helper for cleaner syntax
  public func callAsFunction(_ args: JSExpression...) -> JSExpression {
    return dynamicallyCall(withArguments: args)
  }

  /// Method call: obj.method("name", args...) - DEPRECATED: Use obj.methodName(args...) instead
  public func method(_ name: String, _ args: JSExpression...) -> JSIdentifier {
    JSIdentifier(expression: .methodCall(expr, name, args))
  }

  /// Array access: obj[index]
  public subscript(index: JSExpression) -> JSIdentifier {
    JSIdentifier(expression: .arrayAccess(expr, index))
  }
}

/// Create identifier from string
public func identifier(_ name: String) -> JSIdentifier {
  JSIdentifier(name)
}

/// Short helper to create identifiers
public func id(_ name: String) -> JSIdentifier {
  JSIdentifier(name)
}
