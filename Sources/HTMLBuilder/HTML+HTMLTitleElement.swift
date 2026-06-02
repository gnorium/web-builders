import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

extension HTML {
  public class HTMLTitleElement: HTMLElement, @unchecked Sendable {
    public init(@HTMLBuilder content: () -> [DOM.Node] = { [] }) { super.init("title") { content() } }
    public override init(id: Int32) { super.init(id: id) }
  }
}

public func title(@HTMLBuilder content: () -> [DOM.Node] = { [] }) -> HTML.HTMLTitleElement {
  HTML.HTMLTitleElement(content: content)
}

public func title(_ text: String) -> HTML.HTMLTitleElement {
  HTML.HTMLTitleElement { [DOM.Text(text)] }
}
