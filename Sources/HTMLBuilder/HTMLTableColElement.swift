import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

public class HTMLTableColElement: HTMLElement, @unchecked Sendable {
  public init(_ name: String) {
    super.init(name, selfClosing: name == "col")
  }

  public override init(id: Int32) {
    super.init(id: id)
  }

  public override func callAsFunction(@HTMLBuilder content: () -> [Node]) -> Self {
    self.children = content()
    return self
  }
}

extension HTMLTableColElement {
  public func span(_ value: Int) -> Self { addingAttribute("span", intToString(value)) }
}

public func colgroup(@HTMLBuilder content: () -> [Node] = { [] }) -> HTMLTableColElement {
  let group = HTMLTableColElement("colgroup")
  group.children = content()
  return group
}

public func col() -> HTMLTableColElement { HTMLTableColElement("col") }
