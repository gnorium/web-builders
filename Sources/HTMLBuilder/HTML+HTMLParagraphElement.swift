import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

extension HTML {
  public class HTMLParagraphElement: HTMLElement, @unchecked Sendable {
    public init(@HTMLBuilder content: () -> [DOM.Node] = { [] }) {
      super.init("p") { content() }
    }
    public override init(id: Int32) { super.init(id: id) }
  }
}

public func p(@HTMLBuilder content: () -> [DOM.Node] = { [] }) -> HTML.HTMLParagraphElement {
  HTML.HTMLParagraphElement(content: content)
}
public func p(_ text: String) -> HTML.HTMLParagraphElement { HTML.HTMLParagraphElement { DOM.Text(text) } }
