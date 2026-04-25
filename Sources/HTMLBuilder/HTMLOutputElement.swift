import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

public class HTMLOutputElement: HTMLElement, @unchecked Sendable {
  public init(@HTMLBuilder content: () -> [Node] = { [] }) {
    super.init("output", inline: true) { content() }
  }

  public override init(id: Int32) {
    super.init(id: id)
  }
}

extension HTMLOutputElement {
  public func `for`(_ value: String) -> Self { addingAttribute("for", value) }
  public func form(_ value: String) -> Self { addingAttribute("form", value) }
  public func name(_ value: String) -> Self { addingAttribute("name", value) }
}

public func output(@HTMLBuilder content: () -> [Node] = { [] }) -> HTMLOutputElement {
  HTMLOutputElement(content: content)
}
