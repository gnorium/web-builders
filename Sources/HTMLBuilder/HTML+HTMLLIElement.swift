import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

extension HTML {
  public class HTMLLIElement: HTMLElement, @unchecked Sendable {
    public init(@HTMLBuilder content: () -> [DOM.Node] = { [] }) { super.init("li") { content() } }
    public override init(id: Int32) { super.init(id: id) }
  }
}

public func li(@HTMLBuilder content: () -> [DOM.Node] = { [] }) -> HTML.HTMLLIElement {
  HTML.HTMLLIElement(content: content)
}

public func li(_ text: String) -> HTML.HTMLLIElement { HTML.HTMLLIElement { [DOM.Text(text)] } }
