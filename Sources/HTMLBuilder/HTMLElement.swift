import CSSBuilder
import JSONFormat
import JSONLDFormat
import WebTypes
import DOMBuilder

/// Generic HTMLContent element that can represent any tag
public struct HTMLElement: HTMLElementRenderable, Sendable, CustomStringConvertible {
	let name: String
	public let attributes: [(String, String)]
	let children: [DOMNode]
	let selfClosing: Bool
	/// Phrasing (inline) content elements render children without added whitespace,
	/// matching DOM serialization behavior for elements like `<code>`, `<em>`, `<strong>`, etc.
	let inline: Bool

	public init(_ name: String, selfClosing: Bool = false) {
		self.name = name
		self.attributes = []
		self.children = []
		self.selfClosing = selfClosing
		self.inline = false
	}

	public init(_ name: String, inline: Bool = false, @HTMLBuilder content: () -> [DOMNode]) {
		self.name = name
		self.attributes = []
		self.children = content()
		self.selfClosing = false
		self.inline = inline
	}

	private init(name: String, attributes: [(String, String)], children: [DOMNode], selfClosing: Bool, inline: Bool) {
		self.name = name
		self.attributes = attributes
		self.children = children
		self.selfClosing = selfClosing
		self.inline = inline
	}

    public func toNode() -> DOMNode {
        .element(
            ns: .html,
            tag: name,
            attributes: attributes,
            children: children,
            selfClosing: selfClosing,
            inline: inline
        )
    }

	public func render(indent: Int = 0) -> String {
        toNode().render(indent: indent)
	}

	public var description: String {
		render(indent: 0)
	}

	public func callAsFunction(@HTMLBuilder content: () -> [DOMNode]) -> HTMLElement {
		HTMLElement(name: name, attributes: attributes, children: content(), selfClosing: selfClosing, inline: inline)
	}

	public func addingAttribute(_ key: String, _ value: String) -> HTMLElement {
		var newAttributes = attributes
		newAttributes.removeAll { $0.0 == key }
		newAttributes.append((key, value))
		return HTMLElement(name: name, attributes: newAttributes, children: children, selfClosing: selfClosing, inline: inline)
	}
}

// Element-specific methods for HTMLElement
extension HTMLElement {
	public func href(_ value: String) -> HTMLElement {
		addingAttribute("href", value)
	}

	public func src(_ value: String) -> HTMLElement {
		addingAttribute("src", value)
	}

	public func placeholder(_ value: String) -> HTMLElement {
		addingAttribute("placeholder", value)
	}

	public func value(_ value: String) -> HTMLElement {
		addingAttribute("value", value)
	}

	public func name(_ value: String) -> HTMLElement {
		addingAttribute("name", value)
	}

	public func name(_ value: HTMLMeta.Name) -> HTMLElement {
		addingAttribute("name", value.rawValue)
	}

	public func type(_ value: String) -> HTMLElement {
		addingAttribute("type", value)
	}

	public func rel(_ value: String) -> HTMLElement {
		addingAttribute("rel", value)
	}

	public func rel(_ value: HTMLLink.Relationship) -> HTMLElement {
		addingAttribute("rel", value.rawValue)
	}

	public func sizes(_ value: String) -> HTMLElement {
		addingAttribute("sizes", value)
	}

	public func sizes(_ width: Int, _ height: Int) -> HTMLElement {
		addingAttribute("sizes", "\(width)x\(height)")
	}

	public func media(_ value: String) -> HTMLElement {
		addingAttribute("media", value)
	}

	public func crossorigin(_ value: String) -> HTMLElement {
		addingAttribute("crossorigin", value)
	}

	public func crossorigin(_ value: HTMLLink.CrossOrigin) -> HTMLElement {
		addingAttribute("crossorigin", value.rawValue)
	}

	public func `as`(_ value: HTMLLink.As) -> HTMLElement {
		addingAttribute("as", value.rawValue)
	}

	public func open(_ value: Bool = true) -> HTMLElement {
		value ? addingAttribute("open", "open") : self
	}

	public func charset(_ value: String) -> HTMLElement {
		addingAttribute("charset", value)
	}

