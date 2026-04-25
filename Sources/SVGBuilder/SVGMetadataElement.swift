import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import HTMLBuilder
import WebTypes

public class SVGMetadataElement: SVGElement, @unchecked Sendable {
  public init(@HTMLBuilder content: () -> [Node] = { [] }) {
    super.init("metadata", children: content())
  }

  public override init(id: Int32) {
    super.init(id: id)
  }
}

public func metadata(@HTMLBuilder content: () -> [Node] = { [] }) -> SVGMetadataElement {
  SVGMetadataElement(content: content)
}
