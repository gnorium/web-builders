import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

extension HTML {
  public class HTMLOListElement: HTMLElement, @unchecked Sendable {
    public init(@HTMLBuilder content: () -> [DOM.Node] = { [] }) { super.init("ol") { content() } }
    public override init(id: Int32) { super.init(id: id) }
  }
}

public func ol(@HTMLBuilder content: () -> [DOM.Node] = { [] }) -> HTML.HTMLOListElement {
  HTML.HTMLOListElement(content: content)
}
