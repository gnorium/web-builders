import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

extension HTML {
  public class HTMLParamElement: HTMLElement, @unchecked Sendable {
    public init() {
      super.init("param", selfClosing: true)
    }

    public override init(id: Int32) {
      super.init(id: id)
    }

    public override func callAsFunction(@HTMLBuilder content: () -> [DOM.Node]) -> Self {
      return self
    }
  }
}

extension HTML.HTMLParamElement {
  public func name(_ value: String) -> Self { addingAttribute("name", value) }
  public func value(_ value: String) -> Self { addingAttribute("value", value) }
}

public func param() -> HTML.HTMLParamElement { HTML.HTMLParamElement() }
