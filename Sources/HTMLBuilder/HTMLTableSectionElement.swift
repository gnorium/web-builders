import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

public class HTMLTableSectionElement: HTMLElement, @unchecked Sendable {
  public init(_ name: String, @HTMLBuilder content: () -> [Node] = { [] }) {
    super.init(name) { content() }
  }

  public override init(id: Int32) {
    super.init(id: id)
  }
}

public func thead(@HTMLBuilder content: () -> [Node] = { [] }) -> HTMLTableSectionElement {
  HTMLTableSectionElement("thead", content: content)
}
public func tbody(@HTMLBuilder content: () -> [Node] = { [] }) -> HTMLTableSectionElement {
  HTMLTableSectionElement("tbody", content: content)
}
public func tfoot(@HTMLBuilder content: () -> [Node] = { [] }) -> HTMLTableSectionElement {
  HTMLTableSectionElement("tfoot", content: content)
}
