import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

public class HTMLParagraphElement: HTMLElement, @unchecked Sendable {
  public init(@HTMLBuilder content: () -> [Node] = { [] }) {
    super.init("p", inline: true) { content() }
  }

  public override init(id: Int32) {
    super.init(id: id)
  }
}

public func p(@HTMLBuilder content: () -> [Node] = { [] }) -> HTMLParagraphElement {
  HTMLParagraphElement(content: content)
}
public func p(_ text: String) -> HTMLParagraphElement { HTMLParagraphElement { Text(text) } }
