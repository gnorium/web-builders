#if !os(WASI)

import Foundation
import CSSBuilder
import JSONFormat
import JSONLDFormat
import WebTypes

/// Generic HTML element that can represent any HTML tag
public struct HTMLGenericElement: HTMLElement, Sendable, CustomStringConvertible {
	let name: String
	public let attributes: [(String, String)]
	let children: [any HTML]
	let selfClosing: Bool

	public init(_ name: String, selfClosing: Bool = false) {
		self.name = name
		self.attributes = []
		self.children = []
		self.selfClosing = selfClosing
	}

	public init(_ name: String, @HTMLBuilder content: () -> [any HTML]) {
		self.name = name
		self.attributes = []
		self.children = content()
		self.selfClosing = false
	}

	private init(name: String, attributes: [(String, String)], children: [any HTML], selfClosing: Bool) {
		self.name = name
		self.attributes = attributes
		self.children = children
		self.selfClosing = selfClosing
	}

	public func render(indent: Int = 0) -> String {
		let ind = String(repeating: "  ", count: indent)
		let attributeString = renderAttributes()

		if selfClosing {
			return ind + "<\(name)\(attributeString) />"
		}

		let openElement = "<\(name)\(attributeString)>"
		let closeElement = "</\(name)>"

		guard !children.isEmpty else {
			return ind + openElement + closeElement
		}

		if children.count == 1, let textChild = children.first as? HTMLText, !textChild.content.contains("\n") {
			return ind + openElement + textChild.content + closeElement
		}

		let renderedChildren = children.compactMap {
			let rendered = $0.render(indent: indent + 1)
			return rendered.isEmpty ? nil : rendered
		}

		guard !renderedChildren.isEmpty else {
			return ind + openElement + closeElement
		}

		let inner = renderedChildren.joined(separator: "\n")
		return "\(ind)\(openElement)\n\(inner)\n\(ind)\(closeElement)"
	}

	private func renderAttributes() -> String {
		guard !attributes.isEmpty else { return "" }
		return " " + attributes
			.map { key, value in
				let escapedValue = value
					.replacingOccurrences(of: "&", with: "&amp;")
					.replacingOccurrences(of: "\"", with: "&quot;")
					.replacingOccurrences(of: "<", with: "&lt;")
					.replacingOccurrences(of: ">", with: "&gt;")
				return "\(key)=\"\(escapedValue)\""
			}
			.joined(separator: " ")
	}

	public var description: String {
		render(indent: 0)
	}

	public func callAsFunction(@HTMLBuilder content: () -> [any HTML]) -> HTMLGenericElement {
		HTMLGenericElement(name: name, attributes: attributes, children: content(), selfClosing: selfClosing)
	}

	public func addingAttribute(_ key: String, _ value: String) -> HTMLGenericElement {
		var newAttributes = attributes
		newAttributes.removeAll { $0.0 == key }
		newAttributes.append((key, value))
		return HTMLGenericElement(name: name, attributes: newAttributes, children: children, selfClosing: selfClosing)
	}

	public func style(prefix: Bool = true, @CSSBuilder _ content: () -> [any CSS]) -> HTMLGenericElement {
		let cssItems = content()
		let className = attributes.first(where: { $0.0 == "class" })?.1 ?? ""
		let existingStyle = attributes.first(where: { $0.0 == "style" })?.1

		let (inlineStyle, _) = processStyleBlock(
			cssItems: cssItems,
			prefix: prefix,
			className: className,
			existingStyle: existingStyle
		)

		return inlineStyle.isEmpty ? self : addingAttribute("style", inlineStyle)
	}
}

// Element-specific methods for HTMLGenericElement
extension HTMLGenericElement {
	public func href(_ value: String) -> HTMLGenericElement {
		addingAttribute("href", value)
	}

	public func src(_ value: String) -> HTMLGenericElement {
		addingAttribute("src", value)
	}

