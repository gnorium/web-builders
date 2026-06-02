import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

extension HTML {
  public class HTMLBodyElement: HTMLElement, @unchecked Sendable {
    public init(@HTMLBuilder content: () -> [DOM.Node] = { [] }) {
      super.init("body") { content() }
    }
    public override init(id: Int32) { super.init(id: id) }
  }
}

public func body(@HTMLBuilder content: () -> [DOM.Node] = { [] }) -> HTML.HTMLBodyElement {
  HTML.HTMLBodyElement(content: content)
}
