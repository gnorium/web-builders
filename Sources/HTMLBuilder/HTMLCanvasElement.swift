import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

public class HTMLCanvasElement: HTMLElement, @unchecked Sendable {
  public init() {
    super.init("canvas")
  }

  public override init(id: Int32) {
    super.init(id: id)
  }
}

extension HTMLCanvasElement {
  public func width(_ value: Int) -> Self { addingAttribute("width", intToString(value)) }
  public func height(_ value: Int) -> Self { addingAttribute("height", intToString(value)) }
}

public func canvas() -> HTMLCanvasElement { HTMLCanvasElement() }
