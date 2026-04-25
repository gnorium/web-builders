import CSSBuilder
import CSSOMBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

public class HTMLStyleElement: HTMLElement, @unchecked Sendable {
  public init(_ text: String? = nil) {
    super.init("style") {
      if let text = text { return [Text(text, isRaw: true)] }
      return []
    }
  }

  public init(@CSSBuilder content: () -> [CSSRule]) {
    let rules = content()
    var css = ""
    for rule in rules {
      css = "\(css)\(rule.build(indent: 0))\n"
    }
    super.init("style") { [Text(css, isRaw: true)] }
  }

  public override init(id: Int32) {
    super.init(id: id)
  }
}

extension HTMLStyleElement {
  public func media(_ value: String) -> Self { addingAttribute("media", value) }
  public func type(_ value: String) -> Self { addingAttribute("type", value) }
}

public func style(_ text: String? = nil) -> HTMLStyleElement { HTMLStyleElement(text) }
public func style(@CSSBuilder content: () -> [CSSRule]) -> HTMLStyleElement {
  HTMLStyleElement(content: content)
}
