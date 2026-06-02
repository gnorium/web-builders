import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

extension HTML {
  public class HTMLFieldSetElement: HTMLElement, @unchecked Sendable {
    public init(@HTMLBuilder content: () -> [DOM.Node] = { [] }) {
      super.init("fieldset") { content() }
    }

    public override init(id: Int32) {
      super.init(id: id)
    }
  }
}

extension HTML.HTMLFieldSetElement {
  public func form(_ value: String) -> Self { addingAttribute("form", value) }
  public func name(_ value: String) -> Self { addingAttribute("name", value) }
}

public func fieldset(@HTMLBuilder content: () -> [DOM.Node] = { [] }) -> HTML.HTMLFieldSetElement {
  HTML.HTMLFieldSetElement(content: content)
}
