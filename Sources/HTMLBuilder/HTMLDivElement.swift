import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

public class HTMLDivElement: HTMLElement, @unchecked Sendable {
  public init(@HTMLBuilder content: () -> [Node] = { [] }) {
    super.init("div") { content() }
  }

  public override init(id: Int32) {
    super.init(id: id)
  }
}

public func div(@HTMLBuilder content: () -> [Node] = { [] }) -> HTMLDivElement {
  HTMLDivElement(content: content)
}
