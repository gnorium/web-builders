#if !os(WASI)

import WebTypes

/// Protocol for SVGProtocol elements whose rendering is defined by geometry (shapes).
/// Corresponds to the W3C SVGGeometryElementProtocol interface.
/// https://www.w3.org/TR/SVG2/types.html#InterfaceSVGGeometryElementProtocol
public protocol SVGGeometryElementProtocol: SVGGraphicsElementProtocol {}

/// Default implementations for SVGGeometryElementProtocol-specific attributes
extension SVGGeometryElementProtocol {
	// MARK: - Path Length (unique to geometry elements)
	
	public func pathLength(_ value: Double) -> Self {
		addingAttribute("pathLength", "\(value)")
	}
}

#endif
