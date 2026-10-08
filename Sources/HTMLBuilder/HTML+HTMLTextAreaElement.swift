import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

extension HTML {
  public class HTMLTextAreaElement: HTMLElement, @unchecked Sendable {
    public init(_ text: String? = nil) {
      super.init("textarea", inline: true) {
        if let text = text { return [DOM.Text(text)] }
        return []
      }
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

      /// What the markup gave the control, whatever has been typed since: the
      /// text between its tags.
      public var defaultValue: String { elementDefaultValue(id) }

      /// Which of its constraints the value breaks, `novalidate` or not.
      public var validity: HTML.ValidityState {
        HTML.ValidityState(bits: element_getValidity(id))
      }

      /// Where the selection starts and ends, in UTF-16 code units from the
      /// value's start (the caret, when they are equal). Nil where the
      /// control has no selection, as the DOM answers null.
      public var selectionStart: Int? {
        get {
          let value = element_getSelectionStart(id)
          return value < 0 ? nil : Int(value)
        }
        set { element_setSelectionStart(id, Int32(newValue ?? -1)) }
      }

      public var selectionEnd: Int? {
        get {
          let value = element_getSelectionEnd(id)
          return value < 0 ? nil : Int(value)
        }
        set { element_setSelectionEnd(id, Int32(newValue ?? -1)) }
      }
    #endif
  }
}

extension HTML.HTMLTextAreaElement {
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

public func textarea(_ text: String? = nil) -> HTML.HTMLTextAreaElement { HTML.HTMLTextAreaElement(text) }
