import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

public class HTMLButtonElement: HTMLElement, @unchecked Sendable {
  public init(@HTMLBuilder content: () -> [Node] = { [] }) {
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

extension HTMLButtonElement {
  public func type(_ value: String) -> Self {
    addingAttribute("type", value)
  }

  public func type(_ value: HTMLButton.`Type`) -> Self {
    addingAttribute("type", value.rawValue)
  }

  public func name(_ value: String) -> Self {
    addingAttribute("name", value)
  }

  public func value(_ value: String) -> Self {
    addingAttribute("value", value)
  }
}

public func button(@HTMLBuilder content: () -> [Node] = { [] }) -> HTMLButtonElement {
  HTMLButtonElement(content: content)
}
public func button(_ text: String) -> HTMLButtonElement { HTMLButtonElement { [Text(text)] } }
