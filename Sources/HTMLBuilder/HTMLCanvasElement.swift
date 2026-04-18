import CSSBuilder
import WebTypes
import DOMBuilder

public struct HTMLCanvasElement: HTMLElementRenderable, Sendable, CustomStringConvertible {
    public let attributes: [(String, String)]

    public init() {
        self.attributes = []
    }

    private init(attributes: [(String, String)]) {
        self.attributes = attributes
    }

        public func toNode() -> DOMNode {
        .element(ns: .html, tag: "canvas", attributes: attributes, children: [])
    }

public func render(indent: Int = 0) -> String {
        let ind = String(repeating: "  ", count: indent)
        let attributeString = renderAttributes()
        return ind + "<canvas\(attributeString)></canvas>"
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

    public func addingAttribute(_ key: String, _ value: String) -> HTMLCanvasElement {
        var newAttributes = attributes
        newAttributes.removeAll { $0.0 == key }
        newAttributes.append((key, value))
        return HTMLCanvasElement(attributes: newAttributes)
    }

}

extension HTMLCanvasElement {
    public func width(_ value: Int) -> HTMLCanvasElement {
        addingAttribute("width", "\(value)")
    }

    public func height(_ value: Int) -> HTMLCanvasElement {
        addingAttribute("height", "\(value)")
    }
}

public func canvas() -> HTMLCanvasElement { HTMLCanvasElement() }
