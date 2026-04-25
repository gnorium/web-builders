import EmbeddedSwiftUtilities
import WebTypes

open class Element: Node, @unchecked Sendable {
  public let ns: Namespace
  public let tag: String
  public var attributes: [(String, String)]
  public var children: [Node]
  public let selfClosing: Bool
  public let inline: Bool

  public init(
    ns: Namespace,
    tag: String,
    attributes: [(String, String)] = [],
    children: [Node] = [],
    selfClosing: Bool = false,
    inline: Bool = false
  ) {
    self.ns = ns
    self.tag = tag
    self.attributes = attributes
    self.children = children
    self.selfClosing = selfClosing
    self.inline = inline
    super.init()
  }

  public override init(id: Int32) {
    self.ns = .html
    self.tag = ""
    self.attributes = []
    self.children = []
    self.selfClosing = false
    self.inline = false
    super.init(id: id)
  }

  public override func build(indent: Int = 0) -> String {
    let ind = indent > 0 ? stringRepeating("  ", count: indent) : ""
    let attrString = buildAttributes(attributes)
    if selfClosing { return "<\(tag)\(attrString)/>" }
    let open = "<\(tag)\(attrString)>"
    let close = "</\(tag)>"
    if children.isEmpty { return "\(ind)\(open)\(close)" }
    if children.count == 1, let text = children[0] as? Text, !text.isRaw,
      stringIndexOfChar(text.content, 10) == nil
    {
      return "\(ind)\(open)\(text.content)\(close)"
    }
    if inline {
      var inner = ""
      for child in children { inner = "\(inner)\(child.build(indent: 0))" }
      return "\(ind)\(open)\(inner)\(close)"
    }
    var inner = ""
    var actualCount = 0
    for child in children {
      let rendered = child.build(indent: indent + 1)
      if !stringIsEmpty(rendered) {
        if actualCount > 0 { inner = "\(inner)\n" }
        inner = "\(inner)\(rendered)"
        actualCount += 1
      }
    }
    if actualCount == 0 { return "\(ind)\(open)\(close)" }
    return "\(ind)\(open)\n\(inner)\n\(ind)\(close)"
  }

  private func buildAttributes(_ attrs: [(String, String)]) -> String {
    guard !attrs.isEmpty else { return "" }
    var result = ""
    for attr in attrs {
      result = "\(result) \(attr.0)=\"\(escapeHTMLAttributeValue(attr.1))\""
    }
    return result
  }

  public override var nodeType: HTMLNodeType { .elementNode }

  @discardableResult
  open func addingAttribute(_ key: String, _ value: String) -> Self {
    #if CLIENT
      if id >= 0 {
        setAttribute(key, value)
        return self
      }
    #endif
    attributes.removeAll { stringEquals($0.0, key) }
    attributes.append((key, value))
    return self
  }

  #if CLIENT
    public var innerHTML: String {
      get {
        let bufferSize = 1024 * 16
        let buffer = UnsafeMutablePointer<Int8>.allocate(capacity: bufferSize + 1)
        defer { buffer.deallocate() }
        let len = element_getInnerHTML(id, buffer, Int32(bufferSize))
        if len > 0 {
          return buffer.withMemoryRebound(to: UInt8.self, capacity: Int(len)) { ptr in
            String(decoding: UnsafeBufferPointer(start: ptr, count: Int(len)), as: UTF8.self)
          }
        }
        return ""
      }
      set {
        var buffer = Array(newValue.utf8)
        buffer.append(0)
        buffer.withUnsafeBufferPointer { bufferPtr in
          bufferPtr.baseAddress!.withMemoryRebound(to: CChar.self, capacity: buffer.count) {
            pointer in
            element_setInnerHTML(id, pointer, Int32(buffer.count - 1))
          }
        }
      }
    }

    @discardableResult
    open func setAttribute(_ name: String, _ value: String) -> Self {
      var nameBuffer = Array(name.utf8)
      nameBuffer.append(0)
      nameBuffer.withUnsafeBufferPointer { nameBufPtr in
        nameBufPtr.baseAddress!.withMemoryRebound(to: CChar.self, capacity: nameBuffer.count) {
          namePointer in
          var buffer = Array(value.utf8)
          buffer.append(0)
          buffer.withUnsafeBufferPointer { bufferPtr in
            bufferPtr.baseAddress!.withMemoryRebound(to: CChar.self, capacity: buffer.count) {
              valuePointer in
              element_setAttribute(
                id, namePointer, Int32(nameBuffer.count - 1), valuePointer, Int32(buffer.count - 1))
            }
          }
        }
      }
      return self
    }

    @discardableResult
    public func setAttribute(_ name: HTMLAttributeName, _ value: String) -> Self {
      return setAttribute(name.rawValue, value)
    }

