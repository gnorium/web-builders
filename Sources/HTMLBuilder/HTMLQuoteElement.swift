import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

public class HTMLQuoteElement: HTMLElement, @unchecked Sendable {
  public init(_ name: String, @HTMLBuilder content: () -> [Node] = { [] }) {
    super.init(name, inline: name == "q") { content() }
  }

  public override init(id: Int32) {
    super.init(id: id)
  }
}

extension HTMLQuoteElement {
  public func cite(_ value: String) -> Self { addingAttribute("cite", value) }
}

public func blockquote(@HTMLBuilder content: () -> [Node] = { [] }) -> HTMLQuoteElement {
  HTMLQuoteElement("blockquote", content: content)
}
public func q(@HTMLBuilder content: () -> [Node] = { [] }) -> HTMLQuoteElement {
  HTMLQuoteElement("q", content: content)
}
