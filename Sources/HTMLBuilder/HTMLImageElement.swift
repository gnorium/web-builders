import CSSBuilder
import EmbeddedSwiftUtilities
import WebTypes
import DOMBuilder

public struct HTMLImageElement: HTMLElementRenderable, Sendable, CustomStringConvertible {
    public let attributes: [(String, String)]

    public init() {
        self.attributes = []
    }

    private init(attributes: [(String, String)]) {
        self.attributes = attributes
    }

    public func render() -> DOMNode {
        .element(ns: .html, tag: "img", attributes: attributes, children: [])
    }

    public var description: String {
        serialize(indent: 0)
    }

    public func addingAttribute(_ key: String, _ value: String) -> HTMLImageElement {
        var newAttributes = attributes
        newAttributes.removeAll { $0.0 == key }
        newAttributes.append((key, value))
        return HTMLImageElement(attributes: newAttributes)
    }

}

extension HTMLImageElement {
    public func src(_ value: String) -> HTMLImageElement {
        addingAttribute("src", value)
    }

    public func alt(_ value: String) -> HTMLImageElement {
        addingAttribute("alt", value)
    }

    public func width(_ value: Int) -> HTMLImageElement {
        addingAttribute("width", intToString(value))
    }

    public func width(_ value: Length) -> HTMLImageElement {
        addingAttribute("width", value.value)
    }

    public func height(_ value: Int) -> HTMLImageElement {
        addingAttribute("height", intToString(value))
    }

    public func height(_ value: Length) -> HTMLImageElement {
        addingAttribute("height", value.value)
    }

    public func loading(_ value: String) -> HTMLImageElement {
        addingAttribute("loading", value)
    }

    public func loading(_ value: HTMLLoading) -> HTMLImageElement {
        addingAttribute("loading", value.rawValue)
    }

    public func crossorigin(_ value: String) -> HTMLImageElement {
        addingAttribute("crossorigin", value)
    }

    public func crossorigin(_ value: HTMLLink.CrossOrigin) -> HTMLImageElement {
        addingAttribute("crossorigin", value.rawValue)
    }
}

public func img() -> HTMLImageElement { HTMLImageElement() }
public func img(src: String, alt: String = "") -> HTMLImageElement { HTMLImageElement().src(src).alt(alt) }
