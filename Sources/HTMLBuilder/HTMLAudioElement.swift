import CSSBuilder
import WebTypes
import DOMBuilder

public struct HTMLAudioElement: HTMLElementRenderable, Sendable, CustomStringConvertible {
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
        .element(ns: .html, tag: "audio", attributes: attributes, children: children)
    }

public func render(indent: Int = 0) -> String {
        let ind = String(repeating: "  ", count: indent)
        let attributeString = renderAttributes()
        let openElement = "<audio\(attributeString)>"
        let closeElement = "</audio>"

        guard !children.isEmpty else {
            return ind + openElement + closeElement
        }

        var inner = ""
        var actualChildrenCount = 0
        for child in children {
            let rendered = child.render(indent: indent + 1)
            if !rendered.isEmpty {
                if actualChildrenCount > 0 { inner += "\n" }
                inner += rendered
                actualChildrenCount += 1
            }
        }

        return "\(ind)\(openElement)\n\(inner)\n\(ind)\(closeElement)"
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

    public func callAsFunction(@HTMLBuilder content: () -> [DOMNode]) -> HTMLAudioElement {
        HTMLAudioElement(attributes: attributes, children: content())
    }

    public func addingAttribute(_ key: String, _ value: String) -> HTMLAudioElement {
        var newAttributes = attributes
        newAttributes.removeAll { $0.0 == key }
        newAttributes.append((key, value))
        return HTMLAudioElement(attributes: newAttributes, children: children)
    }

}

extension HTMLAudioElement {
    public func src(_ value: String) -> HTMLAudioElement {
        addingAttribute("src", value)
    }

    public func autoplay(_ value: Bool = true) -> HTMLAudioElement {
        value ? addingAttribute("autoplay", "autoplay") : self
    }

    public func controls(_ value: Bool = true) -> HTMLAudioElement {
        value ? addingAttribute("controls", "controls") : self
    }

    public func loop(_ value: Bool = true) -> HTMLAudioElement {
        value ? addingAttribute("loop", "loop") : self
    }

    public func muted(_ value: Bool = true) -> HTMLAudioElement {
        value ? addingAttribute("muted", "muted") : self
    }

    public func crossorigin(_ value: String) -> HTMLAudioElement {
        addingAttribute("crossorigin", value)
    }

    public func crossorigin(_ value: HTMLLink.CrossOrigin) -> HTMLAudioElement {
        addingAttribute("crossorigin", value.rawValue)
    }
}

public func audio(@HTMLBuilder content: () -> [DOMNode] = { [] }) -> HTMLAudioElement { HTMLAudioElement(content: content) }
public func audio(src: String) -> HTMLAudioElement { HTMLAudioElement().src(src) }
