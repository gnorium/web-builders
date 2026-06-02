import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

extension HTML {
  public class HTMLTableColElement: HTMLElement, @unchecked Sendable {
    public init(_ name: String) {
      super.init(name, selfClosing: name == "col")
    }

    public override init(id: Int32) {
      super.init(id: id)
    }

    public override func callAsFunction(@HTMLBuilder content: () -> [DOM.Node]) -> Self {
      self.children = content()
      return self
    }
  }
}

extension HTML.HTMLTableColElement {
  public func span(_ value: Int) -> Self { addingAttribute("span", intToString(value)) }
}

public func colgroup(@HTMLBuilder content: () -> [DOM.Node] = { [] }) -> HTML.HTMLTableColElement {
  let group = HTML.HTMLTableColElement("colgroup")
  group.children = content()
  return group
}

public func col() -> HTML.HTMLTableColElement { HTML.HTMLTableColElement("col") }
