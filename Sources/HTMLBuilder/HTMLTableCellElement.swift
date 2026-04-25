import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

public class HTMLTableCellElement: HTMLElement, @unchecked Sendable {
  public init(_ name: String, @HTMLBuilder content: () -> [Node] = { [] }) {
    super.init(name) { content() }
  }

  public override init(id: Int32) {
    super.init(id: id)
  }
}

extension HTMLTableCellElement {
  public func colspan(_ value: Int) -> Self { addingAttribute("colspan", intToString(value)) }
  public func rowspan(_ value: Int) -> Self { addingAttribute("rowspan", intToString(value)) }
  public func headers(_ value: String) -> Self { addingAttribute("headers", value) }
  public func scope(_ value: HTMLScope) -> Self { addingAttribute("scope", value.rawValue) }
}

public func th(@HTMLBuilder content: () -> [Node] = { [] }) -> HTMLTableCellElement {
  HTMLTableCellElement("th", content: content)
}
public func td(@HTMLBuilder content: () -> [Node] = { [] }) -> HTMLTableCellElement {
  HTMLTableCellElement("td", content: content)
}
