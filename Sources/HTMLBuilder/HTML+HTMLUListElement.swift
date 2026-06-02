import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

extension HTML {
  public class HTMLUListElement: HTMLElement, @unchecked Sendable {
    public init(@HTMLBuilder content: () -> [DOM.Node] = { [] }) { super.init("ul") { content() } }
    public override init(id: Int32) { super.init(id: id) }
  }
}

public func ul(@HTMLBuilder content: () -> [DOM.Node] = { [] }) -> HTML.HTMLUListElement {
  HTML.HTMLUListElement(content: content)
}
