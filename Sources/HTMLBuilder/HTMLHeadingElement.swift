import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

public class HTMLHeadingElement: HTMLElement, @unchecked Sendable {
  public init(_ level: Int, @HTMLBuilder content: () -> [Node] = { [] }) {
    super.init("h\(level)", inline: true) { content() }
  }

  public override init(id: Int32) {
    super.init(id: id)
  }
}

public func h1(@HTMLBuilder content: () -> [Node] = { [] }) -> HTMLHeadingElement {
  HTMLHeadingElement(1, content: content)
}
public func h2(@HTMLBuilder content: () -> [Node] = { [] }) -> HTMLHeadingElement {
  HTMLHeadingElement(2, content: content)
}
public func h3(@HTMLBuilder content: () -> [Node] = { [] }) -> HTMLHeadingElement {
  HTMLHeadingElement(3, content: content)
}
public func h4(@HTMLBuilder content: () -> [Node] = { [] }) -> HTMLHeadingElement {
  HTMLHeadingElement(4, content: content)
}
public func h5(@HTMLBuilder content: () -> [Node] = { [] }) -> HTMLHeadingElement {
  HTMLHeadingElement(5, content: content)
}
public func h6(@HTMLBuilder content: () -> [Node] = { [] }) -> HTMLHeadingElement {
  HTMLHeadingElement(6, content: content)
}
