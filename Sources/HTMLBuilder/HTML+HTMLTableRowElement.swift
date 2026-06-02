import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

extension HTML {
  public class HTMLTableRowElement: HTMLElement, @unchecked Sendable {
    public init(@HTMLBuilder content: () -> [DOM.Node] = { [] }) { super.init("tr") { content() } }
    public override init(id: Int32) { super.init(id: id) }
  }
}

public func tr(@HTMLBuilder content: () -> [DOM.Node] = { [] }) -> HTML.HTMLTableRowElement {
  HTML.HTMLTableRowElement(content: content)
}
