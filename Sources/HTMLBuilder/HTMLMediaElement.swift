import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

public class HTMLMediaElement: HTMLElement, @unchecked Sendable {
  public init(_ name: String, @HTMLBuilder content: () -> [Node] = { [] }) {
    super.init(name) { content() }
  }

  public override init(id: Int32) {
    super.init(id: id)
  }
}

extension HTMLMediaElement {
  public func src(_ value: String) -> Self { addingAttribute("src", value) }
  public func preload(_ value: String) -> Self { addingAttribute("preload", value) }
  public func autoplay(_ value: Bool = true) -> Self {
    value ? addingAttribute("autoplay", "autoplay") : self
  }
  public func loop(_ value: Bool = true) -> Self { value ? addingAttribute("loop", "loop") : self }
  public func muted(_ value: Bool = true) -> Self {
    value ? addingAttribute("muted", "muted") : self
  }
  public func controls(_ value: Bool = true) -> Self {
    value ? addingAttribute("controls", "controls") : self
  }
}
