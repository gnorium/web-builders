import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

extension HTML {
  public class HTMLTableCaptionElement: HTMLElement, @unchecked Sendable {
    public init(@HTMLBuilder content: () -> [DOM.Node] = { [] }) {
      super.init("caption") { content() }
    }
    public override init(id: Int32) { super.init(id: id) }
  }
}

public func caption(@HTMLBuilder content: () -> [DOM.Node] = { [] }) -> HTML.HTMLTableCaptionElement {
  HTML.HTMLTableCaptionElement(content: content)
}
