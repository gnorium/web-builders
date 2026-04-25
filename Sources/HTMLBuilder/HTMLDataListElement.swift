import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

public class HTMLDataListElement: HTMLElement, @unchecked Sendable {
  public init(@HTMLBuilder content: () -> [Node] = { [] }) {
    super.init("datalist") { content() }
  }

  public override init(id: Int32) {
    super.init(id: id)
  }
}

public func datalist(@HTMLBuilder content: () -> [Node] = { [] }) -> HTMLDataListElement {
  HTMLDataListElement(content: content)
}
