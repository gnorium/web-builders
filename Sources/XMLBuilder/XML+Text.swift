import EmbeddedSwiftUtilities
import WebTypes

extension XML {
  /// Text content node.
  public final class Text: XML.Element, @unchecked Sendable {
    public init(_ value: String) {
      super.init(name: "", text: value)
    }

    public override func render(indent: Int = 0) -> String {
      let ind = stringRepeating(" ", count: indent * 2)
      if let t = text, !stringIsEmpty(t) {
        return "\(ind)\(xmlEscape(t))"
      }
      return ""
    }
  }
}
