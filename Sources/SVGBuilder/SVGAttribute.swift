#if WASI

import EmbeddedSwiftUtilities

#endif

import WebTypes

/// A phantom-typed SVG attribute name that links a property to its expected value type.
public struct SVGAttribute<Value>: Sendable {
    public let name: SVGAttributeName

    public init(_ name: SVGAttributeName) {
        self.name = name
    }
}

extension SVGAttribute where Value == [(Double, Double)] {
    public static var points: SVGAttribute<[(Double, Double)]> { .init(.points) }
}

extension SVGAttribute where Value == Percentage {
    public static var x: SVGAttribute<Percentage> { .init(.x) }
    public static var y: SVGAttribute<Percentage> { .init(.y) }
    public static var width: SVGAttribute<Percentage> { .init(.width) }
    public static var height: SVGAttribute<Percentage> { .init(.height) }
}

extension SVGAttribute where Value == Double {
    public static var opacity: SVGAttribute<Double> { .init(.opacity) }
}

extension SVGAttribute where Value == Length {
    public static var x: SVGAttribute<Length> { .init(.x) }
    public static var y: SVGAttribute<Length> { .init(.y) }
    public static var width: SVGAttribute<Length> { .init(.width) }
    public static var height: SVGAttribute<Length> { .init(.height) }
}

extension SVGAttribute where Value == [SVGPath.Definition.Command] {
    public static var d: SVGAttribute<[SVGPath.Definition.Command]> { .init(.d) }
}
