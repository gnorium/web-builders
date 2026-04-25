import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

public class HTMLMeterElement: HTMLElement, @unchecked Sendable {
  public init(@HTMLBuilder content: () -> [Node] = { [] }) {
    super.init("meter", inline: true) { content() }
  }

  public override init(id: Int32) {
    super.init(id: id)
  }
}

extension HTMLMeterElement {
  public func value(_ value: Double) -> Self { addingAttribute("value", doubleToString(value)) }
  public func min(_ value: Double) -> Self { addingAttribute("min", doubleToString(value)) }
  public func max(_ value: Double) -> Self { addingAttribute("max", doubleToString(value)) }
  public func low(_ value: Double) -> Self { addingAttribute("low", doubleToString(value)) }
  public func high(_ value: Double) -> Self { addingAttribute("high", doubleToString(value)) }
  public func optimum(_ value: Double) -> Self { addingAttribute("optimum", doubleToString(value)) }
  public func form(_ value: String) -> Self { addingAttribute("form", value) }
}

public func meter(@HTMLBuilder content: () -> [Node] = { [] }) -> HTMLMeterElement {
  HTMLMeterElement(content: content)
}
