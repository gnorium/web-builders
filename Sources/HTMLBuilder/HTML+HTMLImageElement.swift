import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

extension HTML {
  public class HTMLImageElement: HTMLElement, @unchecked Sendable {
    public init() {
      super.init("img", selfClosing: true)
    }

    public override init(id: Int32) {
      super.init(id: id)
    }

    public override func callAsFunction(@HTMLBuilder content: () -> [DOM.Node]) -> Self {
      return self
    }
  }
}

extension HTML.HTMLImageElement {
  public func src(_ value: String) -> Self { addingAttribute("src", value) }
  public func alt(_ value: String) -> Self { addingAttribute("alt", value) }
  public func width(_ value: Int) -> Self { addingAttribute("width", intToString(value)) }
  public func width(_ value: CSS.Length) -> Self { addingAttribute("width", value.value) }
  public func height(_ value: Int) -> Self { addingAttribute("height", intToString(value)) }
  public func height(_ value: CSS.Length) -> Self { addingAttribute("height", value.value) }
  public func loading(_ value: HTML.Loading) -> Self { addingAttribute("loading", value.rawValue) }
}

public func img() -> HTML.HTMLImageElement { HTML.HTMLImageElement() }
