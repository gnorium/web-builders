import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

public class HTMLParamElement: HTMLElement, @unchecked Sendable {
  public init() {
    super.init("param", selfClosing: true)
  }

  public override init(id: Int32) {
    super.init(id: id)
  }

  public override func callAsFunction(@HTMLBuilder content: () -> [Node]) -> Self {
    return self
  }
}

extension HTMLParamElement {
  public func name(_ value: String) -> Self { addingAttribute("name", value) }
  public func value(_ value: String) -> Self { addingAttribute("value", value) }
}

public func param() -> HTMLParamElement { HTMLParamElement() }
