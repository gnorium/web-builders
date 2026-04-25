import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

public class HTMLDListElement: HTMLElement, @unchecked Sendable {
  public init(@HTMLBuilder content: () -> [Node] = { [] }) {
    super.init("dl") { content() }
  }

  public override init(id: Int32) {
    super.init(id: id)
  }
}

public func dl(@HTMLBuilder content: () -> [Node] = { [] }) -> HTMLDListElement {
  HTMLDListElement(content: content)
}
