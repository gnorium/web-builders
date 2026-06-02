import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

extension HTML {
  public class HTMLButtonElement: HTMLElement, @unchecked Sendable {
    public init(@HTMLBuilder content: () -> [DOM.Node] = { [] }) {
      super.init("button") { content() }
    }

    public override init(id: Int32) {
      super.init(id: id)
    }

    #if CLIENT
      public var disabled: Bool {
        get { element_getDisabled(id) != 0 }
        set { element_setDisabled(id, newValue ? 1 : 0) }
      }
    #endif
  }
}

extension HTML.HTMLButtonElement {
  public func type(_ value: String) -> Self {
    addingAttribute("type", value)
  }

  public func type(_ value: HTML.Button.`Type`) -> Self {
    addingAttribute("type", value.rawValue)
  }

  public func name(_ value: String) -> Self {
    addingAttribute("name", value)
  }

  public func value(_ value: String) -> Self {
    addingAttribute("value", value)
  }
}

public func button(@HTMLBuilder content: () -> [DOM.Node] = { [] }) -> HTML.HTMLButtonElement {
  HTML.HTMLButtonElement(content: content)
}
public func button(_ text: String) -> HTML.HTMLButtonElement { HTML.HTMLButtonElement { [DOM.Text(text)] } }
