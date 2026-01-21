#if !os(WASI)

import Foundation
import CSSBuilder

/// Lightweight element for string interpolation
/// Used for text-only elements like i, b, strong, em, etc.
public struct HTMLInlineElement: HTML, Sendable, CustomStringConvertible {
	let name: String
	public let attributes: [(String, String)]
	let content: String

	public init(_ name: String, _ content: String, attributes: [(String, String)] = []) {
		self.name = name
		self.content = content
		self.attributes = attributes
	}

	public func render(indent: Int = 0) -> String {
		let attributeString = attributes.isEmpty ? "" : " " + attributes
			.map { "\($0.0)=\"\($0.1)\"" }
			.joined(separator: " ")

		return "<\(name)\(attributeString)>\(content)</\(name)>"
	}

	public var description: String {
		render(indent: 0)
	}

	public func addingAttribute(_ key: String, _ value: String) -> HTMLInlineElement {
		var newAttributes = attributes
		newAttributes.removeAll { $0.0 == key }
		newAttributes.append((key, value))
		return HTMLInlineElement(name, content, attributes: newAttributes)
	}

	// Attribute modifiers
	public func `class`(_ value: String) -> HTMLInlineElement {
		addingAttribute("class", value)
	}

	public func id(_ value: String) -> HTMLInlineElement {
		addingAttribute("id", value)
	}

	public func title(_ value: String) -> HTMLInlineElement {
		addingAttribute("title", value)
	}

	// Inline styles only
	public func style(@CSSBuilder _ content: () -> [any CSS]) -> HTMLInlineElement {
		let declarations = content().compactMap { $0 as? CSSDeclaration }
		guard !declarations.isEmpty else { return self }

		let styleValue = declarations.map { "\($0.property): \($0.value)" }.joined(separator: "; ") + ";"
		return addingAttribute("style", styleValue)
	}
}

public func i(_ text: String) -> HTMLInlineElement { HTMLInlineElement("i", text) }
public func b(_ text: String) -> HTMLInlineElement { HTMLInlineElement("b", text) }
public func em(_ text: String) -> HTMLInlineElement { HTMLInlineElement("em", text) }
public func strong(_ text: String) -> HTMLInlineElement { HTMLInlineElement("strong", text) }
public func span(_ text: String) -> HTMLInlineElement { HTMLInlineElement("span", text) }
public func u(_ text: String) -> HTMLInlineElement { HTMLInlineElement("u", text) }
public func s(_ text: String) -> HTMLInlineElement { HTMLInlineElement("s", text) }
public func small(_ text: String) -> HTMLInlineElement { HTMLInlineElement("small", text) }
public func code(_ text: String) -> HTMLInlineElement { HTMLInlineElement("code", text) }
public func kbd(_ text: String) -> HTMLInlineElement { HTMLInlineElement("kbd", text) }
public func samp(_ text: String) -> HTMLInlineElement { HTMLInlineElement("samp", text) }
public func `var`(_ text: String) -> HTMLInlineElement { HTMLInlineElement("var", text) }
public func cite(_ text: String) -> HTMLInlineElement { HTMLInlineElement("cite", text) }
public func dfn(_ text: String) -> HTMLInlineElement { HTMLInlineElement("dfn", text) }
public func abbr(_ text: String) -> HTMLInlineElement { HTMLInlineElement("abbr", text) }
public func sub(_ text: String) -> HTMLInlineElement { HTMLInlineElement("sub", text) }
public func sup(_ text: String) -> HTMLInlineElement { HTMLInlineElement("sup", text) }
public func mark(_ text: String) -> HTMLInlineElement { HTMLInlineElement("mark", text) }

#endif
