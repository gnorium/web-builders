#if !os(WASI)

extension Bool {
    public var expr: JSExpression { .bool(self) }
}

#endif
