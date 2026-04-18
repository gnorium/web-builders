import CSSBuilder
import WebTypes
import DOMBuilder

public struct HTMLBaseElement: HTMLElementRenderable, Sendable, CustomStringConvertible {
    public let attributes: [(String, String)]

    public init() {
        self.attributes = []
    }

    private init(attributes: [(String, String)]) {
        self.attributes = attributes
    }

        public func toNode() -> DOMNode {
        .element(ns: .html, tag: "base", attributes: attributes, children: [])
    }

public func render(indent: Int = 0) -> String {
        let ind = String(repeating: "  ", count: indent)
        let attributeString = renderAttributes()
        return ind + "<base\(attributeString)>"
    }

    private func renderAttributes() -> String {
        guard !attributes.isEmpty else { return "" }
        return " " + attributes
            .map { "\($0.0)=\"\(escapeHTMLAttributeValue($0.1))\"" }
            .joinedString(separator: " ")
    }

    public var description: String {
        render(indent: 0)
    }

    public func addingAttribute(_ key: String, _ value: String) -> HTMLBaseElement {
        var newAttributes = attributes
        newAttributes.removeAll { $0.0 == key }
        newAttributes.append((key, value))
        return HTMLBaseElement(attributes: newAttributes)
    }
}

extension HTMLBaseElement {
    public func href(_ value: String) -> HTMLBaseElement {
        addingAttribute("href", value)
    }

    public func target(_ value: String) -> HTMLBaseElement {
        addingAttribute("target", value)
    }
    
    public func target(_ value: HTMLTarget) -> HTMLBaseElement {
        addingAttribute("target", value.rawValue)
    }
}

public func base() -> HTMLBaseElement { HTMLBaseElement() }
