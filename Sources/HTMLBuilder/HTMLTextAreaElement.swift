import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

public class HTMLTextAreaElement: HTMLElement, @unchecked Sendable {
  public init(_ text: String? = nil) {
    super.init("textarea", inline: true) {
      if let text = text { return [Text(text)] }
      return []
    }
  }

  public override init(id: Int32) {
    super.init(id: id)
  }

  #if CLIENT
    public var value: String {
      get {
        var buffer = [UInt8](repeating: 0, count: 2048)
        let len = element_getValue(id, &buffer, 2048)
        return len > 0 ? String(decoding: buffer[0..<Int(len)], as: UTF8.self) : ""
      }
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

extension HTMLTextAreaElement {
  public func autocomplete(_ value: String) -> Self { addingAttribute("autocomplete", value) }
  public func autofocus(_ value: Bool = true) -> Self {
    value ? addingAttribute("autofocus", "autofocus") : self
  }
  public func cols(_ value: Int) -> Self { addingAttribute("cols", intToString(value)) }
  public func form(_ value: String) -> Self { addingAttribute("form", value) }
  public func maxlength(_ value: Int) -> Self { addingAttribute("maxlength", intToString(value)) }
  public func minlength(_ value: Int) -> Self { addingAttribute("minlength", intToString(value)) }
  public func name(_ value: String) -> Self { addingAttribute("name", value) }
  public func placeholder(_ value: String) -> Self { addingAttribute("placeholder", value) }
  public func readonly(_ value: Bool = true) -> Self {
    value ? addingAttribute("readonly", "readonly") : self
  }
  public func required(_ value: Bool = true) -> Self {
    value ? addingAttribute("required", "required") : self
  }
  public func rows(_ value: Int) -> Self { addingAttribute("rows", intToString(value)) }
  public func wrap(_ value: String) -> Self { addingAttribute("wrap", value) }
}

public func textarea(_ text: String? = nil) -> HTMLTextAreaElement { HTMLTextAreaElement(text) }
