import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

extension HTML {
  public class HTMLHeadingElement: HTMLElement, @unchecked Sendable {
    public init(_ level: Int, @HTMLBuilder content: () -> [DOM.Node] = { [] }) {
      super.init("h\(level)", inline: true) { content() }
    }
    public override init(id: Int32) { super.init(id: id) }
  }
}

public func h1(@HTMLBuilder content: () -> [DOM.Node] = { [] }) -> HTML.HTMLHeadingElement { HTML.HTMLHeadingElement(1, content: content) }
public func h2(@HTMLBuilder content: () -> [DOM.Node] = { [] }) -> HTML.HTMLHeadingElement { HTML.HTMLHeadingElement(2, content: content) }
public func h3(@HTMLBuilder content: () -> [DOM.Node] = { [] }) -> HTML.HTMLHeadingElement { HTML.HTMLHeadingElement(3, content: content) }
public func h4(@HTMLBuilder content: () -> [DOM.Node] = { [] }) -> HTML.HTMLHeadingElement { HTML.HTMLHeadingElement(4, content: content) }
public func h5(@HTMLBuilder content: () -> [DOM.Node] = { [] }) -> HTML.HTMLHeadingElement { HTML.HTMLHeadingElement(5, content: content) }
public func h6(@HTMLBuilder content: () -> [DOM.Node] = { [] }) -> HTML.HTMLHeadingElement { HTML.HTMLHeadingElement(6, content: content) }

public func h1(_ text: String) -> HTML.HTMLHeadingElement { HTML.HTMLHeadingElement(1) { [DOM.Text(text)] } }
public func h2(_ text: String) -> HTML.HTMLHeadingElement { HTML.HTMLHeadingElement(2) { [DOM.Text(text)] } }
public func h3(_ text: String) -> HTML.HTMLHeadingElement { HTML.HTMLHeadingElement(3) { [DOM.Text(text)] } }
public func h4(_ text: String) -> HTML.HTMLHeadingElement { HTML.HTMLHeadingElement(4) { [DOM.Text(text)] } }
public func h5(_ text: String) -> HTML.HTMLHeadingElement { HTML.HTMLHeadingElement(5) { [DOM.Text(text)] } }
public func h6(_ text: String) -> HTML.HTMLHeadingElement { HTML.HTMLHeadingElement(6) { [DOM.Text(text)] } }
