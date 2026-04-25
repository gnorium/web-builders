import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

public class HTMLBRElement: HTMLElement, @unchecked Sendable {
  public init() {
    super.init("br", selfClosing: true)
  }

  public override init(id: Int32) {
    super.init(id: id)
  }

  public override func callAsFunction(@HTMLBuilder content: () -> [Node]) -> Self {
    return self
  }
}

public func br() -> HTMLBRElement { HTMLBRElement() }
