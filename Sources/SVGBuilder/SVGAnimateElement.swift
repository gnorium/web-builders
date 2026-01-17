#if !os(WASI)

import Foundation
import WebTypes

/// SVG animate element for SMIL animations.
/// https://www.w3.org/TR/SVG2/animate.html#AnimateElement
public struct SVGAnimateElement: SVGAnimationElement, Sendable {
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
		return "\(ind)<animate\(attrs)></animate>"
	}
	
	public func addingAttribute(_ key: String, _ value: String) -> SVGAnimateElement {
		var newAttributes = attributes
		newAttributes.removeAll { $0.0 == key }
		newAttributes.append((key, value))
		return SVGAnimateElement(attributes: newAttributes)
	}
	
	// MARK: - Variadic Values Overloads
	
	public func values(_ items: String...) -> SVGAnimateElement {
		addingAttribute("values", items.joined(separator: "; "))
	}
	
	public func values(_ items: Length...) -> SVGAnimateElement {
		addingAttribute("values", items.map { $0.value }.joined(separator: "; "))
	}
	
	public func values(_ items: Percentage...) -> SVGAnimateElement {
		addingAttribute("values", items.map { $0.value }.joined(separator: "; "))
	}
	
	public func values(_ paths: [SVGPath.Definition.Command]...) -> SVGAnimateElement {
		let pathStrings = paths.map { commands in
			commands.map { $0.pathString }.joined(separator: " ")
		}
		return addingAttribute("values", pathStrings.joined(separator: "; "))
	}
	
	// MARK: - Key Times (variadic)
	
	public func keyTimes(_ values: Double...) -> SVGAnimateElement {
		let str = values.map { String($0) }.joined(separator: "; ")
		return addingAttribute("keyTimes", str)
	}
	
	// MARK: - Key Splines (variadic tuples)
	
	public func keySplines(_ values: (Double, Double, Double, Double)...) -> SVGAnimateElement {
		let str = values.map { "\($0.0) \($0.1) \($0.2) \($0.3)" }.joined(separator: "; ")
		return addingAttribute("keySplines", str)
	}
	
	// MARK: - Rotation (angle, cx, cy)
	
	public func from(_ angle: Int, _ cx: Int, _ cy: Int) -> SVGAnimateElement {
		addingAttribute("from", "\(angle) \(cx) \(cy)")
	}
	
	public func from(_ angle: Double, _ cx: Double, _ cy: Double) -> SVGAnimateElement {
		addingAttribute("from", "\(angle) \(cx) \(cy)")
	}
	
	public func to(_ angle: Int, _ cx: Int, _ cy: Int) -> SVGAnimateElement {
		addingAttribute("to", "\(angle) \(cx) \(cy)")
	}
	
	public func to(_ angle: Double, _ cx: Double, _ cy: Double) -> SVGAnimateElement {
		addingAttribute("to", "\(angle) \(cx) \(cy)")
	}
}

/// Factory function for animate element
public func animate() -> SVGAnimateElement { SVGAnimateElement() }

#endif
