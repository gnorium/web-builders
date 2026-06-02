import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

extension HTML {
  public class HTMLHRElement: HTMLElement, @unchecked Sendable {
    public init() { super.init("hr", selfClosing: true) }
    public override init(id: Int32) { super.init(id: id) }
  }
}

public func hr() -> HTML.HTMLHRElement { HTML.HTMLHRElement() }
