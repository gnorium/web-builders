import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

extension HTML {
  public class HTMLPreElement: HTMLElement, @unchecked Sendable {
    public init(@HTMLBuilder content: () -> [DOM.Node] = { [] }) { super.init("pre") { content() } }
    public override init(id: Int32) { super.init(id: id) }
  }
}

public func pre(@HTMLBuilder content: () -> [DOM.Node] = { [] }) -> HTML.HTMLPreElement {
  HTML.HTMLPreElement(content: content)
}
public func pre(_ text: String) -> HTML.HTMLPreElement { HTML.HTMLPreElement { DOM.Text(text) } }
