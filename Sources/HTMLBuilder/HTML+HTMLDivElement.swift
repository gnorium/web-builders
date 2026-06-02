import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

extension HTML {
  public class HTMLDivElement: HTMLElement, @unchecked Sendable {
    public init(@HTMLBuilder content: () -> [DOM.Node] = { [] }) {
      super.init("div") { content() }
    }
    public override init(id: Int32) { super.init(id: id) }
  }
}

public func div(@HTMLBuilder content: () -> [DOM.Node] = { [] }) -> HTML.HTMLDivElement {
  HTML.HTMLDivElement(content: content)
}
