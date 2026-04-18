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

	public func toNode() -> DOMNode {
		.text(content)
	}

	public func render(indent: Int = 0) -> String {
		// If it's raw HTML (like from a markdown renderer), we don't want to indent it
		// because it might contain <pre> tags where whitespace is significant.
		if isRaw {
			return content
		}

		let lines = stringSplit(content, separator: "\n")
		let indentString = String(repeating: "  ", count: indent)
		
        var result = ""
        for (index, line) in lines.enumerated() {
            if !line.isEmpty {
                result += indentString + line
            }
            if index < lines.count - 1 {
                result += "\n"
            }
        }
        return result
	}

    public var nodeType: HTMLNodeType { .textNode }
    public var textContent: String? { content }
}

/// Creates raw HTMLContent content that is rendered without escaping
public func raw(_ content: String) -> HTMLText {
	HTMLText(content: content, isRaw: true)
}
