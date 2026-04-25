import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

public class HTMLDataElement: HTMLElement, @unchecked Sendable {
  public init(@HTMLBuilder content: () -> [Node] = { [] }) {
    super.init("data") { content() }
  }

  public override init(id: Int32) {
    super.init(id: id)
  }
}

extension HTMLDataElement {
  public func value(_ value: String) -> Self { addingAttribute("value", value) }
}

public func data(@HTMLBuilder content: () -> [Node] = { [] }) -> HTMLDataElement {
  HTMLDataElement(content: content)
}
