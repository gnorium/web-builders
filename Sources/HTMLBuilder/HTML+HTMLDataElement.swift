import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

extension HTML {
  public class HTMLDataElement: HTMLElement, @unchecked Sendable {
    public init(@HTMLBuilder content: () -> [DOM.Node] = { [] }) {
      super.init("data") { content() }
    }

    public override init(id: Int32) {
      super.init(id: id)
    }
  }
}

extension HTML.HTMLDataElement {
  public func value(_ value: String) -> Self { addingAttribute("value", value) }
}

public func data(@HTMLBuilder content: () -> [DOM.Node] = { [] }) -> HTML.HTMLDataElement {
  HTML.HTMLDataElement(content: content)
}
