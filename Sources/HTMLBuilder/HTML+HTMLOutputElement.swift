import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

extension HTML {
  public class HTMLOutputElement: HTMLElement, @unchecked Sendable {
    public init(@HTMLBuilder content: () -> [DOM.Node] = { [] }) {
      super.init("output", inline: true) { content() }
    }

    public override init(id: Int32) {
      super.init(id: id)
    }
  }
}

extension HTML.HTMLOutputElement {
  public func `for`(_ value: String) -> Self { addingAttribute("for", value) }
  public func form(_ value: String) -> Self { addingAttribute("form", value) }
  public func name(_ value: String) -> Self { addingAttribute("name", value) }
}

public func output(@HTMLBuilder content: () -> [DOM.Node] = { [] }) -> HTML.HTMLOutputElement {
  HTML.HTMLOutputElement(content: content)
}
