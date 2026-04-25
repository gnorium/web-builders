import EmbeddedSwiftUtilities
import WebTypes

open class Text: Node, @unchecked Sendable {
  public let content: String
  public let isRaw: Bool

  public init(_ content: String, isRaw: Bool = false) {
    self.content = content
    self.isRaw = isRaw
    super.init()
  }

  public override init(id: Int32) {
    self.content = ""
    self.isRaw = false
    super.init(id: id)
  }

  public override func build(indent: Int = 0) -> String {
    if isRaw { return content }
    let lines = stringSplit(content, separator: "\n")
    var ind = ""
    if indent > 0 { ind = stringRepeating("  ", count: indent) }
    var result = ""
    for (index, line) in lines.enumerated() {
      result = "\(result)\(ind)\(line)"
      if index < lines.count - 1 { result = "\(result)\n" }
    }
    return result
  }

  public override var nodeType: HTMLNodeType { .textNode }

  #if CLIENT
    public var textContent: String? {
      get {
        let initialSize = 4096
        let buffer = UnsafeMutablePointer<Int8>.allocate(capacity: initialSize + 1)
        let len = element_getTextContent(id, buffer, Int32(initialSize))
        if len >= 0 {
          let result = buffer.withMemoryRebound(to: UInt8.self, capacity: Int(len)) { ptr in
            String(decoding: UnsafeBufferPointer(start: ptr, count: Int(len)), as: UTF8.self)
          }
          buffer.deallocate()
          return result
        }
        buffer.deallocate()
        return nil
      }
      set {
        guard let value = newValue else { return }
        var valueBuffer = Array(value.utf8)
        valueBuffer.append(0)
        valueBuffer.withUnsafeBufferPointer { ptr in
          ptr.baseAddress!.withMemoryRebound(to: CChar.self, capacity: valueBuffer.count) {
            cCharPtr in
            element_setTextContent(id, cCharPtr, Int32(valueBuffer.count - 1))
          }
        }
      }
    }
  #endif
}

#if CLIENT
  @_extern(wasm, module: "env", name: "element_getTextContent")
  func element_getTextContent(
    _ elementID: Int32, _ buffer: UnsafeMutablePointer<Int8>, _ bufferLen: Int32
  ) -> Int32

  @_extern(wasm, module: "env", name: "element_setTextContent")
  func element_setTextContent(_ elementID: Int32, _ pointer: UnsafePointer<CChar>, _ len: Int32)
#endif