	public func charset(_ value: HTMLMeta.CharSet) -> HTMLElement {
		addingAttribute("charset", value.rawValue)
	}

	public func content(_ value: String) -> HTMLElement {
		addingAttribute("content", value)
	}

	public func content(_ builder: () -> HTMLMeta.Name.Viewport.Content) -> HTMLElement {
		addingAttribute("content", builder().render())
	}

	public func content(_ directives: HTMLMeta.Name.Robots...) -> HTMLElement {
		addingAttribute("content", (directives.map { $0.rawValue } as [String]).joinedString(separator: ", "))
	}

	public func content(_ value: HTMLMeta.Property.OpenGraph.`Type`.Content) -> HTMLElement {
		addingAttribute("content", value.rawValue)
	}

	public func content(_ value: Int) -> HTMLElement {
		addingAttribute("content", "\(value)")
	}

	public func content(_ value: HTMLLocale) -> HTMLElement {
		addingAttribute("content", value.value)
	}

	public func content(_ value: HTMLMeta.Name.TwitterCard.Content) -> HTMLElement {
		addingAttribute("content", value.rawValue)
	}

	public func content(_ value: HTMLMeta.Name.MobileWebAppCapable.Content) -> HTMLElement {
		addingAttribute("content", value.rawValue)
	}

	public func httpEquiv(_ value: String) -> HTMLElement {
		addingAttribute("http-equiv", value)
	}

	public func property(_ value: String) -> HTMLElement {
		addingAttribute("property", value)
	}

	public func property(_ value: HTMLMeta.Property.OpenGraph) -> HTMLElement {
		addingAttribute("property", value.rawValue)
	}

	public func lang(_ value: String) -> HTMLElement {
		addingAttribute("lang", value)
	}

	public func lang(_ value: HTMLLang) -> HTMLElement {
		addingAttribute("lang", value.rawValue)
	}

	public func dir(_ value: String) -> HTMLElement {
		addingAttribute("dir", value)
	}

	public func tabindex(_ value: Int) -> HTMLElement {
		addingAttribute("tabindex", "\(value)")
	}

	public func accesskey(_ value: String) -> HTMLElement {
		addingAttribute("accesskey", value)
	}

	public func contenteditable(_ value: Bool = true) -> HTMLElement {
		addingAttribute("contenteditable", value ? "true" : "false")
	}

	public func draggable(_ value: Bool = true) -> HTMLElement {
		addingAttribute("draggable", value ? "true" : "false")
	}

	public func hidden(_ value: Bool = true) -> HTMLElement {
		value ? addingAttribute("hidden", "hidden") : self
	}

	public func spellcheck(_ value: Bool = true) -> HTMLElement {
		addingAttribute("spellcheck", value ? "true" : "false")
	}

	public func translate(_ value: Bool = true) -> HTMLElement {
		addingAttribute("translate", value ? "yes" : "no")
	}

	public func disabled(_ value: Bool = true) -> HTMLElement {
		value ? addingAttribute("disabled", "disabled") : self
	}
}

