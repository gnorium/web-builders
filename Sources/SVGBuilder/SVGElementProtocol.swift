#if !os(WASI)

import HTMLBuilder
import WebTypes

/// Base protocol for all SVGProtocol elements in the document tree.
/// Corresponds to the W3C SVGElementProtocol interface.
/// https://www.w3.org/TR/SVG2/types.html#InterfaceSVGElementProtocol
public protocol SVGElementProtocol: SVGProtocol, HTMLProtocol {
	var attributes: [(String, String)] { get }
	func addingAttribute(_ key: String, _ value: String) -> Self
}

/// Default implementations for core SVGProtocol element attributes
extension SVGElementProtocol {
	// MARK: - Core Attributes
	
	public func id(_ value: String) -> Self {
		addingAttribute("id", value)
	}
	
	public func `class`(_ value: String) -> Self {
		addingAttribute("class", value)
	}
	
	public func lang(_ value: String) -> Self {
		addingAttribute("lang", value)
	}
	
	public func tabindex(_ value: Int) -> Self {
		addingAttribute("tabindex", "\(value)")
	}
	
	// MARK: - ARIA Attributes
	
	public func ariaLabel(_ value: String) -> Self {
		addingAttribute("aria-label", value)
	}
	
	public func ariaHidden(_ value: Bool) -> Self {
		addingAttribute("aria-hidden", value ? "true" : "false")
	}
	
	public func ariaDisabled(_ value: Bool) -> Self {
		addingAttribute("aria-disabled", value ? "true" : "false")
	}
	
	public func ariaExpanded(_ value: String) -> Self {
		addingAttribute("aria-expanded", value)
	}
	
	public func ariaBusy(_ value: Bool) -> Self {
		addingAttribute("aria-busy", value ? "true" : "false")
	}
	
	public func ariaDescribedby(_ value: String) -> Self {
		addingAttribute("aria-describedby", value)
	}
	
	public func ariaLabelledby(_ value: String) -> Self {
		addingAttribute("aria-labelledby", value)
	}
	
	// MARK: - Data Attributes
	
	public func data(_ key: String, _ value: String) -> Self {
		addingAttribute("data-\(key)", value)
	}
	
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
}

#endif
