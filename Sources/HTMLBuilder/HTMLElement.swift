import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

public class HTMLElement: Element, HTMLElementBuildable, @unchecked Sendable {
  public init(
    _ name: String, selfClosing: Bool = false, @HTMLBuilder content: () -> [Node] = { [] }
  ) {
    super.init(ns: .html, tag: name, children: content(), selfClosing: selfClosing, inline: false)
  }

  public init(_ name: String, inline: Bool, @HTMLBuilder content: () -> [Node] = { [] }) {
    super.init(ns: .html, tag: name, children: content(), selfClosing: false, inline: inline)
  }

  public override init(id: Int32) {
    super.init(id: id)
  }

  open func callAsFunction(@HTMLBuilder content: () -> [Node]) -> Self {
    self.children = content()
    return self
  }

  open func id(_ value: String) -> Self { addingAttribute("id", value) }
  open func `class`(_ value: String) -> Self { addingAttribute("class", value) }
  open func title(_ value: String) -> Self { addingAttribute("title", value) }
  open func lang(_ value: String) -> Self { addingAttribute("lang", value) }
  open func dir(_ value: String) -> Self { addingAttribute("dir", value) }
  open func hidden(_ value: Bool = true) -> Self {
    value ? addingAttribute("hidden", "hidden") : self
  }
  open func disabled(_ value: Bool = true) -> Self {
    value ? addingAttribute("disabled", "disabled") : self
  }
}

// MARK: - Global Factory Functions

public func noscript(@HTMLBuilder content: () -> [Node] = { [] }) -> HTMLElement {
  HTMLElement("noscript", content: content)
}
public func section(@HTMLBuilder content: () -> [Node] = { [] }) -> HTMLElement {
  HTMLElement("section", content: content)
}
public func nav(@HTMLBuilder content: () -> [Node] = { [] }) -> HTMLElement {
  HTMLElement("nav", content: content)
}
public func article(@HTMLBuilder content: () -> [Node] = { [] }) -> HTMLElement {
  HTMLElement("article", content: content)
}
public func aside(@HTMLBuilder content: () -> [Node] = { [] }) -> HTMLElement {
  HTMLElement("aside", content: content)
}
public func header(@HTMLBuilder content: () -> [Node] = { [] }) -> HTMLElement {
  HTMLElement("header", content: content)
}
public func footer(@HTMLBuilder content: () -> [Node] = { [] }) -> HTMLElement {
  HTMLElement("footer", content: content)
}
public func main(@HTMLBuilder content: () -> [Node] = { [] }) -> HTMLElement {
  HTMLElement("main", content: content)
}
public func address(@HTMLBuilder content: () -> [Node] = { [] }) -> HTMLElement {
  HTMLElement("address", content: content)
}
public func dt(@HTMLBuilder content: () -> [Node] = { [] }) -> HTMLElement {
  HTMLElement("dt", content: content)
}
public func dd(@HTMLBuilder content: () -> [Node] = { [] }) -> HTMLElement {
  HTMLElement("dd", content: content)
}
public func figure(@HTMLBuilder content: () -> [Node] = { [] }) -> HTMLElement {
  HTMLElement("figure", content: content)
}
public func figcaption(@HTMLBuilder content: () -> [Node] = { [] }) -> HTMLElement {
  HTMLElement("figcaption", content: content)
}
public func em(@HTMLBuilder content: () -> [Node] = { [] }) -> HTMLElement {
  HTMLElement("em", inline: true, content: content)
}
public func strong(@HTMLBuilder content: () -> [Node] = { [] }) -> HTMLElement {
  HTMLElement("strong", inline: true, content: content)
}
public func small(@HTMLBuilder content: () -> [Node] = { [] }) -> HTMLElement {
  HTMLElement("small", inline: true, content: content)
}
public func s(@HTMLBuilder content: () -> [Node] = { [] }) -> HTMLElement {
  HTMLElement("s", inline: true, content: content)
}
public func cite(@HTMLBuilder content: () -> [Node] = { [] }) -> HTMLElement {
  HTMLElement("cite", inline: true, content: content)
}
public func dfn(@HTMLBuilder content: () -> [Node] = { [] }) -> HTMLElement {
  HTMLElement("dfn", inline: true, content: content)
}
public func abbr(@HTMLBuilder content: () -> [Node] = { [] }) -> HTMLElement {
  HTMLElement("abbr", inline: true, content: content)
}
public func ruby(@HTMLBuilder content: () -> [Node] = { [] }) -> HTMLElement {
  HTMLElement("ruby", inline: true, content: content)
}
public func rt(@HTMLBuilder content: () -> [Node] = { [] }) -> HTMLElement {
  HTMLElement("rt", inline: true, content: content)
}
public func rp(@HTMLBuilder content: () -> [Node] = { [] }) -> HTMLElement {
  HTMLElement("rp", inline: true, content: content)
}
public func code(@HTMLBuilder content: () -> [Node] = { [] }) -> HTMLElement {
  HTMLElement("code", inline: true, content: content)
}
public func `var`(@HTMLBuilder content: () -> [Node] = { [] }) -> HTMLElement {
  HTMLElement("var", inline: true, content: content)
}
public func samp(@HTMLBuilder content: () -> [Node] = { [] }) -> HTMLElement {
  HTMLElement("samp", inline: true, content: content)
}
public func kbd(@HTMLBuilder content: () -> [Node] = { [] }) -> HTMLElement {
  HTMLElement("kbd", inline: true, content: content)
}
public func sub(@HTMLBuilder content: () -> [Node] = { [] }) -> HTMLElement {
  HTMLElement("sub", inline: true, content: content)
}
public func sup(@HTMLBuilder content: () -> [Node] = { [] }) -> HTMLElement {
  HTMLElement("sup", inline: true, content: content)
}
public func i(@HTMLBuilder content: () -> [Node] = { [] }) -> HTMLElement {
  HTMLElement("i", inline: true, content: content)
}
public func b(@HTMLBuilder content: () -> [Node] = { [] }) -> HTMLElement {
  HTMLElement("b", inline: true, content: content)
}
public func u(@HTMLBuilder content: () -> [Node] = { [] }) -> HTMLElement {
  HTMLElement("u", inline: true, content: content)
}
public func mark(@HTMLBuilder content: () -> [Node] = { [] }) -> HTMLElement {
  HTMLElement("mark", inline: true, content: content)
}
public func bdi(@HTMLBuilder content: () -> [Node] = { [] }) -> HTMLElement {
  HTMLElement("bdi", inline: true, content: content)
}
public func bdo(@HTMLBuilder content: () -> [Node] = { [] }) -> HTMLElement {
  HTMLElement("bdo", inline: true, content: content)
}
public func wbr() -> HTMLElement { HTMLElement("wbr", selfClosing: true) }

