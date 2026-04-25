import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

public class HTMLOptionElement: HTMLElement, @unchecked Sendable {
  public init(_ text: String? = nil) {
    super.init("option", inline: true) {
      if let text = text { return [Text(text)] }
      return []
    }
  }

  public init(@HTMLBuilder content: () -> [Node]) {
    super.init("option", inline: true) { content() }
  }

  public override init(id: Int32) {
    super.init(id: id)
  }

  #if CLIENT
    public var value: String {
      get {
        var buffer = [UInt8](repeating: 0, count: 1024)
        let len = element_getValue(id, &buffer, 1024)
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

extension HTMLOptionElement {
  public func label(_ value: String) -> Self { addingAttribute("label", value) }
  public func selected(_ value: Bool = true) -> Self {
    value ? addingAttribute("selected", "selected") : self
  }
  public func value(_ value: String) -> Self { addingAttribute("value", value) }
}

public func option(_ text: String? = nil) -> HTMLOptionElement { HTMLOptionElement(text) }
public func option(@HTMLBuilder content: () -> [Node]) -> HTMLOptionElement {
  HTMLOptionElement(content: content)
}
