import EmbeddedSwiftUtilities

public protocol JSContent: Sendable {
  /// Returns the structured JSStatement representation of the content.
  func render() -> JSStatement

  /// Returns the buildd string representation of the content.
  func build(indent: Int) -> String
}

extension JSContent {
  public func build() -> String { build(indent: 0) }
}

extension [JSStatement]: JSContent {
  public func render() -> JSStatement {
    .block(self)
  }

  public func build(indent: Int = 0) -> String {
    var result = ""
    for (index, item) in self.enumerated() {
      result = "\(result)\(item.build(indent: indent))"
      if index < self.count - 1 {
        result = "\(result)\n"
      }
    }
    return result
  }
}
