import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

public class HTMLTitleElement: HTMLElement, @unchecked Sendable {
  public init(_ text: String? = nil) {
    super.init("title") {
      if let text = text { return [Text(text)] }
      return []
    }
  }

  public override init(id: Int32) {
    super.init(id: id)
  }
}

public func title(_ text: String? = nil) -> HTMLTitleElement { HTMLTitleElement(text) }

public func title(@HTMLBuilder content: () -> [Node]) -> HTMLTitleElement {
  let nodes = content()
  let text = nodes.compactMap { $0 as? Text }.map { (node: Text) in node.content }.joined()
  return HTMLTitleElement(text)
}
