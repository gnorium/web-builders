import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

extension HTML {
  public class HTMLSpanElement: HTMLElement, @unchecked Sendable {
    public init(@HTMLBuilder content: () -> [DOM.Node] = { [] }) {
      super.init("span", inline: true) { content() }
    }
    public override init(id: Int32) { super.init(id: id) }
  }
}

public func span(@HTMLBuilder content: () -> [DOM.Node] = { [] }) -> HTML.HTMLSpanElement {
  HTML.HTMLSpanElement(content: content)
}
public func span(_ text: String) -> HTML.HTMLSpanElement { HTML.HTMLSpanElement { DOM.Text(text) } }
