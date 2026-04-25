import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

public class HTMLBaseElement: HTMLElement, @unchecked Sendable {
  public init() {
    super.init("base", selfClosing: true)
  }

  public override init(id: Int32) {
    super.init(id: id)
  }

  public override func callAsFunction(@HTMLBuilder content: () -> [Node]) -> Self {
    return self
  }
}

extension HTMLBaseElement {
  public func href(_ value: String) -> Self { addingAttribute("href", value) }
  public func target(_ value: String) -> Self { addingAttribute("target", value) }
  public func target(_ value: HTMLTarget) -> Self { addingAttribute("target", value.rawValue) }
}

public func base() -> HTMLBaseElement { HTMLBaseElement() }
