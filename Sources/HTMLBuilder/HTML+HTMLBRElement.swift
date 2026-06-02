import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

extension HTML {
  public class HTMLBRElement: HTMLElement, @unchecked Sendable {
    public init() { super.init("br", selfClosing: true) }
    public override init(id: Int32) { super.init(id: id) }
  }
}

public func br() -> HTML.HTMLBRElement { HTML.HTMLBRElement() }
