#if !os(WASI)


/// Builder for fluent promise chains
public struct JSPromiseChain {
	let promise: JSExpression
	var chain: [(String, [JSExpression])] = []

	public init(_ promise: JSExpression) {
		self.promise = promise
	}

	public func then(_ handler: JSExpression) -> JSPromiseChain {
		var newChain = self
		newChain.chain.append(("then", [handler]))
		return newChain
	}

	public func `catch`(_ handler: JSExpression) -> JSPromiseChain {
		var newChain = self
		newChain.chain.append(("catch", [handler]))
		return newChain
	}

	public func finally(_ handler: JSExpression) -> JSPromiseChain {
		var newChain = self
		newChain.chain.append(("finally", [handler]))
		return newChain
	}

	public var expression: JSExpression {
		.methodCallMultiline(promise, chain)
	}
}

extension JSPromiseChain: JSValueProtocol {}

/// Start a promise chain
public func promise(_ expr: any JSValueProtocol) -> JSPromiseChain {
	JSPromiseChain(expr.expression)
}

#endif
