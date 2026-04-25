import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

public class HTMLOptGroupElement: HTMLElement, @unchecked Sendable {
  public init(@HTMLBuilder content: () -> [Node] = { [] }) {
    super.init("optgroup") { content() }
  }

  public override init(id: Int32) {
    super.init(id: id)
  }
}

extension HTMLOptGroupElement {
  public func label(_ value: String) -> Self { addingAttribute("label", value) }
}

public func optgroup(@HTMLBuilder content: () -> [Node] = { [] }) -> HTMLOptGroupElement {
  HTMLOptGroupElement(content: content)
}
