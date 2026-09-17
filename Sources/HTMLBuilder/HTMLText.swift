import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

public class HTMLText: DOM.Text, @unchecked Sendable, ExpressibleByStringInterpolation {
  public init(content: String, isRaw: Bool = false) {
    super.init(content, isRaw: isRaw)
  }

  public override init(id: Int32) {
    super.init(id: id)
  }

  public required convenience init(stringLiteral value: String) {
    self.init(content: value)
  }

  public required convenience init(stringInterpolation: StringInterpolation) {
    self.init(content: stringInterpolation.markup, isRaw: true)
  }

  /// A literal's text is escaped; a node or view interpolated into it is
  /// rendered as markup, so `"\(em("Gnorium")) is …"` reads as written.
  public struct StringInterpolation: StringInterpolationProtocol {
    var markup = ""

    public init(literalCapacity: Int, interpolationCount: Int) {}

    public mutating func appendLiteral(_ literal: String) {
      markup = "\(markup)\(escapeHTMLTextContent(literal))"
    }

    public mutating func appendInterpolation(_ node: DOM.Node) {
      markup = "\(markup)\(node.render())"
    }

    public mutating func appendInterpolation(_ content: some HTMLContent) {
      markup = "\(markup)\(content.build().render())"
    }

    public mutating func appendInterpolation(_ text: String) {
      markup = "\(markup)\(escapeHTMLTextContent(text))"
    }

    public mutating func appendInterpolation(_ number: Int) {
      markup = "\(markup)\(intToString(number))"
    }
  }
}

/// Creates raw HTML content that is rendered without escaping
public func raw(_ content: String) -> HTMLText {
  HTMLText(content: content, isRaw: true)
}
