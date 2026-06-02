import EmbeddedSwiftUtilities
import WebTypes

extension XML {
  /// XML comment node.
  public final class Comment: XML.Element, @unchecked Sendable {
    public init(_ value: String) {
      super.init(name: "--\(value)--")
    }

    public override func render(indent: Int = 0) -> String {
      let ind = stringRepeating(" ", count: indent * 2)
      if let t = text {
        return "\(ind)<!--\(t)-->"
      }
      return ""
    }
  }
}
