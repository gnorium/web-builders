#if !os(WASI)

extension JSExpression {
    // Property setters for common JavaScript properties
    public var innerHTML: JSPropertySetter {
        JSPropertySetter(property: .member(self, "innerHTML"))
    }

    public var value: JSPropertySetter {
        JSPropertySetter(property: .member(self, "value"))
    }

    public var checked: JSPropertySetter {
        JSPropertySetter(property: .member(self, "checked"))
    }

    public var href: JSPropertySetter {
        JSPropertySetter(property: .member(self, "href"))
    }
}

#endif
