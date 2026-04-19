import CSSBuilder
import EmbeddedSwiftUtilities
import HTMLBuilder
import WebTypes
import DOMBuilder

/// Base protocol for all SVG elements in the document tree.
/// Corresponds to the W3C SVGElement interface.
/// https://www.w3.org/TR/SVG2/types.html#InterfaceSVGElement
public protocol SVGElementRenderable: HTMLElementRenderable, SVGContent, CustomStringConvertible {
	var attributes: [(String, String)] { get }
	func addingAttribute(_ key: String, _ value: String) -> Self
}

/// Default implementations for core SVG element attributes
extension SVGElementRenderable {
	// MARK: - Core Attributes
	
	public func lang(_ value: String) -> Self {
		addingAttribute("lang", value)
	}
	
	public func tabindex(_ value: Int) -> Self {
		addingAttribute("tabindex", intToString(value))
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

    public var description: String {
        serialize(indent: 0)
    }
}
