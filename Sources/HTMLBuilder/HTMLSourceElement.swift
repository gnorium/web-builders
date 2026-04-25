import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

public class HTMLSourceElement: HTMLElement, @unchecked Sendable {
  public init() {
    super.init("source", selfClosing: true)
  }

  public override init(id: Int32) {
    super.init(id: id)
  }

  public override func callAsFunction(@HTMLBuilder content: () -> [Node]) -> Self {
    return self
  }
}

extension HTMLSourceElement {
  public func src(_ value: String) -> Self { addingAttribute("src", value) }
  public func type(_ value: String) -> Self { addingAttribute("type", value) }
  public func srcset(_ value: String) -> Self { addingAttribute("srcset", value) }
  public func sizes(_ value: String) -> Self { addingAttribute("sizes", value) }
  public func media(_ value: String) -> Self { addingAttribute("media", value) }
}

public func source() -> HTMLSourceElement { HTMLSourceElement() }