	public func placeholder(_ value: String) -> HTMLGenericElement {
		addingAttribute("placeholder", value)
	}

	public func value(_ value: String) -> HTMLGenericElement {
		addingAttribute("value", value)
	}

	public func name(_ value: String) -> HTMLGenericElement {
		addingAttribute("name", value)
	}

	public func name(_ value: HTMLMeta.Name) -> HTMLGenericElement {
		addingAttribute("name", value.rawValue)
	}

	public func type(_ value: String) -> HTMLGenericElement {
		addingAttribute("type", value)
	}

	public func rel(_ value: String) -> HTMLGenericElement {
		addingAttribute("rel", value)
	}

	public func rel(_ value: HTMLLink.Relationship) -> HTMLGenericElement {
		addingAttribute("rel", value.rawValue)
	}

	public func sizes(_ value: String) -> HTMLGenericElement {
		addingAttribute("sizes", value)
	}

	public func sizes(_ width: Int, _ height: Int) -> HTMLGenericElement {
		addingAttribute("sizes", "\(width)x\(height)")
	}

	public func media(_ value: String) -> HTMLGenericElement {
		addingAttribute("media", value)
	}

	public func crossorigin(_ value: String) -> HTMLGenericElement {
		addingAttribute("crossorigin", value)
	}

	public func crossorigin(_ value: HTMLLink.CrossOrigin) -> HTMLGenericElement {
		addingAttribute("crossorigin", value.rawValue)
	}

	public func `as`(_ value: HTMLLink.As) -> HTMLGenericElement {
		addingAttribute("as", value.rawValue)
	}

	public func open(_ value: Bool = true) -> HTMLGenericElement {
		value ? addingAttribute("open", "open") : self
	}

	public func charset(_ value: String) -> HTMLGenericElement {
		addingAttribute("charset", value)
	}

	public func charset(_ value: HTMLMeta.CharSet) -> HTMLGenericElement {
		addingAttribute("charset", value.rawValue)
	}

	public func content(_ value: String) -> HTMLGenericElement {
		addingAttribute("content", value)
	}

	public func content(_ builder: () -> HTMLMeta.Name.Viewport.Content) -> HTMLGenericElement {
		addingAttribute("content", builder().render())
	}

	public func content(_ directives: HTMLMeta.Name.Robots...) -> HTMLGenericElement {
		addingAttribute("content", directives.map { $0.rawValue }.joined(separator: ", "))
	}

	public func content(_ value: HTMLMeta.Property.OpenGraph.`Type`.Content) -> HTMLGenericElement {
		addingAttribute("content", value.rawValue)
	}

	public func content(_ value: Int) -> HTMLGenericElement {
		addingAttribute("content", "\(value)")
	}

	public func content(_ value: HTMLLocale) -> HTMLGenericElement {
		addingAttribute("content", value.value)
	}

	public func content(_ value: HTMLMeta.Name.TwitterCard.Content) -> HTMLGenericElement {
		addingAttribute("content", value.rawValue)
	}

	public func content(_ value: HTMLMeta.Name.MobileWebAppCapable.Content) -> HTMLGenericElement {
		addingAttribute("content", value.rawValue)
	}

	public func httpEquiv(_ value: String) -> HTMLGenericElement {
		addingAttribute("http-equiv", value)
	}

	public func property(_ value: String) -> HTMLGenericElement {
		addingAttribute("property", value)
	}

	public func property(_ value: HTMLMeta.Property.OpenGraph) -> HTMLGenericElement {
		addingAttribute("property", value.rawValue)
	}

	public func lang(_ value: String) -> HTMLGenericElement {
		addingAttribute("lang", value)
	}

	public func lang(_ value: HTMLLang) -> HTMLGenericElement {
		addingAttribute("lang", value.rawValue)
	}

	public func dir(_ value: String) -> HTMLGenericElement {
		addingAttribute("dir", value)
	}

