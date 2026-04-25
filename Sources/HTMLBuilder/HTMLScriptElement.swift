import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

public class HTMLScriptElement: HTMLElement, @unchecked Sendable {
  public init(_ text: String? = nil) {
    super.init("script") {
      if let text = text { return [Text(text, isRaw: true)] }
      return []
    }
  }

  public init(@HTMLBuilder content: () -> [Node]) {
    super.init("script") { content() }
  }

  public override init(id: Int32) {
    super.init(id: id)
  }
}

extension HTMLScriptElement {
  public func src(_ value: String) -> Self { addingAttribute("src", value) }
  public func type(_ value: String) -> Self { addingAttribute("type", value) }
  public func async(_ value: Bool = true) -> Self {
    value ? addingAttribute("async", "async") : self
  }
  public func `defer`(_ value: Bool = true) -> Self {
    value ? addingAttribute("defer", "defer") : self
  }
  public func integrity(_ value: String) -> Self { addingAttribute("integrity", value) }
  public func crossorigin(_ value: String) -> Self { addingAttribute("crossorigin", value) }
  public func nomodule(_ value: Bool = true) -> Self {
    value ? addingAttribute("nomodule", "nomodule") : self
  }
}

public func script(_ text: String? = nil) -> HTMLScriptElement { HTMLScriptElement(text) }
public func script(@HTMLBuilder content: () -> [Node]) -> HTMLScriptElement {
  HTMLScriptElement(content: content)
}
