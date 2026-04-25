import EmbeddedSwiftUtilities
import WebTypes

open class Node: NodeConvertible, CustomStringConvertible, @unchecked Sendable {
  public var description: String {
    return build()
  }
  public static func fragment(@DOMBuilder _ content: () -> [Node]) -> DocumentFragment {
    DocumentFragment(content())
  }

  public static func fragment(_ content: [Node]) -> DocumentFragment {
    DocumentFragment(content)
  }

  public static func text(_ content: String, isRaw: Bool = false) -> Text {
    Text(content, isRaw: isRaw)
  }

  public func render() -> Node { self }
  public let id: Int32

  public init() {
    self.id = -1
  }

  public init(id: Int32) {
    self.id = id
  }

  open func build(indent: Int = 0) -> String { "" }
  open var nodeType: HTMLNodeType { .textNode }

  #if CLIENT
    public var parentNode: Node? {
      let parentID = node_parentElement(id)
      return parentID >= 0 ? Node(id: parentID) : nil
    }
    public var parentElement: Element? {
      let parentID = node_parentElement(id)
      return parentID >= 0 ? Element(id: parentID) : nil
    }
    public func contains(_ other: Node) -> Bool {
      return node_contains(id, other.id) != 0
    }
    public func appendChild(_ child: Node) {
      node_appendChild(id, child.id)
    }
    public func remove() {
      node_remove(id)
    }
    public func insertBefore(_ newNode: Node, _ referenceNode: Node?) {
      node_insertBefore(id, newNode.id, referenceNode?.id ?? -1)
    }
  #endif
}

#if CLIENT
  @_extern(wasm, module: "env", name: "element_insertBefore")
  func node_insertBefore(_ parentID: Int32, _ childID: Int32, _ referenceID: Int32)

  @_extern(wasm, module: "env", name: "element_parentElement")
  func node_parentElement(_ elementID: Int32) -> Int32

  @_extern(wasm, module: "env", name: "element_contains")
  func node_contains(_ parentID: Int32, _ childID: Int32) -> Int32

  @_extern(wasm, module: "env", name: "element_appendChild")
  func node_appendChild(_ parentID: Int32, _ childID: Int32)

  @_extern(wasm, module: "env", name: "element_remove")
  func node_remove(_ elementID: Int32)
#endif
