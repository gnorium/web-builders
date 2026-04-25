import DOMBuilder

#if CLIENT
  @_extern(wasm, module: "env", name: "element_beginElement")
  func element_beginElement(_ elementID: Int32)
#endif
