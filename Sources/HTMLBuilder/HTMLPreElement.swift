import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

public class HTMLPreElement: HTMLElement, @unchecked Sendable {
  public init(@HTMLBuilder content: () -> [Node] = { [] }) {
    super.init("pre", inline: true) { content() }
  }

  public override init(id: Int32) {
    super.init(id: id)
  }
}

public func pre(@HTMLBuilder content: () -> [Node] = { [] }) -> HTMLPreElement {
  HTMLPreElement(content: content)
}
public func pre(_ text: String) -> HTMLPreElement { HTMLPreElement { Text(text) } }
