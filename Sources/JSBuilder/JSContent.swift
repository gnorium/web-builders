#if CLIENT

import EmbeddedSwiftUtilities

#endif

public protocol JSContent: Sendable {
    /// Returns the structured JSStatement representation of the content.
    func render() -> JSStatement
    
    /// Returns the serialized string representation of the content.
    func serialize(indent: Int) -> String
}

extension JSContent {
	public func serialize() -> String { serialize(indent: 0) }
}

extension [JSStatement]: JSContent {
    public func render() -> JSStatement {
        .block(self)
    }

	public func serialize(indent: Int = 0) -> String {
		var result = ""
        for (index, item) in self.enumerated() {
            result += item.serialize(indent: indent)
            if index < self.count - 1 {
                result += "\n"
            }
        }
        return result
	}
}
