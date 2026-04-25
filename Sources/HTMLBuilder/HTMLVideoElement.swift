import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

public class HTMLVideoElement: HTMLMediaElement, @unchecked Sendable {
  public init(@HTMLBuilder content: () -> [Node] = { [] }) {
    super.init("video") { content() }
  }

  public override init(id: Int32) {
    super.init(id: id)
  }
}

extension HTMLVideoElement {
  public func width(_ value: Int) -> Self { addingAttribute("width", intToString(value)) }
  public func height(_ value: Int) -> Self { addingAttribute("height", intToString(value)) }
  public func poster(_ value: String) -> Self { addingAttribute("poster", value) }
  public func playsinline(_ value: Bool = true) -> Self {
    value ? addingAttribute("playsinline", "playsinline") : self
  }
}

public func video(@HTMLBuilder content: () -> [Node] = { [] }) -> HTMLVideoElement {
  HTMLVideoElement(content: content)
}
