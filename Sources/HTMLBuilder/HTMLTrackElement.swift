import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

public class HTMLTrackElement: HTMLElement, @unchecked Sendable {
  public init() {
    super.init("track", selfClosing: true)
  }

  public override init(id: Int32) {
    super.init(id: id)
  }

  public override func callAsFunction(@HTMLBuilder content: () -> [Node]) -> Self {
    return self
  }
}

extension HTMLTrackElement {
  public func kind(_ value: String) -> Self { addingAttribute("kind", value) }
  public func src(_ value: String) -> Self { addingAttribute("src", value) }
  public func srclang(_ value: String) -> Self { addingAttribute("srclang", value) }
  public func label(_ value: String) -> Self { addingAttribute("label", value) }
  public func `default`(_ value: Bool = true) -> Self {
    value ? addingAttribute("default", "default") : self
  }
}

public func track() -> HTMLTrackElement { HTMLTrackElement() }
