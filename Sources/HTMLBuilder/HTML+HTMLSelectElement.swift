import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

extension HTML {
  public class HTMLSelectElement: HTMLElement, @unchecked Sendable {
    public init(@HTMLBuilder content: () -> [DOM.Node] = { [] }) {
      super.init("select") { content() }
    }

    public override init(id: Int32) {
      super.init(id: id)
    }

    #if CLIENT
      public var value: String {
        get { elementValue(id) }
        set {
          var buffer = Array(newValue.utf8)
          buffer.append(0)
          buffer.withUnsafeBufferPointer { ptr in
            ptr.baseAddress!.withMemoryRebound(to: CChar.self, capacity: buffer.count) { pointer in
              element_setValue(id, pointer, Int32(buffer.count - 1))
            }
          }
        }
      }
    #endif
  }
}

extension HTML.HTMLSelectElement {
  public func autocomplete(_ value: String) -> Self { addingAttribute("autocomplete", value) }
  public func autofocus(_ value: Bool = true) -> Self {
    value ? addingAttribute("autofocus", "autofocus") : self
  }
  public func form(_ value: String) -> Self { addingAttribute("form", value) }
  public func multiple(_ value: Bool = true) -> Self {
    value ? addingAttribute("multiple", "multiple") : self
  }
  public func name(_ value: String) -> Self { addingAttribute("name", value) }
  public func required(_ value: Bool = true) -> Self {
    value ? addingAttribute("required", "required") : self
  }
  public func size(_ value: Int) -> Self { addingAttribute("size", intToString(value)) }
}

public func select(@HTMLBuilder content: () -> [DOM.Node] = { [] }) -> HTML.HTMLSelectElement {
  HTML.HTMLSelectElement(content: content)
}
