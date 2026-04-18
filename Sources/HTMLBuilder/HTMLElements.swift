import DOMBuilder
import WebTypes

// MARK: - HTML Factory Functions

public func div(@HTMLBuilder _ content: () -> [DOMNode] = { [] }) -> DOMNode {
    .element(ns: .html, tag: "div", attributes: [], children: content())
}

public func span(@HTMLBuilder _ content: () -> [DOMNode] = { [] }) -> DOMNode {
    .element(ns: .html, tag: "span", attributes: [], children: content(), inline: true)
}

public func p(@HTMLBuilder _ content: () -> [DOMNode] = { [] }) -> DOMNode {
    .element(ns: .html, tag: "p", attributes: [], children: content())
}

public func section(@HTMLBuilder _ content: () -> [DOMNode] = { [] }) -> DOMNode {
    .element(ns: .html, tag: "section", attributes: [], children: content())
}

public func header(@HTMLBuilder _ content: () -> [DOMNode] = { [] }) -> DOMNode {
    .element(ns: .html, tag: "header", attributes: [], children: content())
}

public func footer(@HTMLBuilder _ content: () -> [DOMNode] = { [] }) -> DOMNode {
    .element(ns: .html, tag: "footer", attributes: [], children: content())
}

public func main(@HTMLBuilder _ content: () -> [DOMNode] = { [] }) -> DOMNode {
    .element(ns: .html, tag: "main", attributes: [], children: content())
}

public func nav(@HTMLBuilder _ content: () -> [DOMNode] = { [] }) -> DOMNode {
    .element(ns: .html, tag: "nav", attributes: [], children: content())
}

public func article(@HTMLBuilder _ content: () -> [DOMNode] = { [] }) -> DOMNode {
    .element(ns: .html, tag: "article", attributes: [], children: content())
}

public func aside(@HTMLBuilder _ content: () -> [DOMNode] = { [] }) -> DOMNode {
    .element(ns: .html, tag: "aside", attributes: [], children: content())
}

public func h1(@HTMLBuilder _ content: () -> [DOMNode] = { [] }) -> DOMNode {
    .element(ns: .html, tag: "h1", attributes: [], children: content())
}

public func h2(@HTMLBuilder _ content: () -> [DOMNode] = { [] }) -> DOMNode {
    .element(ns: .html, tag: "h2", attributes: [], children: content())
}

public func h3(@HTMLBuilder _ content: () -> [DOMNode] = { [] }) -> DOMNode {
    .element(ns: .html, tag: "h3", attributes: [], children: content())
}

public func a(@HTMLBuilder _ content: () -> [DOMNode] = { [] }) -> DOMNode {
    .element(ns: .html, tag: "a", attributes: [], children: content(), inline: true)
}

public func img() -> DOMNode {
    .element(ns: .html, tag: "img", attributes: [], children: [], selfClosing: true)
}

public func br() -> DOMNode {
    .element(ns: .html, tag: "br", attributes: [], children: [], selfClosing: true)
}

// MARK: - HTML Specific Modifiers

extension DOMNode {
    public func href(_ value: String) -> DOMNode { addingAttribute("href", value) }
    public func src(_ value: String) -> DOMNode { addingAttribute("src", value) }
    public func alt(_ value: String) -> DOMNode { addingAttribute("alt", value) }
    public func target(_ value: String) -> DOMNode { addingAttribute("target", value) }
    public func rel(_ value: String) -> DOMNode { addingAttribute("rel", value) }
}
