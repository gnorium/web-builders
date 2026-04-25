import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

public class HTMLLIElement: HTMLElement, @unchecked Sendable {
  public init(@HTMLBuilder content: () -> [Node] = { [] }) {
    super.init("li") { content() }
  }

  public override init(id: Int32) {
    super.init(id: id)
  }
}

public func li(@HTMLBuilder content: () -> [Node] = { [] }) -> HTMLLIElement {
  HTMLLIElement(content: content)
}