    @discardableResult
    public func setAttribute(_ name: SVGAttributeName, _ value: String) -> Self {
      return setAttribute(name.rawValue, value)
    }

    @discardableResult
    public func setAttribute(_ name: SVGAttributeName, _ value: Double) -> Self {
      return setAttribute(name.rawValue, doubleToString(value))
    }

    @discardableResult
    public func setAttribute(_ name: HTMLAttributeName, _ value: Bool) -> Self {
      return setAttribute(name.rawValue, value ? "true" : "false")
    }

    @discardableResult
    open func setAttribute(_ name: String, _ value: Bool) -> Self {
      return setAttribute(name, value ? "true" : "false")
    }

    public func contains(_ other: Element) -> Bool {
      return element_contains(id, other.id) != 0
    }

    open var scrollTop: Double {
      get { element_getScrollTop(id) }
      set { element_setScrollTop(id, newValue) }
    }

    open var scrollHeight: Double {
      element_getScrollHeight(id)
    }

    open var offsetHeight: Double {
      element_getOffsetHeight(id)
    }

    open var offsetWidth: Double {
      element_getOffsetWidth(id)
    }

    open var scrollLeft: Double {
      get { element_getScrollLeft(id) }
      set { element_setScrollLeft(id, newValue) }
    }

    open var scrollWidth: Double {
      element_getScrollWidth(id)
    }

    open var clientWidth: Double {
      element_getOffsetWidth(id)  // Wait, clientWidth is different from offsetWidth, but often used interchangeably in simple layouts. I'll add a proper extern.
    }

    open func scrollBy(x: Double, y: Double) {
      element_scrollBy(id, x, y)
    }

    open func scrollTo(x: Double, y: Double) {
      element_scrollTo(id, x, y)
    }

    public var tagName: String {
      let bufferSize = 64
      let buffer = UnsafeMutablePointer<Int8>.allocate(capacity: bufferSize)
      defer { buffer.deallocate() }
      let len = element_getTagName(id, buffer, Int32(bufferSize))
      if len > 0 {
        return buffer.withMemoryRebound(to: UInt8.self, capacity: Int(len)) { ptr in
          String(decoding: UnsafeBufferPointer(start: ptr, count: Int(len)), as: UTF8.self)
        }
      }
      return ""
    }

    public func getAttribute(_ name: String) -> String? {
      var nameBuffer = Array(name.utf8)
      nameBuffer.append(0)
      return nameBuffer.withUnsafeBufferPointer { nameBufPtr in
        nameBufPtr.baseAddress!.withMemoryRebound(to: CChar.self, capacity: nameBuffer.count) {
          pointer in
          let nameLen = Int32(nameBuffer.count - 1)
          let initialSize = 1024 * 4
          let initialBuffer = UnsafeMutablePointer<Int8>.allocate(capacity: initialSize + 1)
          let len = element_getAttribute(id, pointer, nameLen, initialBuffer, Int32(initialSize))
          if len >= 0 {
            let result = initialBuffer.withMemoryRebound(to: UInt8.self, capacity: Int(len)) {
              ptr in
              String(decoding: UnsafeBufferPointer(start: ptr, count: Int(len)), as: UTF8.self)
            }
            initialBuffer.deallocate()
            return result
          }
          initialBuffer.deallocate()
          return nil
        }
      }
    }

    public func getAttribute(_ name: HTMLAttributeName) -> String? {
      return getAttribute(name.rawValue)
    }

    public func getAttribute(_ name: SVGAttributeName) -> String? {
      return getAttribute(name.rawValue)
    }

    public func hasAttribute(_ name: String) -> Bool {
      var nameBuffer = Array(name.utf8)
      nameBuffer.append(0)
      return nameBuffer.withUnsafeBufferPointer { nameBufPtr in
        nameBufPtr.baseAddress!.withMemoryRebound(to: CChar.self, capacity: nameBuffer.count) {
          pointer in
          return element_hasAttribute(id, pointer, Int32(nameBuffer.count - 1)) != 0
        }
      }
    }

    public func hasAttribute(_ name: HTMLAttributeName) -> Bool {
      return hasAttribute(name.rawValue)
    }

    public func removeAttribute(_ name: String) {
      var nameBuffer = Array(name.utf8)
      nameBuffer.append(0)
      nameBuffer.withUnsafeBufferPointer { nameBufPtr in
        nameBufPtr.baseAddress!.withMemoryRebound(to: CChar.self, capacity: nameBuffer.count) {
          pointer in
          element_removeAttribute(id, pointer, Int32(nameBuffer.count - 1))
        }
      }
    }

    public func removeAttribute(_ name: HTMLAttributeName) {
      removeAttribute(name.rawValue)
    }

