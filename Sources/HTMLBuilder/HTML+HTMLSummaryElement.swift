import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

extension HTML {
  public class HTMLSummaryElement: HTMLElement, @unchecked Sendable {
    public init(@HTMLBuilder content: () -> [DOM.Node] = { [] }) {
      super.init("summary", inline: true) { content() }
    }
    public override init(id: Int32) { super.init(id: id) }
  }
}

public func summary(@HTMLBuilder content: () -> [DOM.Node] = { [] }) -> HTML.HTMLSummaryElement {
  HTML.HTMLSummaryElement(content: content)
}
public func summary(_ text: String) -> HTML.HTMLSummaryElement { HTML.HTMLSummaryElement { DOM.Text(text) } }
