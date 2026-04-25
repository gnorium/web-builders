import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

public class HTMLAudioElement: HTMLMediaElement, @unchecked Sendable {
  public init(@HTMLBuilder content: () -> [Node] = { [] }) {
    super.init("audio") { content() }
  }

  public override init(id: Int32) {
    super.init(id: id)
  }
}

public func audio(@HTMLBuilder content: () -> [Node] = { [] }) -> HTMLAudioElement {
  HTMLAudioElement(content: content)
}
