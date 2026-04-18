import CSSBuilder
import WebTypes
import DOMBuilder

public struct HTMLDivElement: HTMLElementRenderable, Sendable, CustomStringConvertible {
	public let attributes: [(String, String)]
	let children: [DOMNode]

	public init(@HTMLBuilder content: () -> [DOMNode] = { [] }) {
		self.attributes = []
		self.children = content()
	}

	private init(attributes: [(String, String)], children: [DOMNode]) {
		self.attributes = attributes
		self.children = children
	}

    public func toNode() -> DOMNode {
        .element(ns: .html, tag: "div", attributes: attributes, children: children)
    }

	public func render(indent: Int = 0) -> String {
        toNode().render(indent: indent)
	}

	public var description: String {
		render(indent: 0)
	}

	public func callAsFunction(@HTMLBuilder content: () -> [DOMNode]) -> HTMLDivElement {
		HTMLDivElement(attributes: attributes, children: content())
	}

	public func addingAttribute(_ key: String, _ value: String) -> HTMLDivElement {
		var newAttributes = attributes
		newAttributes.removeAll { $0.0 == key }
		newAttributes.append((key, value))
		return HTMLDivElement(attributes: newAttributes, children: children)
	}
}

public func div(@HTMLBuilder content: () -> [DOMNode] = { [] }) -> HTMLDivElement { HTMLDivElement(content: content) }
