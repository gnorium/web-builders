import DOMBuilder
import EmbeddedSwiftUtilities
import HTMLBuilder
import WebTypes

extension SVG {
  open class SVGElement: DOM.Element, SVGElementBuildable, @unchecked Sendable {
    public init(
      _ tag: String, attributes: [(String, String)] = [], children: [DOM.Node] = [],
      selfClosing: Bool = false
    ) {
      super.init(
        ns: .svg, tag: tag, attributes: attributes, children: children, selfClosing: selfClosing,
        inline: true)
    }

    public override init(id: Int32) {
      super.init(id: id)
    }

    @discardableResult
    open override func addingAttribute(_ key: String, _ value: String) -> Self {
      super.addingAttribute(key, value)
      return self
    }
  }
}
