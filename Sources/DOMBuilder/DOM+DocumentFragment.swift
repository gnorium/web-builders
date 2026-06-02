import EmbeddedSwiftUtilities
import WebTypes

extension DOM {
  #if SERVER
    public class DocumentFragment: Node, @unchecked Sendable {
      public var children: [Node]
      public init(_ children: [Node]) {
        self.children = children
        super.init()
      }
      public override func render(indent: Int = 0) -> String {
        var result = ""
        for (index, node) in children.enumerated() {
          result = "\(result)\(node.render(indent: indent))"
          if index < children.count - 1 { result = "\(result)\n" }
        }
        return result
      }
      public override var nodeType: HTML.NodeType { .documentFragmentNode }
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
      public override func render(indent: Int = 0) -> String {
        var result = ""
        for (index, node) in children.enumerated() {
          result = "\(result)\(node.render(indent: indent))"
          if index < children.count - 1 { result = "\(result)\n" }
        }
        return result
      }
      public override var nodeType: HTML.NodeType { .documentFragmentNode }
    }
  #endif
}