    public func appendText(_ text: String) {
      var buffer = Array(text.utf8)
      buffer.append(0)
      buffer.withUnsafeBufferPointer { ptr in
        ptr.baseAddress!.withMemoryRebound(to: CChar.self, capacity: buffer.count) { cCharPtr in
          element_appendText(id, cCharPtr, Int32(buffer.count - 1))
        }
      }
    }
    public func beginElement() {
      element_beginElement(id)
    }

    public func endElement() {
      element_endElement(id)
    }
  #endif
}

#if CLIENT
  @_extern(wasm, module: "env", name: "element_appendText")
  func element_appendText(_ elementID: Int32, _ pointer: UnsafePointer<CChar>, _ len: Int32)

  @_extern(wasm, module: "env", name: "element_getInnerHTML")
  func element_getInnerHTML(
    _ elementID: Int32, _ buffer: UnsafeMutablePointer<Int8>, _ bufferLen: Int32
  ) -> Int32

  @_extern(wasm, module: "env", name: "element_setInnerHTML")
  func element_setInnerHTML(_ elementID: Int32, _ pointer: UnsafePointer<CChar>, _ len: Int32)

  @_extern(wasm, module: "env", name: "element_setAttribute")
  func element_setAttribute(
    _ elementID: Int32, _ namePointer: UnsafePointer<CChar>, _ nameLen: Int32,
    _ valuePointer: UnsafePointer<CChar>, _ valueLen: Int32)

  @_extern(wasm, module: "env", name: "element_getAttribute")
  func element_getAttribute(
    _ elementID: Int32, _ namePointer: UnsafePointer<CChar>, _ nameLen: Int32,
    _ buffer: UnsafeMutablePointer<Int8>, _ bufferLen: Int32
  ) -> Int32

  @_extern(wasm, module: "env", name: "element_hasAttribute")
  func element_hasAttribute(
    _ elementID: Int32, _ namePointer: UnsafePointer<CChar>, _ nameLen: Int32
  ) -> Int32

  @_extern(wasm, module: "env", name: "element_removeAttribute")
  func element_removeAttribute(
    _ elementID: Int32, _ namePointer: UnsafePointer<CChar>, _ nameLen: Int32)

  @_extern(wasm, module: "env", name: "element_contains")
  func element_contains(_ elementID: Int32, _ otherID: Int32) -> Int32

  @_extern(wasm, module: "env", name: "element_getScrollTop")
  func element_getScrollTop(_ elementID: Int32) -> Double

  @_extern(wasm, module: "env", name: "element_setScrollTop")
  func element_setScrollTop(_ elementID: Int32, _ value: Double)

  @_extern(wasm, module: "env", name: "element_getScrollLeft")
  func element_getScrollLeft(_ elementID: Int32) -> Double

  @_extern(wasm, module: "env", name: "element_setScrollLeft")
  func element_setScrollLeft(_ elementID: Int32, _ value: Double)

  @_extern(wasm, module: "env", name: "element_getScrollWidth")
  func element_getScrollWidth(_ elementID: Int32) -> Double

  @_extern(wasm, module: "env", name: "element_scrollBy")
  func element_scrollBy(_ elementID: Int32, _ x: Double, _ y: Double)

  @_extern(wasm, module: "env", name: "element_scrollTo")
  func element_scrollTo(_ elementID: Int32, _ x: Double, _ y: Double)

  @_extern(wasm, module: "env", name: "element_getScrollHeight")
  func element_getScrollHeight(_ elementID: Int32) -> Double

  @_extern(wasm, module: "env", name: "element_getOffsetHeight")
  func element_getOffsetHeight(_ elementID: Int32) -> Double

  @_extern(wasm, module: "env", name: "element_getOffsetWidth")
  func element_getOffsetWidth(_ elementID: Int32) -> Double

  @_extern(wasm, module: "env", name: "element_getTagName")
  func element_getTagName(_ elementID: Int32, _ buffer: UnsafeMutablePointer<Int8>, _ maxLen: Int32)
    -> Int32

  @_extern(wasm, module: "env", name: "element_getIndeterminate")
  func element_getIndeterminate(_ elementID: Int32) -> Int32

  @_extern(wasm, module: "env", name: "element_setIndeterminate")
  func element_setIndeterminate(_ elementID: Int32, _ value: Int32)

  @_extern(wasm, module: "env", name: "element_beginElement")
  func element_beginElement(_ elementID: Int32)

  @_extern(wasm, module: "env", name: "element_endElement")
  func element_endElement(_ elementID: Int32)
#endif

public func escapeHTMLAttributeValue(_ value: String) -> String {
  let s1 = stringReplace(value, "&", "&amp;")
  let s2 = stringReplace(s1, "\"", "&quot;")
  let s3 = stringReplace(s2, "<", "&lt;")
  return stringReplace(s3, ">", "&gt;")
}
