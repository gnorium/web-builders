import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

public class HTMLDialogElement: HTMLElement, @unchecked Sendable {
  public init(@HTMLBuilder content: () -> [Node] = { [] }) {
    super.init("dialog") { content() }
  }

  public override init(id: Int32) {
    super.init(id: id)
  }
}

extension HTMLDialogElement {
  public func open(_ value: Bool = true) -> Self { value ? addingAttribute("open", "open") : self }
}

public func dialog(@HTMLBuilder content: () -> [Node] = { [] }) -> HTMLDialogElement {
  HTMLDialogElement(content: content)
}
