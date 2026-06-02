import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

extension HTML {
  public class HTMLTimeElement: HTMLElement, @unchecked Sendable {
    public init(@HTMLBuilder content: () -> [DOM.Node] = { [] }) {
      super.init("time", inline: true) { content() }
    }

    public override init(id: Int32) {
      super.init(id: id)
    }
  }
}

extension HTML.HTMLTimeElement {
  public func datetime(_ value: String) -> Self { addingAttribute("datetime", value) }
}

public func time(@HTMLBuilder content: () -> [DOM.Node] = { [] }) -> HTML.HTMLTimeElement {
  HTML.HTMLTimeElement(content: content)
}
