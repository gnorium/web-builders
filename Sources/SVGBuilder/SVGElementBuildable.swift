import CSSBuilder
import DOMBuilder
import EmbeddedSwiftUtilities
import HTMLBuilder
import WebTypes

/// Base protocol for all SVG elements in the document tree.
/// Corresponds to the W3C SVGElement interface.
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

  public func xmlSpace(_ value: SVGXMLSpace) -> Self {
    addingAttribute("xml:space", value.rawValue)
  }

  public var description: String {
    build(indent: 0)
  }
}
