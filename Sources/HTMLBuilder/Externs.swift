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
#endif
