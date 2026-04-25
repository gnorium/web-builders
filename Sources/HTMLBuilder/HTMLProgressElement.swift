import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

public class HTMLProgressElement: HTMLElement, @unchecked Sendable {
  public init(@HTMLBuilder content: () -> [Node] = { [] }) {
    super.init("progress", inline: true) { content() }
  }

  public override init(id: Int32) {
    super.init(id: id)
  }
}

extension HTMLProgressElement {
  public func value(_ value: Double) -> Self { addingAttribute("value", doubleToString(value)) }
  public func max(_ value: Double) -> Self { addingAttribute("max", doubleToString(value)) }
}

public func progress(@HTMLBuilder content: () -> [Node] = { [] }) -> HTMLProgressElement {
  HTMLProgressElement(content: content)
}
