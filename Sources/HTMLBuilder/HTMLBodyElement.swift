import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

public class HTMLBodyElement: HTMLElement, @unchecked Sendable {
  public init(@HTMLBuilder content: () -> [Node] = { [] }) {
    super.init("body") { content() }
  }

  public override init(id: Int32) {
    super.init(id: id)
  }
}

public func body(@HTMLBuilder content: () -> [Node] = { [] }) -> HTMLBodyElement {
  HTMLBodyElement(content: content)
}
