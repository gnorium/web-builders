#if !os(WASI)

import Foundation

/// SVGProtocol metadata, title, and desc elements.
/// https://www.w3.org/TR/SVG2/struct.html#DescriptionAndTitleElements
public struct SVGMetadataElement: SVGElementProtocol, Sendable {
	public let name: String
	public let attributes: [(String, String)]
	let text: String?
	
	public init(name: String, text: String? = nil) {
		self.name = name
		self.attributes = []
		self.text = text
	}
	
	private init(name: String, attributes: [(String, String)], text: String?) {
		self.name = name
		self.attributes = attributes
		self.text = text
	}
	
	public func render(indent: Int = 0) -> String {
		let ind = String(repeating: "  ", count: indent)
		let attrs = attributes.isEmpty ? "" : " " + attributes.map { "\($0.0)=\"\($0.1)\"" }.joined(separator: " ")
		
		if let text = text {
			return "\(ind)<\(name)\(attrs)>\(text)</\(name)>"
		} else {
			return "\(ind)<\(name)\(attrs)></\(name)>"
		}
	}
	
	public func addingAttribute(_ key: String, _ value: String) -> SVGMetadataElement {
		var newAttributes = attributes
		newAttributes.removeAll { $0.0 == key }
		newAttributes.append((key, value))
		return SVGMetadataElement(name: name, attributes: newAttributes, text: text)
	}
}

/// Factory function for desc element
public func desc(_ text: String) -> SVGMetadataElement { SVGMetadataElement(name: "desc", text: text) }

/// Factory function for title element
public func title_SVG(_ text: String) -> SVGMetadataElement { SVGMetadataElement(name: "title", text: text) }

/// Factory function for metadata element
public func metadata(_ text: String? = nil) -> SVGMetadataElement { SVGMetadataElement(name: "metadata", text: text) }

#endif
