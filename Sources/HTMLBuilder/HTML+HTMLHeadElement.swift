import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

extension HTML {
  public class HTMLHeadElement: HTMLElement, @unchecked Sendable {
    public init(@HTMLBuilder content: () -> [DOM.Node] = { [] }) {
      super.init("head") { content() }
    }
    public override init(id: Int32) { super.init(id: id) }
  }
}

public func head(@HTMLBuilder content: () -> [DOM.Node] = { [] }) -> HTML.HTMLHeadElement {
  HTML.HTMLHeadElement(content: content)
}