// MARK: - Phrasing Elements (String Content)

public func em(_ text: String) -> HTMLElement { HTMLElement("em", inline: true) { [Text(text)] } }
public func strong(_ text: String) -> HTMLElement { HTMLElement("strong", inline: true) { [Text(text)] } }
public func i(_ text: String) -> HTMLElement { HTMLElement("i", inline: true) { [Text(text)] } }
public func b(_ text: String) -> HTMLElement { HTMLElement("b", inline: true) { [Text(text)] } }
public func u(_ text: String) -> HTMLElement { HTMLElement("u", inline: true) { [Text(text)] } }
public func small(_ text: String) -> HTMLElement { HTMLElement("small", inline: true) { [Text(text)] } }
public func s(_ text: String) -> HTMLElement { HTMLElement("s", inline: true) { [Text(text)] } }
public func del(_ text: String) -> HTMLElement { HTMLElement("del", inline: true) { [Text(text)] } }
public func ins(_ text: String) -> HTMLElement { HTMLElement("ins", inline: true) { [Text(text)] } }
public func mark(_ text: String) -> HTMLElement { HTMLElement("mark", inline: true) { [Text(text)] } }
public func code(_ text: String) -> HTMLElement { HTMLElement("code", inline: true) { [Text(text)] } }
public func kbd(_ text: String) -> HTMLElement { HTMLElement("kbd", inline: true) { [Text(text)] } }
public func samp(_ text: String) -> HTMLElement { HTMLElement("samp", inline: true) { [Text(text)] } }
public func `var`(_ text: String) -> HTMLElement { HTMLElement("var", inline: true) { [Text(text)] } }
public func sub(_ text: String) -> HTMLElement { HTMLElement("sub", inline: true) { [Text(text)] } }
public func sup(_ text: String) -> HTMLElement { HTMLElement("sup", inline: true) { [Text(text)] } }
