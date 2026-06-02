import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

extension HTML {
  public class HTMLQuoteElement: HTMLElement, @unchecked Sendable {
    public init(_ name: String, @HTMLBuilder content: () -> [DOM.Node] = { [] }) {
      super.init(name, inline: name == "q") { content() }
    }

    public override init(id: Int32) {
      super.init(id: id)
    }
  }
}

extension HTML.HTMLQuoteElement {
  public func cite(_ value: String) -> Self { addingAttribute("cite", value) }
}

public func blockquote(@HTMLBuilder content: () -> [DOM.Node] = { [] }) -> HTML.HTMLQuoteElement {
  HTML.HTMLQuoteElement("blockquote", content: content)
}
public func q(@HTMLBuilder content: () -> [DOM.Node] = { [] }) -> HTML.HTMLQuoteElement {
  HTML.HTMLQuoteElement("q", content: content)
}
