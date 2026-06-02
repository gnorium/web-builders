import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

extension HTML {
  public class HTMLBaseElement: HTMLElement, @unchecked Sendable {
    public init() {
      super.init("base", selfClosing: true)
    }

    public override init(id: Int32) {
      super.init(id: id)
    }

    public override func callAsFunction(@HTMLBuilder content: () -> [DOM.Node]) -> Self {
      return self
    }
  }
}

extension HTML.HTMLBaseElement {
  public func href(_ value: String) -> Self { addingAttribute("href", value) }
  public func target(_ value: String) -> Self { addingAttribute("target", value) }
  public func target(_ value: HTML.Target) -> Self { addingAttribute("target", value.rawValue) }
}

public func base() -> HTML.HTMLBaseElement { HTML.HTMLBaseElement() }