	public func tabindex(_ value: Int) -> HTMLGenericElement {
		addingAttribute("tabindex", "\(value)")
	}

	public func accesskey(_ value: String) -> HTMLGenericElement {
		addingAttribute("accesskey", value)
	}

	public func contenteditable(_ value: Bool = true) -> HTMLGenericElement {
		addingAttribute("contenteditable", value ? "true" : "false")
	}

	public func draggable(_ value: Bool = true) -> HTMLGenericElement {
		addingAttribute("draggable", value ? "true" : "false")
	}

	public func hidden(_ value: Bool = true) -> HTMLGenericElement {
		value ? addingAttribute("hidden", "hidden") : self
	}

	public func spellcheck(_ value: Bool = true) -> HTMLGenericElement {
		addingAttribute("spellcheck", value ? "true" : "false")
	}

	public func translate(_ value: Bool = true) -> HTMLGenericElement {
		addingAttribute("translate", value ? "yes" : "no")
	}

	public func onClick(_ value: String) -> HTMLGenericElement {
		addingAttribute("onclick", value)
	}

	public func onChange(_ value: String) -> HTMLGenericElement {
		addingAttribute("onchange", value)
	}

	public func onSubmit(_ value: String) -> HTMLGenericElement {
		addingAttribute("onsubmit", value)
	}

	public func onInput(_ value: String) -> HTMLGenericElement {
		addingAttribute("oninput", value)
	}

	public func onFocus(_ value: String) -> HTMLGenericElement {
		addingAttribute("onfocus", value)
	}

	public func onBlur(_ value: String) -> HTMLGenericElement {
		addingAttribute("onblur", value)
	}

	public func onKeyDown(_ value: String) -> HTMLGenericElement {
		addingAttribute("onkeydown", value)
	}

	public func onKeyUp(_ value: String) -> HTMLGenericElement {
		addingAttribute("onkeyup", value)
	}

	public func onMouseEnter(_ value: String) -> HTMLGenericElement {
		addingAttribute("onmouseenter", value)
	}

	public func onMouseLeave(_ value: String) -> HTMLGenericElement {
		addingAttribute("onmouseleave", value)
	}

}

