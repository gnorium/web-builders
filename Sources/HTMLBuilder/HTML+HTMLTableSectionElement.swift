import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

extension HTML {
  public class HTMLTableSectionElement: HTMLElement, @unchecked Sendable {
    public init(_ name: String, @HTMLBuilder content: () -> [DOM.Node] = { [] }) {
      super.init(name) { content() }
    }
    public override init(id: Int32) { super.init(id: id) }
  }
}

public func thead(@HTMLBuilder content: () -> [DOM.Node] = { [] }) -> HTML.HTMLTableSectionElement {
  HTML.HTMLTableSectionElement("thead", content: content)
}
public func tbody(@HTMLBuilder content: () -> [DOM.Node] = { [] }) -> HTML.HTMLTableSectionElement {
  HTML.HTMLTableSectionElement("tbody", content: content)
}
public func tfoot(@HTMLBuilder content: () -> [DOM.Node] = { [] }) -> HTML.HTMLTableSectionElement {
  HTML.HTMLTableSectionElement("tfoot", content: content)
}
