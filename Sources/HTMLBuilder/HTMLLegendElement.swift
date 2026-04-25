import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

public class HTMLLegendElement: HTMLElement, @unchecked Sendable {
  public init(@HTMLBuilder content: () -> [Node] = { [] }) {
    super.init("legend", inline: true) { content() }
  }

  public override init(id: Int32) {
    super.init(id: id)
  }
}

public func legend(@HTMLBuilder content: () -> [Node] = { [] }) -> HTMLLegendElement {
  HTMLLegendElement(content: content)
}
