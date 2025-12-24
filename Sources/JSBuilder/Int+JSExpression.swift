#if !os(WASI)

extension Int {
    public var expr: JSExpression { .number(Double(self)) }
}

#endif
