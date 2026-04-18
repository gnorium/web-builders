import CSSBuilder
import WebTypes
import DOMBuilder

public struct HTMLIFrameElement: HTMLElementRenderable, Sendable, CustomStringConvertible {
    public let attributes: [(String, String)]

    public init() {
        self.attributes = []
    }

    private init(attributes: [(String, String)]) {
        self.attributes = attributes
    }

        public func toNode() -> DOMNode {
        .element(ns: .html, tag: "iframe", attributes: attributes, children: [])
    }

public func render(indent: Int = 0) -> String {
        let ind = String(repeating: "  ", count: indent)
        let attributeString = renderAttributes()
        return ind + "<iframe\(attributeString)></iframe>"
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

    public func addingAttribute(_ key: String, _ value: String) -> HTMLIFrameElement {
        var newAttributes = attributes
        newAttributes.removeAll { $0.0 == key }
        newAttributes.append((key, value))
        return HTMLIFrameElement(attributes: newAttributes)
    }

}

extension HTMLIFrameElement {
    public func src(_ value: String) -> HTMLIFrameElement {
        addingAttribute("src", value)
    }

    public func name(_ value: String) -> HTMLIFrameElement {
        addingAttribute("name", value)
    }
    
    public func width(_ value: Int) -> HTMLIFrameElement {
        addingAttribute("width", "\(value)")
    }
    
    public func height(_ value: Int) -> HTMLIFrameElement {
        addingAttribute("height", "\(value)")
    }
    
    public func loading(_ value: String) -> HTMLIFrameElement {
        addingAttribute("loading", value)
    }
    
    public func allow(_ value: String) -> HTMLIFrameElement {
        addingAttribute("allow", value)
    }
    
    public func frameborder(_ value: Int) -> HTMLIFrameElement {
        addingAttribute("frameborder", "\(value)")
    }
}

public func iframe() -> HTMLIFrameElement { HTMLIFrameElement() }
