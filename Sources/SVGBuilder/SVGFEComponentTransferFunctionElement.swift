import CSSBuilder
import EmbeddedSwiftUtilities
import HTMLBuilder
import WebTypes
import DOMBuilder

/// Shared attributes for component transfer functions (feFuncR, feFuncG, feFuncB, feFuncA).
/// Corresponds to the W3C SVGFEComponentTransferFunctionElement interface.
/// https://www.w3.org/TR/filter-effects-1/#InterfaceSVGFEComponentTransferFunctionElement
public protocol SVGFEComponentTransferFunctionElement: SVGElementRenderable {
    func type(_ value: String) -> Self
    func tableValues(_ value: String) -> Self
    func slope(_ value: Double) -> Self
    func intercept(_ value: Double) -> Self
    func amplitude(_ value: Double) -> Self
    func exponent(_ value: Double) -> Self
    func offset(_ value: Double) -> Self
}

extension SVGFEComponentTransferFunctionElement {
    public func type(_ value: String) -> Self { addingAttribute("type", value) }
    public func tableValues(_ value: String) -> Self { addingAttribute("tableValues", value) }
    public func slope(_ value: Double) -> Self { addingAttribute("slope", doubleToString(value)) }
    public func intercept(_ value: Double) -> Self { addingAttribute("intercept", doubleToString(value)) }
    public func amplitude(_ value: Double) -> Self { addingAttribute("amplitude", doubleToString(value)) }
    public func exponent(_ value: Double) -> Self { addingAttribute("exponent", doubleToString(value)) }
    public func offset(_ value: Double) -> Self { addingAttribute("offset", doubleToString(value)) }
}

public struct SVGFEFuncRElement: SVGFEComponentTransferFunctionElement, Sendable {
    public let attributes: [(String, String)]
    public init() { self.attributes = [] }
    private init(attributes: [(String, String)]) { self.attributes = attributes }
    public func render() -> DOMNode {
        .element(ns: .svg, tag: "feFuncR", attributes: attributes, children: [])
    }

    public func addingAttribute(_ key: String, _ value: String) -> SVGFEFuncRElement {
        var newAttributes = attributes
        newAttributes.removeAll { $0.0 == key }; newAttributes.append((key, value))
        return SVGFEFuncRElement(attributes: newAttributes)
    }
}

public struct SVGFEFuncGElement: SVGFEComponentTransferFunctionElement, Sendable {
    public let attributes: [(String, String)]
    public init() { self.attributes = [] }
    private init(attributes: [(String, String)]) { self.attributes = attributes }
    public func render() -> DOMNode {
        .element(ns: .svg, tag: "feFuncG", attributes: attributes, children: [])
    }

    public func addingAttribute(_ key: String, _ value: String) -> SVGFEFuncGElement {
        var newAttributes = attributes
        newAttributes.removeAll { $0.0 == key }; newAttributes.append((key, value))
        return SVGFEFuncGElement(attributes: newAttributes)
    }
}

public struct SVGFEFuncBElement: SVGFEComponentTransferFunctionElement, Sendable {
    public let attributes: [(String, String)]
    public init() { self.attributes = [] }
    private init(attributes: [(String, String)]) { self.attributes = attributes }
    public func render() -> DOMNode {
        .element(ns: .svg, tag: "feFuncB", attributes: attributes, children: [])
    }

    public func addingAttribute(_ key: String, _ value: String) -> SVGFEFuncBElement {
        var newAttributes = attributes
        newAttributes.removeAll { $0.0 == key }; newAttributes.append((key, value))
        return SVGFEFuncBElement(attributes: newAttributes)
    }
}

public struct SVGFEFuncAElement: SVGFEComponentTransferFunctionElement, Sendable {
    public let attributes: [(String, String)]
    public init() { self.attributes = [] }
    private init(attributes: [(String, String)]) { self.attributes = attributes }
    public func render() -> DOMNode {
        .element(ns: .svg, tag: "feFuncA", attributes: attributes, children: [])
    }
    
    public func addingAttribute(_ key: String, _ value: String) -> SVGFEFuncAElement {
        var newAttributes = attributes
        newAttributes.removeAll { $0.0 == key }; newAttributes.append((key, value))
        return SVGFEFuncAElement(attributes: newAttributes)
    }
}

public func feFuncR() -> SVGFEFuncRElement { SVGFEFuncRElement() }
public func feFuncG() -> SVGFEFuncGElement { SVGFEFuncGElement() }
public func feFuncB() -> SVGFEFuncBElement { SVGFEFuncBElement() }
public func feFuncA() -> SVGFEFuncAElement { SVGFEFuncAElement() }
