import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

extension HTML {
  public class HTMLDetailsElement: HTMLElement, @unchecked Sendable {
    public init(@HTMLBuilder content: () -> [DOM.Node] = { [] }) {
      super.init("details") { content() }
    }

    public override init(id: Int32) {
      super.init(id: id)
    }
  }
}

extension HTML.HTMLDetailsElement {
  public func open(_ value: Bool = true) -> Self { value ? addingAttribute("open", "open") : self }
}

public func details(@HTMLBuilder content: () -> [DOM.Node] = { [] }) -> HTML.HTMLDetailsElement {
  HTML.HTMLDetailsElement(content: content)
}
