import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

public class HTMLSummaryElement: HTMLElement, @unchecked Sendable {
  public init(@HTMLBuilder content: () -> [Node] = { [] }) {
    super.init("summary", inline: true) { content() }
  }

  public override init(id: Int32) {
    super.init(id: id)
  }
}

public func summary(@HTMLBuilder content: () -> [Node] = { [] }) -> HTMLSummaryElement {
  HTMLSummaryElement(content: content)
}
public func summary(_ text: String) -> HTMLSummaryElement { HTMLSummaryElement { Text(text) } }
