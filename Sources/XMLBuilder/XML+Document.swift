import EmbeddedSwiftUtilities
import WebTypes

extension XML {
  /// Top-level XML document.
  public struct Document: Sendable {
    public let root: XML.Element
    public let declaration: String
    public let namespace: String?

    public init(
      root: XML.Element,
      declaration: String = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>",
      namespace: String? = nil
    ) {
      self.root = root
      self.declaration = declaration
      self.namespace = namespace
    }

    public func render() -> String {
      if let ns = namespace { _ = root.addingAttribute("xmlns", ns) }
      var lines: [String] = []
      if !stringIsEmpty(declaration) { lines.append(declaration) }
      lines.append(root.render(indent: 0))
      return lines.joined(separator: "\n")
    }
  }
}
