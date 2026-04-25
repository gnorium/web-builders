import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

public class HTMLTimeElement: HTMLElement, @unchecked Sendable {
  public init(@HTMLBuilder content: () -> [Node] = { [] }) {
    super.init("time", inline: true) { content() }
  }

  public override init(id: Int32) {
    super.init(id: id)
  }
}

extension HTMLTimeElement {
  public func datetime(_ value: String) -> Self { addingAttribute("datetime", value) }
}

public func time(@HTMLBuilder content: () -> [Node] = { [] }) -> HTMLTimeElement {
  HTMLTimeElement(content: content)
}
