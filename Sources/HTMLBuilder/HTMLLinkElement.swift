import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

public class HTMLLinkElement: HTMLElement, @unchecked Sendable {
  public init() {
    super.init("link", selfClosing: true)
  }

  public override init(id: Int32) {
    super.init(id: id)
  }

  public override func callAsFunction(@HTMLBuilder content: () -> [Node]) -> Self {
    return self
  }
}

extension HTMLLinkElement {
  public func href(_ value: String) -> Self { addingAttribute("href", value) }
  public func rel(_ value: String) -> Self { addingAttribute("rel", value) }
  public func rel(_ value: HTMLLink.Rel) -> Self { addingAttribute("rel", value.rawValue) }
  public func rel(_ values: HTMLLink.Rel...) -> Self { addingAttribute("rel", values.map { $0.rawValue }.joined(separator: " ")) }
  public func sizes(_ width: Int, _ height: Int) -> Self { addingAttribute("sizes", "\(width)x\(height)") }
  public func type(_ value: String) -> Self { addingAttribute("type", value) }
  public func media(_ value: String) -> Self { addingAttribute("media", value) }
  public func integrity(_ value: String) -> Self { addingAttribute("integrity", value) }
  public func crossorigin(_ value: String) -> Self { addingAttribute("crossorigin", value) }
  public func crossorigin(_ value: HTMLLink.CrossOrigin) -> Self { addingAttribute("crossorigin", value.rawValue) }
  public func `as`(_ value: String) -> Self { addingAttribute("as", value) }
  public func `as`(_ value: HTMLLink.As) -> Self { addingAttribute("as", value.rawValue) }
}

public func link() -> HTMLLinkElement { HTMLLinkElement() }
