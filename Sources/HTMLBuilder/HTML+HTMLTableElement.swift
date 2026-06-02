import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

extension HTML {
  public class HTMLTableElement: HTMLElement, @unchecked Sendable {
    public init(@HTMLBuilder content: () -> [DOM.Node] = { [] }) { super.init("table") { content() } }
    public override init(id: Int32) { super.init(id: id) }
  }
}

public func table(@HTMLBuilder content: () -> [DOM.Node] = { [] }) -> HTML.HTMLTableElement {
  HTML.HTMLTableElement(content: content)
}
