import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

public class HTMLHeadElement: HTMLElement, @unchecked Sendable {
  public init(@HTMLBuilder content: () -> [Node] = { [] }) {
    super.init("head") { content() }
  }

  public override init(id: Int32) {
    super.init(id: id)
  }
}

public func head(@HTMLBuilder content: () -> [Node] = { [] }) -> HTMLHeadElement {
  HTMLHeadElement(content: content)
}
