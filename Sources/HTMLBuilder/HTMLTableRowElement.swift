import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

public class HTMLTableRowElement: HTMLElement, @unchecked Sendable {
  public init(@HTMLBuilder content: () -> [Node] = { [] }) {
    super.init("tr") { content() }
  }

  public override init(id: Int32) {
    super.init(id: id)
  }
}

public func tr(@HTMLBuilder content: () -> [Node] = { [] }) -> HTMLTableRowElement {
  HTMLTableRowElement(content: content)
}
