import DOMBuilder
import EmbeddedSwiftUtilities
import WebTypes

#if CLIENT
  @_extern(wasm, module: "env", name: "element_getOffsetWidth")
  func element_getOffsetWidth(_ elementID: Int32) -> Double

  @_extern(wasm, module: "env", name: "element_getDisabled")
  func element_getDisabled(_ elementID: Int32) -> Int32

  @_extern(wasm, module: "env", name: "element_setDisabled")
  func element_setDisabled(_ elementID: Int32, _ disabled: Int32)

  @_extern(wasm, module: "env", name: "element_getValue")
  func element_getValue(
    _ elementID: Int32, _ buffer: UnsafeMutablePointer<UInt8>, _ bufferLen: Int32
  ) -> Int32

  /// A form control's `value`, however long. The bridge answers a buffer too
  /// small for it with `-(bytes + 1)` — the room it needs — so the read grows
  /// once and succeeds, where a fixed buffer cut a long value off silently.
  func elementValue(_ elementID: Int32) -> String {
    var capacity = 256
    while true {
      var buffer = [UInt8](repeating: 0, count: capacity)
      let length = element_getValue(elementID, &buffer, Int32(capacity))
      if length >= 0 { return String(decoding: buffer[0..<Int(length)], as: UTF8.self) }
      capacity = Int(-length) - 1 + 16
    }
  }

  @_extern(wasm, module: "env", name: "element_getDefaultValue")
  func element_getDefaultValue(
    _ elementID: Int32, _ buffer: UnsafeMutablePointer<UInt8>, _ bufferLen: Int32
  ) -> Int32

  /// A form control's `defaultValue` — what the markup gave it — however long,
  /// read as `elementValue` reads `value`.
  func elementDefaultValue(_ elementID: Int32) -> String {
    var capacity = 256
    while true {
      var buffer = [UInt8](repeating: 0, count: capacity)
      let length = element_getDefaultValue(elementID, &buffer, Int32(capacity))
      if length >= 0 { return String(decoding: buffer[0..<Int(length)], as: UTF8.self) }
      capacity = Int(-length) - 1 + 16
    }
  }

  @_extern(wasm, module: "env", name: "element_setValue")
  func element_setValue(_ elementID: Int32, _ valuePointer: UnsafePointer<CChar>, _ valueLen: Int32)

  @_extern(wasm, module: "env", name: "element_getOffsetHeight")
  func element_getOffsetHeight(_ elementID: Int32) -> Double

  @_extern(wasm, module: "env", name: "element_click")
  func element_click(_ elementID: Int32)

  @_extern(wasm, module: "env", name: "element_blur")
  func element_blur(_ elementID: Int32)

  @_extern(wasm, module: "env", name: "element_focus")
  func element_focus(_ elementID: Int32)

  @_extern(wasm, module: "env", name: "element_getIndeterminate")
  func element_getIndeterminate(_ elementID: Int32) -> Int32

  @_extern(wasm, module: "env", name: "element_setIndeterminate")
  func element_setIndeterminate(_ elementID: Int32, _ value: Int32)

  @_extern(wasm, module: "env", name: "element_getChecked")
  func element_getChecked(_ elementID: Int32) -> Int32

  @_extern(wasm, module: "env", name: "element_setChecked")
  func element_setChecked(_ elementID: Int32, _ value: Int32)

  @_extern(wasm, module: "env", name: "form_submit")
  func form_submit(_ elementID: Int32)
#endif
