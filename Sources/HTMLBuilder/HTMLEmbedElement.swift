import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

public class HTMLEmbedElement: HTMLElement, @unchecked Sendable {
  public init() {
    super.init("embed", selfClosing: true)
  }

  public override init(id: Int32) {
    super.init(id: id)
  }

  public override func callAsFunction(@HTMLBuilder content: () -> [Node]) -> Self {
    return self
  }
}

extension HTMLEmbedElement {
  public func src(_ value: String) -> Self { addingAttribute("src", value) }
  public func type(_ value: String) -> Self { addingAttribute("type", value) }
  public func width(_ value: Int) -> Self { addingAttribute("width", intToString(value)) }
  public func height(_ value: Int) -> Self { addingAttribute("height", intToString(value)) }
}

public func embed() -> HTMLEmbedElement { HTMLEmbedElement() }
