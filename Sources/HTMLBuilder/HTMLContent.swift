import WebTypes
import DOMBuilder

public protocol HTMLContent: DOMNodeConvertible {
    var nodeType: HTMLNodeType { get }
    var textContent: String? { get }
}

extension HTMLContent {
    public func serialize(indent: Int = 0) -> String {
        self.render().serialize(indent: indent)
    }
    public var nodeType: HTMLNodeType { .elementNode }
    public var textContent: String? { nil }
}

public func resolveNodeType(of content: some HTMLContent) -> HTMLNodeType { content.nodeType }
public func resolveTextContent(of content: some HTMLContent) -> String? { content.textContent }

extension DOMNode: HTMLContent {}
