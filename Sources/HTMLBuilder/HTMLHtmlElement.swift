import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

public class HTMLHtmlElement: HTMLElement, @unchecked Sendable {
  public init(@HTMLBuilder content: () -> [Node] = { [] }) {
    super.init("html") { content() }
  }

  public override init(id: Int32) {
    super.init(id: id)
  }
}

public func html(@HTMLBuilder content: () -> [Node] = { [] }) -> HTMLHtmlElement {
  HTMLHtmlElement(content: content)
}
