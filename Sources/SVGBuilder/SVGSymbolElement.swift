import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import HTMLBuilder
import WebTypes

public class SVGSymbolElement: SVGElement, @unchecked Sendable {
  public init(@SVGBuilder content: () -> [Node] = { [] }) {
    super.init("symbol", children: content())
  }

  public override init(id: Int32) {
    super.init(id: id)
  }
}

extension SVGSymbolElement {
  public func viewBox(_ minX: Double, _ minY: Double, _ width: Double, _ height: Double) -> Self {
    addingAttribute(
      "viewBox",
      "\(doubleToString(minX)) \(doubleToString(minY)) \(doubleToString(width)) \(doubleToString(height))"
    )
  }

  public func viewBox(_ minX: Int, _ minY: Int, _ width: Int, _ height: Int) -> Self {
    addingAttribute(
      "viewBox",
      "\(intToString(minX)) \(intToString(minY)) \(intToString(width)) \(intToString(height))")
  }

  public func preserveAspectRatio(_ value: String) -> Self {
    addingAttribute("preserveAspectRatio", value)
  }
}

public func symbol(@SVGBuilder _ content: () -> [Node] = { [] }) -> SVGSymbolElement {
  SVGSymbolElement(content: content)
}
