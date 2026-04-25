import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

public class HTMLIFrameElement: HTMLElement, @unchecked Sendable {
  public init() {
    super.init("iframe")
  }

  public override init(id: Int32) {
    super.init(id: id)
  }
}

extension HTMLIFrameElement {
  public func src(_ value: String) -> Self { addingAttribute("src", value) }
  public func srcdoc(_ value: String) -> Self { addingAttribute("srcdoc", value) }
  public func name(_ value: String) -> Self { addingAttribute("name", value) }
  public func width(_ value: Int) -> Self { addingAttribute("width", intToString(value)) }
  public func height(_ value: Int) -> Self { addingAttribute("height", intToString(value)) }
  public func sandbox(_ value: String) -> Self { addingAttribute("sandbox", value) }
}

public func iframe() -> HTMLIFrameElement { HTMLIFrameElement() }
