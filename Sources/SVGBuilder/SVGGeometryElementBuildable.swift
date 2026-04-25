import DOMBuilder
import EmbeddedSwiftUtilities
import HTMLBuilder
import WebTypes

/// Protocol for SVG elements whose rendering is defined by geometry (shapes).
/// Corresponds to the W3C SVGGeometryElement interface.
/// https://www.w3.org/TR/SVG2/types.html#InterfaceSVGGeometryElement
public protocol SVGGeometryElementBuildable: SVGGraphicsElementBuildable {}

/// Default implementations for SVGGeometrySerializable-specific attributes
extension SVGGeometryElementBuildable {
  // MARK: - Path Length (unique to geometry elements)

  public func pathLength(_ value: Double) -> Self {
    addingAttribute("pathLength", doubleToString(value))
  }
}
