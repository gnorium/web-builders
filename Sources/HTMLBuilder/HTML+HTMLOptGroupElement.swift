import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

extension HTML {
  public class HTMLOptGroupElement: HTMLElement, @unchecked Sendable {
    public init(@HTMLBuilder content: () -> [DOM.Node] = { [] }) {
      super.init("optgroup") { content() }
    }

    public override init(id: Int32) {
      super.init(id: id)
    }
  }
}

extension HTML.HTMLOptGroupElement {
  public func label(_ value: String) -> Self { addingAttribute("label", value) }
}

public func optgroup(@HTMLBuilder content: () -> [DOM.Node] = { [] }) -> HTML.HTMLOptGroupElement {
  HTML.HTMLOptGroupElement(content: content)
}
