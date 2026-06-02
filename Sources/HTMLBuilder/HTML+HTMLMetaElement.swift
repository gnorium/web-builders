import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

extension HTML {  
  public class HTMLMetaElement: HTMLElement, @unchecked Sendable {
    public init() {
      super.init("meta", selfClosing: true)
    }

    public override init(id: Int32) {
      super.init(id: id)
    }

    public override func callAsFunction(@HTMLBuilder content: () -> [DOM.Node]) -> Self {
      return self
    }
  }
}

extension HTML.HTMLMetaElement {
  public func name(_ value: String) -> Self { addingAttribute("name", value) }
  public func name(_ value: HTML.Meta.Name) -> Self { addingAttribute("name", value.rawValue) }

  public func content(_ value: String) -> Self { addingAttribute("content", value) }
  public func content(_ value: Int) -> Self { addingAttribute("content", intToString(value)) }
  public func content(_ value: Intl.Locale) -> Self { addingAttribute("content", value.value) }
  public func content(_ value: CSS.Color) -> Self { addingAttribute("content", value.value) }
  public func content(_ directives: HTML.Meta.Name.Robots...) -> Self {
    addingAttribute("content", HTML.Meta.Name.Robots.content(directives))
  }
  public func content(_ closure: () -> HTML.Meta.Name.Viewport.Content) -> Self {
    addingAttribute("content", closure().render())
  }
  public func content(_ content: HTML.Meta.Name.Viewport.Content) -> Self {
    addingAttribute("content", content.render())
  }

  public func charset(_ value: String) -> Self { addingAttribute("charset", value) }
  public func charset(_ value: HTML.Meta.CharSet) -> Self { addingAttribute("charset", value.rawValue) }

  public func httpEquiv(_ value: String) -> Self { addingAttribute("http-equiv", value) }
  public func property(_ value: String) -> Self { addingAttribute("property", value) }
  public func property(_ value: HTML.Meta.Property.OpenGraph) -> Self {
    addingAttribute("property", value.rawValue)
  }

  public func content(_ value: HTML.Meta.Property.OpenGraph.`Type`.Content) -> Self {
    addingAttribute("content", value.rawValue)
  }

  public func content(_ value: HTML.Meta.Name.TwitterCard.Content) -> Self {
    addingAttribute("content", value.rawValue)
  }
}

public func meta() -> HTML.HTMLMetaElement { HTML.HTMLMetaElement() }