public func noscript(@HTMLBuilder content: () -> [DOMNode] = { [] }) -> HTMLElement { HTMLElement("noscript", content: content) }
public func section(@HTMLBuilder content: () -> [DOMNode] = { [] }) -> HTMLElement { HTMLElement("section", content: content) }
public func nav(@HTMLBuilder content: () -> [DOMNode] = { [] }) -> HTMLElement { HTMLElement("nav", content: content) }
public func article(@HTMLBuilder content: () -> [DOMNode] = { [] }) -> HTMLElement { HTMLElement("article", content: content) }
public func aside(@HTMLBuilder content: () -> [DOMNode] = { [] }) -> HTMLElement { HTMLElement("aside", content: content) }
public func header(@HTMLBuilder content: () -> [DOMNode] = { [] }) -> HTMLElement { HTMLElement("header", content: content) }
public func footer(@HTMLBuilder content: () -> [DOMNode] = { [] }) -> HTMLElement { HTMLElement("footer", content: content) }
public func main(@HTMLBuilder content: () -> [DOMNode] = { [] }) -> HTMLElement { HTMLElement("main", content: content) }
public func address(@HTMLBuilder content: () -> [DOMNode] = { [] }) -> HTMLElement { HTMLElement("address", content: content) }
public func dt(@HTMLBuilder content: () -> [DOMNode] = { [] }) -> HTMLElement { HTMLElement("dt", content: content) }
public func dd(@HTMLBuilder content: () -> [DOMNode] = { [] }) -> HTMLElement { HTMLElement("dd", content: content) }
public func figure(@HTMLBuilder content: () -> [DOMNode] = { [] }) -> HTMLElement { HTMLElement("figure", content: content) }
public func figcaption(@HTMLBuilder content: () -> [DOMNode] = { [] }) -> HTMLElement { HTMLElement("figcaption", content: content) }
// Phrasing (inline) content — no added whitespace between children
public func em(@HTMLBuilder content: () -> [DOMNode] = { [] }) -> HTMLElement { HTMLElement("em", inline: true, content: content) }
public func strong(@HTMLBuilder content: () -> [DOMNode] = { [] }) -> HTMLElement { HTMLElement("strong", inline: true, content: content) }
public func small(@HTMLBuilder content: () -> [DOMNode] = { [] }) -> HTMLElement { HTMLElement("small", inline: true, content: content) }
public func s(@HTMLBuilder content: () -> [DOMNode] = { [] }) -> HTMLElement { HTMLElement("s", inline: true, content: content) }
public func cite(@HTMLBuilder content: () -> [DOMNode] = { [] }) -> HTMLElement { HTMLElement("cite", inline: true, content: content) }
public func dfn(@HTMLBuilder content: () -> [DOMNode] = { [] }) -> HTMLElement { HTMLElement("dfn", inline: true, content: content) }
public func abbr(@HTMLBuilder content: () -> [DOMNode] = { [] }) -> HTMLElement { HTMLElement("abbr", inline: true, content: content) }
public func ruby(@HTMLBuilder content: () -> [DOMNode] = { [] }) -> HTMLElement { HTMLElement("ruby", inline: true, content: content) }
public func rt(@HTMLBuilder content: () -> [DOMNode] = { [] }) -> HTMLElement { HTMLElement("rt", inline: true, content: content) }
public func rp(@HTMLBuilder content: () -> [DOMNode] = { [] }) -> HTMLElement { HTMLElement("rp", inline: true, content: content) }
public func code(@HTMLBuilder content: () -> [DOMNode] = { [] }) -> HTMLElement { HTMLElement("code", inline: true, content: content) }
public func `var`(@HTMLBuilder content: () -> [DOMNode] = { [] }) -> HTMLElement { HTMLElement("var", inline: true, content: content) }
public func samp(@HTMLBuilder content: () -> [DOMNode] = { [] }) -> HTMLElement { HTMLElement("samp", inline: true, content: content) }
public func kbd(@HTMLBuilder content: () -> [DOMNode] = { [] }) -> HTMLElement { HTMLElement("kbd", inline: true, content: content) }
public func sub(@HTMLBuilder content: () -> [DOMNode] = { [] }) -> HTMLElement { HTMLElement("sub", inline: true, content: content) }
public func sup(@HTMLBuilder content: () -> [DOMNode] = { [] }) -> HTMLElement { HTMLElement("sup", inline: true, content: content) }
public func i(@HTMLBuilder content: () -> [DOMNode] = { [] }) -> HTMLElement { HTMLElement("i", inline: true, content: content) }
public func b(@HTMLBuilder content: () -> [DOMNode] = { [] }) -> HTMLElement { HTMLElement("b", inline: true, content: content) }
public func u(@HTMLBuilder content: () -> [DOMNode] = { [] }) -> HTMLElement { HTMLElement("u", inline: true, content: content) }
public func mark(@HTMLBuilder content: () -> [DOMNode] = { [] }) -> HTMLElement { HTMLElement("mark", inline: true, content: content) }
public func bdi(@HTMLBuilder content: () -> [DOMNode] = { [] }) -> HTMLElement { HTMLElement("bdi", inline: true, content: content) }
public func bdo(@HTMLBuilder content: () -> [DOMNode] = { [] }) -> HTMLElement { HTMLElement("bdo", inline: true, content: content) }
public func wbr() -> HTMLElement { HTMLElement("wbr", selfClosing: true) }
