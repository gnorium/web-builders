import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

public class HTMLText: Text, @unchecked Sendable {
  public init(content: String, isRaw: Bool = false) {
    super.init(content, isRaw: isRaw)
  }

  public override init(id: Int32) {
    super.init(id: id)
  }
}

/// Creates raw HTML content that is rendered without escaping
public func raw(_ content: String) -> HTMLText {
  HTMLText(content: content, isRaw: true)
}
