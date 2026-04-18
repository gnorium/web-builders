import CSSBuilder
import EmbeddedSwiftUtilities
import WebTypes
import DOMBuilder

public struct HTMLMetaElement: HTMLElementRenderable, Sendable, CustomStringConvertible {
    public let attributes: [(String, String)]

    public init() {
        self.attributes = []
    }

    private init(attributes: [(String, String)]) {
        self.attributes = attributes
    }

        public func toNode() -> DOMNode {
        .element(ns: .html, tag: "meta", attributes: attributes, children: [])
    }

public func render(indent: Int = 0) -> String {
        let ind = String(repeating: "  ", count: indent)
        let attributeString = renderAttributes()
        return ind + "<meta\(attributeString) />"
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

    public func addingAttribute(_ key: String, _ value: String) -> HTMLMetaElement {
        var newAttributes = attributes
        newAttributes.removeAll { $0.0 == key }
        newAttributes.append((key, value))
        return HTMLMetaElement(attributes: newAttributes)
    }

}

extension HTMLMetaElement {
    public func name(_ value: String) -> HTMLMetaElement {
        addingAttribute("name", value)
    }

    public func name(_ value: HTMLMeta.Name) -> HTMLMetaElement {
        addingAttribute("name", value.rawValue)
    }

    public func content(_ value: String) -> HTMLMetaElement {
        addingAttribute("content", value)
    }

    public func content(_ value: Int) -> HTMLMetaElement {
        addingAttribute("content", intToString(value))
    }

    public func content(_ value: HTMLLocale) -> HTMLMetaElement {
        addingAttribute("content", value.value)
    }

    public func content(_ value: HTMLMeta.Name.TwitterCard.Content) -> HTMLMetaElement {
        addingAttribute("content", value.rawValue)
    }

    public func content(_ value: HTMLMeta.Name.Viewport.Content) -> HTMLMetaElement {
        addingAttribute("content", value.render())
    }

    public func content(_ content: () -> HTMLMeta.Name.Viewport.Content) -> HTMLMetaElement {
        addingAttribute("content", content().render())
    }

    public func content(_ value: HTMLMeta.Property.OpenGraph.`Type`.Content) -> HTMLMetaElement {
        addingAttribute("content", value.rawValue)
    }

    public func content(_ values: HTMLMeta.Name.Robots...) -> HTMLMetaElement {
        let directiveString = HTMLMeta.Name.Robots.content(values)
        return addingAttribute("content", directiveString)
    }

    public func content(_ value: CSSColor) -> HTMLMetaElement {
        addingAttribute("content", value.value)
    }

    public func property(_ value: String) -> HTMLMetaElement {
        addingAttribute("property", value)
    }

    public func property(_ value: HTMLMeta.Property.OpenGraph) -> HTMLMetaElement {
        addingAttribute("property", value.rawValue)
    }

    public func httpEquiv(_ value: String) -> HTMLMetaElement {
        addingAttribute("http-equiv", value)
    }

    public func charset(_ value: String) -> HTMLMetaElement {
        addingAttribute("charset", value)
    }

    public func charset(_ value: HTMLMeta.CharSet) -> HTMLMetaElement {
        addingAttribute("charset", value.rawValue)
    }
}

public func meta() -> HTMLMetaElement { HTMLMetaElement() }
