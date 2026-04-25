import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

public class HTMLUListElement: HTMLElement, @unchecked Sendable {
  public init(@HTMLBuilder content: () -> [Node] = { [] }) {
    super.init("ul") { content() }
  }

  public override init(id: Int32) {
    super.init(id: id)
  }
}

public func ul(@HTMLBuilder content: () -> [Node] = { [] }) -> HTMLUListElement {
  HTMLUListElement(content: content)
}
