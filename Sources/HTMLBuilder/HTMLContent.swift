import WebTypes
import DOMBuilder

public protocol HTMLContent: DOMNodeConvertible {
    var nodeType: HTMLNodeType { get }
    var textContent: String? { get }
}

extension HTMLContent {
    public func render() -> String { render(indent: 0) }
    public var nodeType: HTMLNodeType { .elementNode }
    public var textContent: String? { nil }
}

public func resolveNodeType(of content: some HTMLContent) -> HTMLNodeType { content.nodeType }
public func resolveTextContent(of content: some HTMLContent) -> String? { content.textContent }
