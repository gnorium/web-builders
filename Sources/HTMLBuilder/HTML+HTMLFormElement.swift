import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

extension HTML {
  public class HTMLFormElement: HTMLElement, @unchecked Sendable {
    public init(@HTMLBuilder content: () -> [DOM.Node] = { [] }) {
      super.init("form") { content() }
    }

    public override init(id: Int32) {
      super.init(id: id)
    }

    public func submit() {
      #if CLIENT
        form_submit(id)
      #endif
    }
  }
}

extension HTML.HTMLFormElement {
  public func action(_ value: String) -> Self { addingAttribute("action", value) }
  public func method(_ value: String) -> Self { addingAttribute("method", value) }
  public func method(_ value: HTTPMethod) -> Self { addingAttribute("method", value.rawValue) }
  public func enctype(_ value: String) -> Self { addingAttribute("enctype", value) }
  public func autocomplete(_ value: String) -> Self { addingAttribute("autocomplete", value) }
  public func novalidate(_ value: Bool = true) -> Self {
    value ? addingAttribute("novalidate", "novalidate") : self
  }
  public func target(_ value: String) -> Self { addingAttribute("target", value) }
}

public func form(@HTMLBuilder content: () -> [DOM.Node] = { [] }) -> HTML.HTMLFormElement {
  HTML.HTMLFormElement(content: content)
}
