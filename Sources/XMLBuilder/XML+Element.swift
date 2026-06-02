import EmbeddedSwiftUtilities
import WebTypes

extension XML {
  /// A single XML element node.
  public class Element: XMLElementBuildable, @unchecked Sendable {
    public let name: String
    public var attributes: [(String, String)]
    public var children: [XML.Element]
    public var text: String?

    public init(name: String, attributes: [(String, String)] = [], text: String? = nil) {
      self.name = name
      self.attributes = attributes
      self.text = text
      self.children = []
    }

    public func addingAttribute(_ key: String, _ value: String) -> Self {
      attributes.append((key, value))
      return self
    }

    public func render(indent: Int = 0) -> String {
      let ind = stringRepeating(" ", count: indent * 2)
      let attrStr = attributeString()
      if let t = text, !stringIsEmpty(t), children.isEmpty {
        return "\(ind)<\(name)\(attrStr)>\(xmlEscape(t))</\(name)>"
      }
      var s = "\(ind)<\(name)\(attrStr)>"
      if let t = text { s += xmlEscape(t) }
      if !children.isEmpty {
        s += "\n"
        s += children.map { $0.render(indent: indent + 1) }.joined(separator: "\n")
        s += "\n\(ind)"
      }
      s += "</\(name)>"
      return s
    }

    func attributeString() -> String {
      guard !attributes.isEmpty else { return "" }
      var result = ""
      for (key, value) in attributes {
        result = "\(result) \(key)=\"\(xmlEscape(value))\""
      }
      return result
    }

    func xmlEscape(_ s: String) -> String {
      XML.Element.escape(s)
    }

    public static func escape(_ s: String) -> String {
      var r = s
      r = stringReplace(r, "&", "&amp;")
      r = stringReplace(r, "<", "&lt;")
      r = stringReplace(r, ">", "&gt;")
      r = stringReplace(r, "\"", "&quot;")
      r = stringReplace(r, "'", "&apos;")
      return r
    }
  }
}
