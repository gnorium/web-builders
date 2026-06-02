import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

extension HTML {
  public class HTMLLabelElement: HTMLElement, @unchecked Sendable {
    public init(@HTMLBuilder content: () -> [DOM.Node] = { [] }) {
      super.init("label", inline: true) { content() }
    }

    public override init(id: Int32) {
      super.init(id: id)
    }
  }
}

extension HTML.HTMLLabelElement {
  public func `for`(_ value: String) -> Self { addingAttribute("for", value) }
}

public func label(@HTMLBuilder content: () -> [DOM.Node] = { [] }) -> HTML.HTMLLabelElement {
  HTML.HTMLLabelElement(content: content)
}
