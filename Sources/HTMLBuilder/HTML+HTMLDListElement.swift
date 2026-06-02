import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

extension HTML {
  public class HTMLDListElement: HTMLElement, @unchecked Sendable {
    public init(@HTMLBuilder content: () -> [DOM.Node] = { [] }) { super.init("dl") { content() } }
    public override init(id: Int32) { super.init(id: id) }
  }
}

public func dl(@HTMLBuilder content: () -> [DOM.Node] = { [] }) -> HTML.HTMLDListElement {
  HTML.HTMLDListElement(content: content)
}
