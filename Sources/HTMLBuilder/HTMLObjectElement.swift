import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

public class HTMLObjectElement: HTMLElement, @unchecked Sendable {
  public init(@HTMLBuilder content: () -> [Node] = { [] }) {
    super.init("object") { content() }
  }

  public override init(id: Int32) {
    super.init(id: id)
  }
}

extension HTMLObjectElement {
  public func data(_ value: String) -> Self { addingAttribute("data", value) }
  public func type(_ value: String) -> Self { addingAttribute("type", value) }
  public func name(_ value: String) -> Self { addingAttribute("name", value) }
  public func usemap(_ value: String) -> Self { addingAttribute("usemap", value) }
  public func form(_ value: String) -> Self { addingAttribute("form", value) }
  public func width(_ value: Int) -> Self { addingAttribute("width", intToString(value)) }
  public func height(_ value: Int) -> Self { addingAttribute("height", intToString(value)) }
}

public func object(@HTMLBuilder content: () -> [Node] = { [] }) -> HTMLObjectElement {
  HTMLObjectElement(content: content)
}
