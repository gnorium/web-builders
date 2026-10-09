import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

extension HTML {
  public class HTMLInputElement: HTMLElement, @unchecked Sendable {
    public init() {
      super.init("input", selfClosing: true)
    }

    public override init(id: Int32) {
      super.init(id: id)
    }

    public override func callAsFunction(@HTMLBuilder content: () -> [DOM.Node]) -> Self {
      return self
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

      public var checked: Bool {
        get { element_getChecked(id) != 0 }
        set { element_setChecked(id, newValue ? 1 : 0) }
      }

      public var indeterminate: Bool {
        get { element_getIndeterminate(id) != 0 }
        set { element_setIndeterminate(id, newValue ? 1 : 0) }
      }

      public var name: String {
        get { getAttribute("name") ?? "" }
        set { setAttribute("name", newValue) }
      }

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

extension HTML.HTMLInputElement {
  /// The form this control submits with when it does not sit inside it.
  public func form(_ value: String) -> Self { addingAttribute("form", value) }

  public func type(_ value: String) -> Self { addingAttribute("type", value) }
  /// The file types a file input offers ("image/*", ".png,.jpg").
  public func accept(_ value: String) -> Self { addingAttribute("accept", value) }
  public func type(_ value: HTML.Input.`Type`) -> Self { addingAttribute("type", value.rawValue) }
  public func name(_ value: String) -> Self { addingAttribute("name", value) }
  public func value(_ value: String) -> Self { addingAttribute("value", value) }
  public func maxlength(_ value: Int) -> Self { addingAttribute("maxlength", intToString(value)) }
  public func minlength(_ value: Int) -> Self { addingAttribute("minlength", intToString(value)) }
  /// A regular expression the whole value must match (`v` flag semantics).
  public func pattern(_ value: String) -> Self { addingAttribute("pattern", value) }
  public func placeholder(_ value: String) -> Self { addingAttribute("placeholder", value) }
  public func required(_ value: Bool = true) -> Self {
    value ? addingAttribute("required", "required") : self
  }
  public func checked(_ value: Bool = true) -> Self {
    value ? addingAttribute("checked", "checked") : self
  }
  public func autofocus(_ value: Bool = true) -> Self {
    value ? addingAttribute("autofocus", "autofocus") : self
  }
  public func autocomplete(_ value: String) -> Self { addingAttribute("autocomplete", value) }
  public func autocomplete(_ value: HTML.Input.Autocomplete) -> Self {
    addingAttribute("autocomplete", value.rawValue)
  }
  public func min(_ value: Int) -> Self { addingAttribute("min", intToString(value)) }
  public func min(_ value: Double) -> Self { addingAttribute("min", doubleToString(value)) }
  public func max(_ value: Int) -> Self { addingAttribute("max", intToString(value)) }
  public func max(_ value: Double) -> Self { addingAttribute("max", doubleToString(value)) }
  public func step(_ value: Int) -> Self { addingAttribute("step", intToString(value)) }
  public func step(_ value: Double) -> Self { addingAttribute("step", doubleToString(value)) }
  public func readonly(_ value: Bool = true) -> Self {
    value ? addingAttribute("readonly", "readonly") : self
  }
}

public func input() -> HTML.HTMLInputElement { HTML.HTMLInputElement() }
