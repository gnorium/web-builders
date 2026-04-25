/// A generic handshake protocol that allows specialized CSS content
/// to be flattened into a unified CSSRule representation.
public protocol CSSRuleConvertible: Sendable {
  @CSSOMBuilder func render() -> CSSRule
}

extension CSSRuleConvertible {
  public func build(indent: Int = 0) -> String {
    render().build(indent: indent)
  }
}
