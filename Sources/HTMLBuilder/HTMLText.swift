import EmbeddedSwiftUtilities
import WebTypes
import DOMBuilder

public struct HTMLText: HTMLContent, Sendable {
	let content: String
	let isRaw: Bool

	public init(content: String, isRaw: Bool = false) {
		self.content = content
		self.isRaw = isRaw
	}

	public func render() -> DOMNode {
		.text(content)
	}

    public var nodeType: HTMLNodeType { .textNode }
    public var textContent: String? { content }
}

/// Creates raw HTMLContent content that is rendered without escaping
public func raw(_ content: String) -> HTMLText {
	HTMLText(content: content, isRaw: true)
}
