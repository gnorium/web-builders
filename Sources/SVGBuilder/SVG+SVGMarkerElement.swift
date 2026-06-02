import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import HTMLBuilder
import WebTypes

extension SVG {
  public class SVGMarkerElement: SVGElement, SVGGraphicsElementBuildable, @unchecked Sendable {
    public init(@SVGBuilder content: () -> [DOM.Node] = { [] }) {
      super.init("marker", children: content())
    }

    public override init(id: Int32) {
      super.init(id: id)
    }
  }
}

extension SVG.SVGMarkerElement {
  public func id(_ value: String) -> Self { addingAttribute("id", value) }
  public func viewBox(_ x: Int, _ y: Int, _ w: Int, _ h: Int) -> Self {
    addingAttribute("viewBox", "\(x) \(y) \(w) \(h)")
  }
  public func viewBox(_ x: Double, _ y: Double, _ w: Double, _ h: Double) -> Self {
    addingAttribute("viewBox", "\(x) \(y) \(w) \(h)")
  }
  public func refX(_ value: Int) -> Self { addingAttribute("refX", intToString(value)) }
  public func refX(_ value: Double) -> Self { addingAttribute("refX", doubleToString(value)) }
  public func refY(_ value: Int) -> Self { addingAttribute("refY", intToString(value)) }
  public func refY(_ value: Double) -> Self { addingAttribute("refY", doubleToString(value)) }
  public func markerWidth(_ value: Int) -> Self { addingAttribute("markerWidth", intToString(value)) }
  public func markerHeight(_ value: Int) -> Self { addingAttribute("markerHeight", intToString(value)) }
  public func orient(_ value: String) -> Self { addingAttribute("orient", value) }
  public func orient(_ value: SVG.Marker.Orient) -> Self { addingAttribute("orient", value.rawValue) }
  public func orient(_ value: CSS.Keyword.Auto) -> Self { addingAttribute("orient", value.rawValue) }
}

public func marker(@SVGBuilder content: () -> [DOM.Node] = { [] }) -> SVG.SVGMarkerElement {
  SVG.SVGMarkerElement(content: content)
}
