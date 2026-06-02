import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

extension HTML {
  public class HTMLDialogElement: HTMLElement, @unchecked Sendable {
    public init(@HTMLBuilder content: () -> [DOM.Node] = { [] }) {
      super.init("dialog") { content() }
    }

    public override init(id: Int32) {
      super.init(id: id)
    }
  }
}

extension HTML.HTMLDialogElement {
  public func open(_ value: Bool = true) -> Self { value ? addingAttribute("open", "open") : self }
}

public func dialog(@HTMLBuilder content: () -> [DOM.Node] = { [] }) -> HTML.HTMLDialogElement {
  HTML.HTMLDialogElement(content: content)
}
