import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import HTMLBuilder
import WebTypes

extension SVG {
  public class SVGMetadataElement: SVGElement, @unchecked Sendable {
    public init(@HTMLBuilder content: () -> [DOM.Node] = { [] }) {
      super.init("metadata", children: content())
    }
    public override init(id: Int32) { super.init(id: id) }
  }
}

public func metadata(@HTMLBuilder content: () -> [DOM.Node] = { [] }) -> SVG.SVGMetadataElement {
  SVG.SVGMetadataElement(content: content)
}
