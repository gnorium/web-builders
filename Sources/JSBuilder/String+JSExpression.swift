#if !os(WASI)

extension String {
    public var expr: JSExpression { .string(self) }
}

#endif
