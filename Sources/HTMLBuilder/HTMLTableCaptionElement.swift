import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

public class HTMLTableCaptionElement: HTMLElement, @unchecked Sendable {
  public init(@HTMLBuilder content: () -> [Node] = { [] }) {
    super.init("caption") { content() }
  }

  public override init(id: Int32) {
    super.init(id: id)
  }
}

public func caption(@HTMLBuilder content: () -> [Node] = { [] }) -> HTMLTableCaptionElement {
  HTMLTableCaptionElement(content: content)
}
