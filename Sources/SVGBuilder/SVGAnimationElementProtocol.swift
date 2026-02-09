#if !os(WASI)

import WebTypes

/// Protocol for SVGProtocol animation elements (animate, animateTransform, etc.).
/// Corresponds to the W3C SVGAnimationElementProtocol interface.
/// https://www.w3.org/TR/SVG2/animate.html#InterfaceSVGAnimationElementProtocol
public protocol SVGAnimationElementProtocol: SVGElementProtocol {}

/// Default implementations for SVGAnimationElementProtocol SMIL attributes
extension SVGAnimationElementProtocol {
	// MARK: - Target
	
	public func attributeName(_ value: SVGAttributeName) -> Self {
		addingAttribute("attributeName", value.rawValue)
	}
	
	public func attributeName(_ value: String) -> Self {
		addingAttribute("attributeName", value)
	}
	
	public func attributeType(_ value: String) -> Self {
		addingAttribute("attributeType", value)
	}
	
	// MARK: - Timing
	
	public func begin(_ value: SVGAnimate.Begin) -> Self {
		addingAttribute("begin", value.rawValue)
	}
	
	public func begin(_ value: String) -> Self {
		addingAttribute("begin", value)
	}
	
	public func dur(_ value: CSSTime) -> Self {
		addingAttribute("dur", value.value)
	}
	
	public func end(_ value: String) -> Self {
		addingAttribute("end", value)
	}
	
	public func repeatCount(_ value: SVGAnimate.RepeatCount) -> Self {
		addingAttribute("repeatCount", value.value)
	}
	
	public func repeatCount(_ value: Int) -> Self {
		repeatCount(.count(value))
	}
	
	public func repeatDur(_ value: String) -> Self {
		addingAttribute("repeatDur", value)
	}
	
	public func fill(_ value: SVGAnimate.Fill) -> Self {
		addingAttribute("fill", value.rawValue)
	}
	
	// MARK: - Values
	
	public func from(_ value: String) -> Self {
		addingAttribute("from", value)
	}
	
	public func from(_ value: Double) -> Self {
		addingAttribute("from", "\(value)")
	}
	
	public func from(_ value: Int) -> Self {
		addingAttribute("from", "\(value)")
	}
	
	public func to(_ value: String) -> Self {
		addingAttribute("to", value)
	}
	
	public func to(_ value: Double) -> Self {
		addingAttribute("to", "\(value)")
	}
	
	public func to(_ value: Int) -> Self {
		addingAttribute("to", "\(value)")
	}
	
	public func by(_ value: String) -> Self {
		addingAttribute("by", value)
	}
	
	public func values(_ value: String) -> Self {
		addingAttribute("values", value)
	}
	
	// MARK: - Pacing & Interpolation
	
	public func calcMode(_ value: SVGAnimate.CalcMode) -> Self {
		addingAttribute("calcMode", value.rawValue)
	}
	
	public func keyTimes(_ value: String) -> Self {
		addingAttribute("keyTimes", value)
	}
	
	public func keySplines(_ value: String) -> Self {
		addingAttribute("keySplines", value)
	}
	
	// MARK: - Additive & Accumulate
	
	public func additive(_ value: String) -> Self {
		addingAttribute("additive", value)
	}
	
	public func accumulate(_ value: String) -> Self {
		addingAttribute("accumulate", value)
	}
}

#endif
