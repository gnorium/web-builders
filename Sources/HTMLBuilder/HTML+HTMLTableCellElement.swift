import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

extension HTML {
  public class HTMLTableCellElement: HTMLElement, @unchecked Sendable {
    public init(_ name: String, @HTMLBuilder content: () -> [DOM.Node] = { [] }) {
      super.init(name) { content() }
    }

    public override init(id: Int32) {
      super.init(id: id)
    }
  }
}

extension HTML.HTMLTableCellElement {
  public func colspan(_ value: Int) -> Self { addingAttribute("colspan", intToString(value)) }
  public func rowspan(_ value: Int) -> Self { addingAttribute("rowspan", intToString(value)) }
  public func headers(_ value: String) -> Self { addingAttribute("headers", value) }
  public func scope(_ value: HTML.Scope) -> Self { addingAttribute("scope", value.rawValue) }
}

public func th(@HTMLBuilder content: () -> [DOM.Node] = { [] }) -> HTML.HTMLTableCellElement {
  HTML.HTMLTableCellElement("th", content: content)
}
public func td(@HTMLBuilder content: () -> [DOM.Node] = { [] }) -> HTML.HTMLTableCellElement {
  HTML.HTMLTableCellElement("td", content: content)
}

public func th(_ text: String) -> HTML.HTMLTableCellElement { HTML.HTMLTableCellElement("th") { [DOM.Text(text)] } }
public func td(_ text: String) -> HTML.HTMLTableCellElement { HTML.HTMLTableCellElement("td") { [DOM.Text(text)] } }
