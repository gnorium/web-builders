import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

public class HTMLMetaElement: HTMLElement, @unchecked Sendable {
  public init() {
    super.init("meta", selfClosing: true)
  }

  public override init(id: Int32) {
    super.init(id: id)
  }

  public override func callAsFunction(@HTMLBuilder content: () -> [Node]) -> Self {
    return self
  }
}

extension HTMLMetaElement {
  public func name(_ value: String) -> Self { addingAttribute("name", value) }
  public func name(_ value: HTMLMeta.Name) -> Self { addingAttribute("name", value.rawValue) }

  public func content(_ value: String) -> Self { addingAttribute("content", value) }
  public func content(_ value: Int) -> Self { addingAttribute("content", intToString(value)) }
  public func content(_ value: HTMLLocale) -> Self { addingAttribute("content", value.value) }
  public func content(_ value: CSSColor) -> Self { addingAttribute("content", value.value) }
  public func content(_ directives: HTMLMeta.Name.Robots...) -> Self {
    addingAttribute("content", HTMLMeta.Name.Robots.content(directives))
  }
  public func content(_ closure: () -> HTMLMeta.Name.Viewport.Content) -> Self {
    addingAttribute("content", closure().render())
  }

  public func charset(_ value: String) -> Self { addingAttribute("charset", value) }
  public func charset(_ value: HTMLMeta.CharSet) -> Self { addingAttribute("charset", value.rawValue) }

  public func httpEquiv(_ value: String) -> Self { addingAttribute("http-equiv", value) }
  public func property(_ value: String) -> Self { addingAttribute("property", value) }
  public func property(_ value: HTMLMeta.Property.OpenGraph) -> Self {
    addingAttribute("property", value.rawValue)
  }

  public func content(_ value: HTMLMeta.Property.OpenGraph.`Type`.Content) -> Self {
    addingAttribute("content", value.rawValue)
  }

  public func content(_ value: HTMLMeta.Name.TwitterCard.Content) -> Self {
    addingAttribute("content", value.rawValue)
  }
}

public func meta() -> HTMLMetaElement { HTMLMetaElement() }
