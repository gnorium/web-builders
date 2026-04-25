import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

public class HTMLOListElement: HTMLElement, @unchecked Sendable {
  public init(@HTMLBuilder content: () -> [Node] = { [] }) {
    super.init("ol") { content() }
  }

  public override init(id: Int32) {
    super.init(id: id)
  }
}

extension HTMLOListElement {
  public func reversed(_ value: Bool = true) -> Self {
    value ? addingAttribute("reversed", "reversed") : self
  }
  public func start(_ value: Int) -> Self { addingAttribute("start", intToString(value)) }
  public func type(_ value: String) -> Self { addingAttribute("type", value) }
}

public func ol(@HTMLBuilder content: () -> [Node] = { [] }) -> HTMLOListElement {
  HTMLOListElement(content: content)
}
