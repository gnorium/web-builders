import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

extension HTML {
  public class HTMLAnchorElement: HTMLElement, @unchecked Sendable {
    public init(@HTMLBuilder content: () -> [DOM.Node] = { [] }) {
      super.init("a", inline: true) { content() }
    }
    public override init(id: Int32) { super.init(id: id) }
    #if CLIENT
    public var href: String {
      get { getAttribute("href") ?? "" }
      set { setAttribute("href", newValue) }
    }
    #endif
  }
}

extension HTML.HTMLAnchorElement {
  public func href(_ value: String) -> Self { addingAttribute("href", value) }
  public func target(_ value: String) -> Self { addingAttribute("target", value) }
  public func target(_ value: HTML.Target) -> Self { addingAttribute("target", value.rawValue) }
  public func rel(_ value: String) -> Self { addingAttribute("rel", value) }
  public func rel(_ value: HTML.Link.Rel) -> Self { addingAttribute("rel", value.rawValue) }
  public func rel(_ values: HTML.Link.Rel...) -> Self {
    addingAttribute("rel", values.map { $0.rawValue }.joined(separator: " "))
  }
  public func download(_ value: String) -> Self { addingAttribute("download", value) }
}

public func a(@HTMLBuilder content: () -> [DOM.Node] = { [] }) -> HTML.HTMLAnchorElement {
  HTML.HTMLAnchorElement(content: content)
}
public func a(_ text: String) -> HTML.HTMLAnchorElement { HTML.HTMLAnchorElement { DOM.Text(text) } }
