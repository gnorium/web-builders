import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

public class HTMLHRElement: HTMLElement, @unchecked Sendable {
  public init() {
    super.init("hr", selfClosing: true)
  }

  public override init(id: Int32) {
    super.init(id: id)
  }

  public override func callAsFunction(@HTMLBuilder content: () -> [Node]) -> Self {
    return self
  }
}

public func hr() -> HTMLHRElement { HTMLHRElement() }
