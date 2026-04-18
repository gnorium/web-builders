public protocol JSContent: Sendable {
	func render(indent: Int) -> String
}

extension JSContent {
	public func render() -> String { render(indent: 0) }
}

extension [AnyJSContent]: JSContent {
	public func render(indent: Int = 0) -> String {
		var result = ""
        for (index, item) in self.enumerated() {
            result += item.render(indent: indent)
            if index < self.count - 1 {
                result += "\n"
            }
        }
        return result
	}
}
