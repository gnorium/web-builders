import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

extension HTML {
  public class HTMLLegendElement: HTMLElement, @unchecked Sendable {
    public init(@HTMLBuilder content: () -> [DOM.Node] = { [] }) {
      super.init("legend", inline: true) { content() }
    }
    public override init(id: Int32) { super.init(id: id) }
  }
}

public func legend(@HTMLBuilder content: () -> [DOM.Node] = { [] }) -> HTML.HTMLLegendElement {
  HTML.HTMLLegendElement(content: content)
}
