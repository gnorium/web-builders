import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

public class HTMLSpanElement: HTMLElement, @unchecked Sendable {
  public init(@HTMLBuilder content: () -> [Node] = { [] }) {
    super.init("span", inline: true) { content() }
  }

  public override init(id: Int32) {
    super.init(id: id)
  }
}

public func span(@HTMLBuilder content: () -> [Node] = { [] }) -> HTMLSpanElement {
  HTMLSpanElement(content: content)
}
public func span(_ text: String) -> HTMLSpanElement { HTMLSpanElement { Text(text) } }
