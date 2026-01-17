#if !os(WASI)

import Foundation
import WebTypes

/// SVG animateTransform element for transform animations.
/// https://www.w3.org/TR/SVG2/animate.html#AnimateTransformElement
public struct SVGAnimateTransformElement: SVGAnimationElement, Sendable {
	public let attributes: [(String, String)]
	
	public init() {
		self.attributes = []
	}
	
	private init(attributes: [(String, String)]) {
		self.attributes = attributes
	}
	
	public func render(indent: Int = 0) -> String {
		let ind = String(repeating: "  ", count: indent)
		let attrs = attributes.isEmpty ? "" : " " + attributes.map { "\($0.0)=\"\($0.1)\"" }.joined(separator: " ")
		return "\(ind)<animateTransform\(attrs)></animateTransform>"
	}
	
	public func addingAttribute(_ key: String, _ value: String) -> SVGAnimateTransformElement {
		var newAttributes = attributes
		newAttributes.removeAll { $0.0 == key }
		newAttributes.append((key, value))
		return SVGAnimateTransformElement(attributes: newAttributes)
	}
	
	// MARK: - AnimateTransform-Specific Attributes
	
	public func type(_ value: SVGAnimateTransform.`Type`) -> SVGAnimateTransformElement {
		addingAttribute("type", value.rawValue)
	}
	
	// MARK: - Rotation (angle, cx, cy)
	
	public func from(_ angle: Int, _ cx: Int, _ cy: Int) -> SVGAnimateTransformElement {
		addingAttribute("from", "\(angle) \(cx) \(cy)")
	}
	
	public func from(_ angle: Double, _ cx: Double, _ cy: Double) -> SVGAnimateTransformElement {
		addingAttribute("from", "\(angle) \(cx) \(cy)")
	}
	
	public func to(_ angle: Int, _ cx: Int, _ cy: Int) -> SVGAnimateTransformElement {
		addingAttribute("to", "\(angle) \(cx) \(cy)")
	}
	
	public func to(_ angle: Double, _ cx: Double, _ cy: Double) -> SVGAnimateTransformElement {
		addingAttribute("to", "\(angle) \(cx) \(cy)")
	}
	
	// MARK: - Values
	
	public func values(_ items: String...) -> SVGAnimateTransformElement {
		addingAttribute("values", items.joined(separator: "; "))
	}
	
	// MARK: - Key Times (variadic)
	
	public func keyTimes(_ values: Double...) -> SVGAnimateTransformElement {
		let str = values.map { String($0) }.joined(separator: "; ")
		return addingAttribute("keyTimes", str)
	}
	
	public func calcMode(_ value: SVGAnimate.CalcMode) -> SVGAnimateTransformElement {
		addingAttribute("calcMode", value.rawValue)
	}
	
	public func keySplines(_ values: (Double, Double, Double, Double)...) -> SVGAnimateTransformElement {
		let str = values.map { "\($0.0) \($0.1) \($0.2) \($0.3)" }.joined(separator: "; ")
		return addingAttribute("keySplines", str)
	}
}

/// Factory function for animateTransform element
public func animateTransform() -> SVGAnimateTransformElement { SVGAnimateTransformElement() }

#endif
