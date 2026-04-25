import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

public class HTMLDetailsElement: HTMLElement, @unchecked Sendable {
  public init(@HTMLBuilder content: () -> [Node] = { [] }) {
    super.init("details") { content() }
  }

  public override init(id: Int32) {
    super.init(id: id)
  }
}

extension HTMLDetailsElement {
  public func open(_ value: Bool = true) -> Self { value ? addingAttribute("open", "open") : self }
}

public func details(@HTMLBuilder content: () -> [Node] = { [] }) -> HTMLDetailsElement {
  HTMLDetailsElement(content: content)
}