public func noscript(@HTMLBuilder content: () -> [any HTML] = { [] }) -> HTMLGenericElement { HTMLGenericElement("noscript", content: content) }
public func section(@HTMLBuilder content: () -> [any HTML] = { [] }) -> HTMLGenericElement { HTMLGenericElement("section", content: content) }
public func nav(@HTMLBuilder content: () -> [any HTML] = { [] }) -> HTMLGenericElement { HTMLGenericElement("nav", content: content) }
public func article(@HTMLBuilder content: () -> [any HTML] = { [] }) -> HTMLGenericElement { HTMLGenericElement("article", content: content) }
public func aside(@HTMLBuilder content: () -> [any HTML] = { [] }) -> HTMLGenericElement { HTMLGenericElement("aside", content: content) }
public func header(@HTMLBuilder content: () -> [any HTML] = { [] }) -> HTMLGenericElement { HTMLGenericElement("header", content: content) }
public func footer(@HTMLBuilder content: () -> [any HTML] = { [] }) -> HTMLGenericElement { HTMLGenericElement("footer", content: content) }
public func main(@HTMLBuilder content: () -> [any HTML] = { [] }) -> HTMLGenericElement { HTMLGenericElement("main", content: content) }
public func address(@HTMLBuilder content: () -> [any HTML] = { [] }) -> HTMLGenericElement { HTMLGenericElement("address", content: content) }
public func dt(@HTMLBuilder content: () -> [any HTML] = { [] }) -> HTMLGenericElement { HTMLGenericElement("dt", content: content) }
public func dd(@HTMLBuilder content: () -> [any HTML] = { [] }) -> HTMLGenericElement { HTMLGenericElement("dd", content: content) }
public func figure(@HTMLBuilder content: () -> [any HTML] = { [] }) -> HTMLGenericElement { HTMLGenericElement("figure", content: content) }
public func figcaption(@HTMLBuilder content: () -> [any HTML] = { [] }) -> HTMLGenericElement { HTMLGenericElement("figcaption", content: content) }
public func em(@HTMLBuilder content: () -> [any HTML] = { [] }) -> HTMLGenericElement { HTMLGenericElement("em", content: content) }
public func strong(@HTMLBuilder content: () -> [any HTML] = { [] }) -> HTMLGenericElement { HTMLGenericElement("strong", content: content) }
public func small(@HTMLBuilder content: () -> [any HTML] = { [] }) -> HTMLGenericElement { HTMLGenericElement("small", content: content) }
public func s(@HTMLBuilder content: () -> [any HTML] = { [] }) -> HTMLGenericElement { HTMLGenericElement("s", content: content) }
public func cite(@HTMLBuilder content: () -> [any HTML] = { [] }) -> HTMLGenericElement { HTMLGenericElement("cite", content: content) }
public func dfn(@HTMLBuilder content: () -> [any HTML] = { [] }) -> HTMLGenericElement { HTMLGenericElement("dfn", content: content) }
public func abbr(@HTMLBuilder content: () -> [any HTML] = { [] }) -> HTMLGenericElement { HTMLGenericElement("abbr", content: content) }
public func ruby(@HTMLBuilder content: () -> [any HTML] = { [] }) -> HTMLGenericElement { HTMLGenericElement("ruby", content: content) }
public func rt(@HTMLBuilder content: () -> [any HTML] = { [] }) -> HTMLGenericElement { HTMLGenericElement("rt", content: content) }
public func rp(@HTMLBuilder content: () -> [any HTML] = { [] }) -> HTMLGenericElement { HTMLGenericElement("rp", content: content) }
public func code(@HTMLBuilder content: () -> [any HTML] = { [] }) -> HTMLGenericElement { HTMLGenericElement("code", content: content) }
public func `var`(@HTMLBuilder content: () -> [any HTML] = { [] }) -> HTMLGenericElement { HTMLGenericElement("var", content: content) }
public func samp(@HTMLBuilder content: () -> [any HTML] = { [] }) -> HTMLGenericElement { HTMLGenericElement("samp", content: content) }
public func kbd(@HTMLBuilder content: () -> [any HTML] = { [] }) -> HTMLGenericElement { HTMLGenericElement("kbd", content: content) }
public func sub(@HTMLBuilder content: () -> [any HTML] = { [] }) -> HTMLGenericElement { HTMLGenericElement("sub", content: content) }
public func sup(@HTMLBuilder content: () -> [any HTML] = { [] }) -> HTMLGenericElement { HTMLGenericElement("sup", content: content) }
public func i(@HTMLBuilder content: () -> [any HTML] = { [] }) -> HTMLGenericElement { HTMLGenericElement("i", content: content) }
public func b(@HTMLBuilder content: () -> [any HTML] = { [] }) -> HTMLGenericElement { HTMLGenericElement("b", content: content) }
public func u(@HTMLBuilder content: () -> [any HTML] = { [] }) -> HTMLGenericElement { HTMLGenericElement("u", content: content) }
public func mark(@HTMLBuilder content: () -> [any HTML] = { [] }) -> HTMLGenericElement { HTMLGenericElement("mark", content: content) }
public func bdi(@HTMLBuilder content: () -> [any HTML] = { [] }) -> HTMLGenericElement { HTMLGenericElement("bdi", content: content) }
public func bdo(@HTMLBuilder content: () -> [any HTML] = { [] }) -> HTMLGenericElement { HTMLGenericElement("bdo", content: content) }
public func wbr() -> HTMLGenericElement { HTMLGenericElement("wbr", selfClosing: true) }
public func summary(@HTMLBuilder content: () -> [any HTML] = { [] }) -> HTMLGenericElement { HTMLGenericElement("summary", content: content) }

#endif
