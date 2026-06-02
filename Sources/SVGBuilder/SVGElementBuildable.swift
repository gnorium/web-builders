import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import HTMLBuilder
import WebTypes

/// Base protocol for all SVG elements in the document tree.
/// Corresponds to the W3C SVG.SVGElement interface.
/// https://www.w3.org/TR/SVG2/types.html#InterfaceSVGElement
public protocol SVGElementBuildable: HTMLElementBuildable, SVGContent, CustomStringConvertible {
  var attributes: [(String, String)] { get }
  func addingAttribute(_ key: String, _ value: String) -> Self
}

/// Default implementations for core SVG element attributes
extension SVGElementBuildable {
  // MARK: - XML Namespace Attributes

  public func xmlns(_ value: String) -> Self {
    addingAttribute("xmlns", value)
  }

  public func xmlnsXlink(_ value: String) -> Self {
    addingAttribute("xmlns:xlink", value)
  }

  public func xmlSpace(_ value: String) -> Self {
    addingAttribute("xml:space", value)
  }

  public func xmlSpace(_ value: SVG.XMLSpace) -> Self {
    addingAttribute("xml:space", value.rawValue)
  }

  public func draggable(_ value: Bool = true) -> Self {
    addingAttribute("draggable", value ? "true" : "false")
  }

  /// Font presentation attributes for SVG text elements.
  public func fontFamily(_ value: String) -> Self { addingAttribute("font-family", value) }
  public func fontSize(_ value: String) -> Self { addingAttribute("font-size", value) }
  public func fontSize(_ value: CSS.Length) -> Self { addingAttribute("font-size", value.value) }
  public func fontWeight(_ value: String) -> Self { addingAttribute("font-weight", value) }
  public func fontStyle(_ value: CSS.FontStyle) -> Self { addingAttribute("font-style", value.rawValue) }
  public func strokeDasharray(_ value: String) -> Self { addingAttribute("stroke-dasharray", value) }
  public func markerEnd(_ value: String) -> Self { addingAttribute("marker-end", value) }

  public var description: String {
    render(indent: 0)
  }
}
