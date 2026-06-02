import CSSBuilder
import CSSOMBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

extension HTML {
  public class HTMLStyleElement: HTMLElement, @unchecked Sendable {
    public init(_ text: String? = nil) {
      super.init("style") {
        if let text = text { return [DOM.Text(text, isRaw: true)] }
        return []
      }
    }

    public init(@CSSBuilder content: () -> [CSSOM.CSSRule]) {
      let rules = content()
      var css = ""
      for rule in rules {
        let text = rule.cssText
        if !stringIsEmpty(text) { css = "\(css)\(text)\n" }
      }
      super.init("style") { [DOM.Text(css, isRaw: true)] }
    }

    public override init(id: Int32) {
      super.init(id: id)
    }
  }  
}
extension HTML.HTMLStyleElement {
  public func media(_ value: String) -> Self { addingAttribute("media", value) }
  public func type(_ value: String) -> Self { addingAttribute("type", value) }
}

public func style(_ text: String? = nil) -> HTML.HTMLStyleElement { HTML.HTMLStyleElement(text) }
public func style(@CSSBuilder content: () -> [CSSOM.CSSRule]) -> HTML.HTMLStyleElement {
  HTML.HTMLStyleElement(content: content)
}
