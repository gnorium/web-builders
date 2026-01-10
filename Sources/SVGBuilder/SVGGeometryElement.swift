#if !os(WASI)

import WebTypes

/// Protocol for SVG elements whose rendering is defined by geometry (shapes).
/// Corresponds to the W3C SVGGeometryElement interface.
/// https://www.w3.org/TR/SVG2/types.html#InterfaceSVGGeometryElement
public protocol SVGGeometryElement: SVGGraphicsElement {}

/// Default implementations for SVGGeometryElement-specific attributes
extension SVGGeometryElement {
	// MARK: - Path Length (unique to geometry elements)
	
	public func pathLength(_ value: Double) -> Self {
		addingAttribute("pathLength", "\(value)")
	}
}

#endif
