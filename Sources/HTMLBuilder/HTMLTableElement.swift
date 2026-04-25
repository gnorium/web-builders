import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

public class HTMLTableElement: HTMLElement, @unchecked Sendable {
  public init(@HTMLBuilder content: () -> [Node] = { [] }) {
    super.init("table") { content() }
  }

  public override init(id: Int32) {
    super.init(id: id)
  }
}

public func table(@HTMLBuilder content: () -> [Node] = { [] }) -> HTMLTableElement {
  HTMLTableElement(content: content)
}
