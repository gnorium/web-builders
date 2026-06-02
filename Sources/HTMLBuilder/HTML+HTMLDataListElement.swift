import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

extension HTML {
  public class HTMLDataListElement: HTMLElement, @unchecked Sendable {
    public init(@HTMLBuilder content: () -> [DOM.Node] = { [] }) { super.init("datalist") { content() } }
    public override init(id: Int32) { super.init(id: id) }
  }
}

public func datalist(@HTMLBuilder content: () -> [DOM.Node] = { [] }) -> HTML.HTMLDataListElement {
  HTML.HTMLDataListElement(content: content)
}
