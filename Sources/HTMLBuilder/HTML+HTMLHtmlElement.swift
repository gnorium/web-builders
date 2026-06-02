import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

extension HTML {
  public class HTMLHtmlElement: HTMLElement, @unchecked Sendable {
    public init(@HTMLBuilder content: () -> [DOM.Node] = { [] }) {
      super.init("html") { content() }
    }
    public override init(id: Int32) { super.init(id: id) }
  }
}

public func html(@HTMLBuilder content: () -> [DOM.Node] = { [] }) -> HTML.HTMLHtmlElement {
  HTML.HTMLHtmlElement(content: content)
}
