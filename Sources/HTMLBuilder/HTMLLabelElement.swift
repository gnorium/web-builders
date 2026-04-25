import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

public class HTMLLabelElement: HTMLElement, @unchecked Sendable {
  public init(@HTMLBuilder content: () -> [Node] = { [] }) {
    super.init("label", inline: true) { content() }
  }

  public override init(id: Int32) {
    super.init(id: id)
  }
}

extension HTMLLabelElement {
  public func `for`(_ value: String) -> Self { addingAttribute("for", value) }
}

public func label(@HTMLBuilder content: () -> [Node] = { [] }) -> HTMLLabelElement {
  HTMLLabelElement(content: content)
}
