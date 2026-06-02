import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

extension HTML {
  public class HTMLProgressElement: HTMLElement, @unchecked Sendable {
    public init(@HTMLBuilder content: () -> [DOM.Node] = { [] }) {
      super.init("progress", inline: true) { content() }
    }

    public override init(id: Int32) {
      super.init(id: id)
    }
  }
}

extension HTML.HTMLProgressElement {
  public func value(_ value: Double) -> Self { addingAttribute("value", doubleToString(value)) }
  public func max(_ value: Double) -> Self { addingAttribute("max", doubleToString(value)) }
}

public func progress(@HTMLBuilder content: () -> [DOM.Node] = { [] }) -> HTML.HTMLProgressElement {
  HTML.HTMLProgressElement(content: content)
}
