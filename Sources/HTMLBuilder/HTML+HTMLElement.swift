import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

extension HTML {
  public class HTMLElement: DOM.Element, HTMLElementBuildable, @unchecked Sendable {
  public init(
    _ name: String, selfClosing: Bool = false, @HTMLBuilder content: () -> [DOM.Node] = { [] }
  ) {
    super.init(ns: .html, tag: name, children: content(), selfClosing: selfClosing, inline: false)
  }

  public init(_ name: String, inline: Bool, @HTMLBuilder content: () -> [DOM.Node] = { [] }) {
    super.init(ns: .html, tag: name, children: content(), selfClosing: false, inline: inline)
  }

  public override init(id: Int32) {
    super.init(id: id)
  }

  open func callAsFunction(@HTMLBuilder content: () -> [DOM.Node]) -> Self {
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
}

// MARK: - Global Factory Functions

public func noscript(@HTMLBuilder content: () -> [DOM.Node] = { [] }) -> HTML.HTMLElement {
  HTML.HTMLElement("noscript", content: content)
}
public func section(@HTMLBuilder content: () -> [DOM.Node] = { [] }) -> HTML.HTMLElement {
  HTML.HTMLElement("section", content: content)
}
public func nav(@HTMLBuilder content: () -> [DOM.Node] = { [] }) -> HTML.HTMLElement {
  HTML.HTMLElement("nav", content: content)
}
public func article(@HTMLBuilder content: () -> [DOM.Node] = { [] }) -> HTML.HTMLElement {
  HTML.HTMLElement("article", content: content)
}
public func aside(@HTMLBuilder content: () -> [DOM.Node] = { [] }) -> HTML.HTMLElement {
  HTML.HTMLElement("aside", content: content)
}
public func header(@HTMLBuilder content: () -> [DOM.Node] = { [] }) -> HTML.HTMLElement {
  HTML.HTMLElement("header", content: content)
}
public func footer(@HTMLBuilder content: () -> [DOM.Node] = { [] }) -> HTML.HTMLElement {
  HTML.HTMLElement("footer", content: content)
}
public func main(@HTMLBuilder content: () -> [DOM.Node] = { [] }) -> HTML.HTMLElement {
  HTML.HTMLElement("main", content: content)
}
public func address(@HTMLBuilder content: () -> [DOM.Node] = { [] }) -> HTML.HTMLElement {
  HTML.HTMLElement("address", content: content)
}
public func dt(@HTMLBuilder content: () -> [DOM.Node] = { [] }) -> HTML.HTMLElement {
  HTML.HTMLElement("dt", content: content)
}
public func dd(@HTMLBuilder content: () -> [DOM.Node] = { [] }) -> HTML.HTMLElement {
  HTML.HTMLElement("dd", content: content)
}
public func dt(_ text: String) -> HTML.HTMLElement { HTML.HTMLElement("dt") { [DOM.Text(text)] } }
public func dd(_ text: String) -> HTML.HTMLElement { HTML.HTMLElement("dd") { [DOM.Text(text)] } }

public func figure(@HTMLBuilder content: () -> [DOM.Node] = { [] }) -> HTML.HTMLElement {
  HTML.HTMLElement("figure", content: content)
}
public func figcaption(@HTMLBuilder content: () -> [DOM.Node] = { [] }) -> HTML.HTMLElement {
  HTML.HTMLElement("figcaption", content: content)
}
public func em(@HTMLBuilder content: () -> [DOM.Node] = { [] }) -> HTML.HTMLElement {
  HTML.HTMLElement("em", inline: true, content: content)
}
public func strong(@HTMLBuilder content: () -> [DOM.Node] = { [] }) -> HTML.HTMLElement {
  HTML.HTMLElement("strong", inline: true, content: content)
}
public func small(@HTMLBuilder content: () -> [DOM.Node] = { [] }) -> HTML.HTMLElement {
  HTML.HTMLElement("small", inline: true, content: content)
}
public func s(@HTMLBuilder content: () -> [DOM.Node] = { [] }) -> HTML.HTMLElement {
  HTML.HTMLElement("s", inline: true, content: content)
}
public func cite(@HTMLBuilder content: () -> [DOM.Node] = { [] }) -> HTML.HTMLElement {
  HTML.HTMLElement("cite", inline: true, content: content)
}
public func dfn(@HTMLBuilder content: () -> [DOM.Node] = { [] }) -> HTML.HTMLElement {
  HTML.HTMLElement("dfn", inline: true, content: content)
}
public func abbr(@HTMLBuilder content: () -> [DOM.Node] = { [] }) -> HTML.HTMLElement {
  HTML.HTMLElement("abbr", inline: true, content: content)
}
public func ruby(@HTMLBuilder content: () -> [DOM.Node] = { [] }) -> HTML.HTMLElement {
  HTML.HTMLElement("ruby", inline: true, content: content)
}
public func rt(@HTMLBuilder content: () -> [DOM.Node] = { [] }) -> HTML.HTMLElement {
  HTML.HTMLElement("rt", inline: true, content: content)
}
public func rp(@HTMLBuilder content: () -> [DOM.Node] = { [] }) -> HTML.HTMLElement {
  HTML.HTMLElement("rp", inline: true, content: content)
}
public func code(@HTMLBuilder content: () -> [DOM.Node] = { [] }) -> HTML.HTMLElement {
  HTML.HTMLElement("code", inline: true, content: content)
}
public func `var`(@HTMLBuilder content: () -> [DOM.Node] = { [] }) -> HTML.HTMLElement {
  HTML.HTMLElement("var", inline: true, content: content)
}
public func samp(@HTMLBuilder content: () -> [DOM.Node] = { [] }) -> HTML.HTMLElement {
  HTML.HTMLElement("samp", inline: true, content: content)
}
public func kbd(@HTMLBuilder content: () -> [DOM.Node] = { [] }) -> HTML.HTMLElement {
  HTML.HTMLElement("kbd", inline: true, content: content)
}
public func sub(@HTMLBuilder content: () -> [DOM.Node] = { [] }) -> HTML.HTMLElement {
  HTML.HTMLElement("sub", inline: true, content: content)
}
public func sup(@HTMLBuilder content: () -> [DOM.Node] = { [] }) -> HTML.HTMLElement {
  HTML.HTMLElement("sup", inline: true, content: content)
}
public func i(@HTMLBuilder content: () -> [DOM.Node] = { [] }) -> HTML.HTMLElement {
  HTML.HTMLElement("i", inline: true, content: content)
}
public func b(@HTMLBuilder content: () -> [DOM.Node] = { [] }) -> HTML.HTMLElement {
  HTML.HTMLElement("b", inline: true, content: content)
}
public func u(@HTMLBuilder content: () -> [DOM.Node] = { [] }) -> HTML.HTMLElement {
  HTML.HTMLElement("u", inline: true, content: content)
}
public func mark(@HTMLBuilder content: () -> [DOM.Node] = { [] }) -> HTML.HTMLElement {
  HTML.HTMLElement("mark", inline: true, content: content)
}
public func bdi(@HTMLBuilder content: () -> [DOM.Node] = { [] }) -> HTML.HTMLElement {
  HTML.HTMLElement("bdi", inline: true, content: content)
}
public func bdo(@HTMLBuilder content: () -> [DOM.Node] = { [] }) -> HTML.HTMLElement {
  HTML.HTMLElement("bdo", inline: true, content: content)
}
public func wbr() -> HTML.HTMLElement { HTML.HTMLElement("wbr", selfClosing: true) }

// MARK: - Phrasing Elements (String Content)

public func em(_ text: String) -> HTML.HTMLElement { HTML.HTMLElement("em", inline: true) { [DOM.Text(text)] } }
public func strong(_ text: String) -> HTML.HTMLElement { HTML.HTMLElement("strong", inline: true) { [DOM.Text(text)] } }
public func i(_ text: String) -> HTML.HTMLElement { HTML.HTMLElement("i", inline: true) { [DOM.Text(text)] } }
public func b(_ text: String) -> HTML.HTMLElement { HTML.HTMLElement("b", inline: true) { [DOM.Text(text)] } }
public func u(_ text: String) -> HTML.HTMLElement { HTML.HTMLElement("u", inline: true) { [DOM.Text(text)] } }
public func small(_ text: String) -> HTML.HTMLElement { HTML.HTMLElement("small", inline: true) { [DOM.Text(text)] } }
public func s(_ text: String) -> HTML.HTMLElement { HTML.HTMLElement("s", inline: true) { [DOM.Text(text)] } }
public func del(_ text: String) -> HTML.HTMLElement { HTML.HTMLElement("del", inline: true) { [DOM.Text(text)] } }
public func ins(_ text: String) -> HTML.HTMLElement { HTML.HTMLElement("ins", inline: true) { [DOM.Text(text)] } }
public func mark(_ text: String) -> HTML.HTMLElement { HTML.HTMLElement("mark", inline: true) { [DOM.Text(text)] } }
public func code(_ text: String) -> HTML.HTMLElement { HTML.HTMLElement("code", inline: true) { [DOM.Text(text)] } }
public func kbd(_ text: String) -> HTML.HTMLElement { HTML.HTMLElement("kbd", inline: true) { [DOM.Text(text)] } }
public func samp(_ text: String) -> HTML.HTMLElement { HTML.HTMLElement("samp", inline: true) { [DOM.Text(text)] } }
public func `var`(_ text: String) -> HTML.HTMLElement { HTML.HTMLElement("var", inline: true) { [DOM.Text(text)] } }
public func sub(_ text: String) -> HTML.HTMLElement { HTML.HTMLElement("sub", inline: true) { [DOM.Text(text)] } }
public func sup(_ text: String) -> HTML.HTMLElement { HTML.HTMLElement("sup", inline: true) { [DOM.Text(text)] } }
