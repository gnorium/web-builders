import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

public class HTMLAnchorElement: HTMLElement, @unchecked Sendable {
  public init(@HTMLBuilder content: () -> [Node] = { [] }) {
    super.init("a", inline: true) { content() }
  }

  public override init(id: Int32) {
    super.init(id: id)
  }

  #if CLIENT
    public var href: String {
      get { getAttribute("href") ?? "" }
      set { setAttribute("href", newValue) }
    }
  #endif
}

extension HTMLAnchorElement {
  public func href(_ value: String) -> Self { addingAttribute("href", value) }
  public func target(_ value: String) -> Self { addingAttribute("target", value) }
  public func target(_ value: HTMLTarget) -> Self { addingAttribute("target", value.rawValue) }
  public func rel(_ value: String) -> Self { addingAttribute("rel", value) }
  public func rel(_ value: HTMLLink.Rel) -> Self { addingAttribute("rel", value.rawValue) }
  public func rel(_ values: HTMLLink.Rel...) -> Self {
    addingAttribute("rel", values.map { $0.rawValue }.joined(separator: " "))
  }
  public func download(_ value: String) -> Self { addingAttribute("download", value) }
}

public func a(@HTMLBuilder content: () -> [Node] = { [] }) -> HTMLAnchorElement {
  HTMLAnchorElement(content: content)
}
public func a(_ text: String) -> HTMLAnchorElement { HTMLAnchorElement { Text(text) } }
