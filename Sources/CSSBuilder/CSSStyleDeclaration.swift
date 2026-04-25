/// Interface: CSSStyleDeclaration (W3C CSSOM)
/// Base class for objects that represent CSS declaration blocks.
open class CSSStyleDeclaration: @unchecked Sendable {
  public init() {}

  open func getPropertyValue(_ property: String) -> String {
    return ""
  }

  open func setProperty(_ property: String, _ value: String, _ priority: String = "") {
    // To be overridden by subclasses (e.g., DOM-backed CSSStyleProperties)
  }

  open func removeProperty(_ property: String) -> String {
    return ""
  }

  /// Helper to set a declaration instance directly
  public func set(_ declaration: CSSDeclaration) {
    setProperty(declaration.property, declaration.value, declaration.isImportant ? "important" : "")
  }
}
