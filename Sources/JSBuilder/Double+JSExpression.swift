#if !os(WASI)

extension Double {
    public var expr: JSExpression { .number(self) }
}

#endif
