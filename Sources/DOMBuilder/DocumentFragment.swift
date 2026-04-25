import EmbeddedSwiftUtilities
import WebTypes

#if SERVER
  public class DocumentFragment: Node, @unchecked Sendable {
    public var children: [Node]
    public init(_ children: [Node]) {
      self.children = children
      super.init()
    }
    public override func build(indent: Int = 0) -> String {
      var result = ""
      for (index, node) in children.enumerated() {
        result = "\(result)\(node.build(indent: indent))"
        if index < children.count - 1 { result = "\(result)\n" }
      }
      return result
    }
    public override var nodeType: HTMLNodeType { .documentFragmentNode }
  }
#endif

#if CLIENT
  public class DocumentFragment: Node, @unchecked Sendable {
    public var children: [Node]
    public init(_ children: [Node]) {
      self.children = children
      super.init()
    }
    public override init(id: Int32) {
      self.children = []
      super.init(id: id)
    }
    public override func build(indent: Int = 0) -> String {
      var result = ""
      for (index, node) in children.enumerated() {
        result = "\(result)\(node.build(indent: indent))"
        if index < children.count - 1 { result = "\(result)\n" }
      }
      return result
    }
    public override var nodeType: HTMLNodeType { .documentFragmentNode }
  }
#endif
