import CSSBuilder
import EmbeddedSwiftUtilities
import HTMLBuilder
import WebTypes
import DOMBuilder

public struct SVGAnimateElement: SVGElementRenderable, Sendable {
    public let attributes: [(String, String)]

    public init() {
        self.attributes = []
    }

    private init(attributes: [(String, String)]) {
        self.attributes = attributes
    }

        public func toNode() -> DOMNode {
        .element(ns: .svg, tag: "animate", attributes: attributes, children: [])
    }

public func render(indent: Int = 0) -> String {
        let ind = String(repeating: "  ", count: indent)
        let attributeString = renderAttributes()
        return ind + "<animate\(attributeString) />"
    }

    private func renderAttributes() -> String {
        guard !attributes.isEmpty else { return "" }
        return " " + attributes
            .map { "\($0.0)=\"\(escapeHTMLAttributeValue($0.1))\"" }
            .joinedString(separator: " ")
    }

    public func addingAttribute(_ key: String, _ value: String) -> SVGAnimateElement {
        var newAttributes = attributes
        newAttributes.removeAll { $0.0 == key }
        newAttributes.append((key, value))
        return SVGAnimateElement(attributes: newAttributes)
    }
}

extension SVGAnimateElement {
    public func attributeName(_ value: String) -> SVGAnimateElement { addingAttribute("attributeName", value) }
    public func attributeName(_ name: SVGAttributeName) -> SVGAnimateElement { addingAttribute("attributeName", name.rawValue) }
    
    public func from(_ value: String) -> SVGAnimateElement { addingAttribute("from", value) }
    public func from(_ value: Double) -> SVGAnimateElement { addingAttribute("from", doubleToString(value)) }
    public func from(_ value: Length) -> SVGAnimateElement { addingAttribute("from", value.value) }
    public func from(_ value: Percentage) -> SVGAnimateElement { addingAttribute("from", value.value) }
    
    public func to(_ value: String) -> SVGAnimateElement { addingAttribute("to", value) }
    public func to(_ value: Double) -> SVGAnimateElement { addingAttribute("to", doubleToString(value)) }
    public func to(_ value: Length) -> SVGAnimateElement { addingAttribute("to", value.value) }
    public func to(_ value: Percentage) -> SVGAnimateElement { addingAttribute("to", value.value) }

    public func values(_ values: String...) -> SVGAnimateElement { addingAttribute("values", stringJoin(values, separator: ";")) }
    public func values(_ values: [String]) -> SVGAnimateElement { addingAttribute("values", stringJoin(values, separator: ";")) }
    public func values(_ values: Double...) -> SVGAnimateElement { addingAttribute("values", stringJoin(values.map { doubleToString($0) }, separator: ";")) }
    public func values(_ values: Length...) -> SVGAnimateElement { addingAttribute("values", stringJoin(values.map { $0.value }, separator: ";")) }
    public func values(_ values: Percentage...) -> SVGAnimateElement { addingAttribute("values", stringJoin(values.map { $0.value }, separator: ";")) }
    public func values(_ values: [SVGPath.Definition.Command]...) -> SVGAnimateElement {
        let strings = values.map { cmds in
            stringJoin(cmds.map { $0.pathString }, separator: " ")
        }
        return addingAttribute("values", stringJoin(strings, separator: ";"))
    }

    public func keyTimes(_ times: Double...) -> SVGAnimateElement { addingAttribute("keyTimes", stringJoin(times.map { doubleToString($0) }, separator: ";")) }
    public func keyTimes(_ times: Int...) -> SVGAnimateElement { addingAttribute("keyTimes", stringJoin(times.map { intToString($0) }, separator: ";")) }

    public func calcMode(_ mode: SVGAnimate.CalcMode) -> SVGAnimateElement { addingAttribute("calcMode", mode.rawValue) }
    
    public func keySplines(_ splines: (Double, Double, Double, Double)...) -> SVGAnimateElement {
        let strings = splines.map { s in
            stringConcat(doubleToString(s.0), " ", doubleToString(s.1), " ", doubleToString(s.2), " ", doubleToString(s.3))
        }
        return addingAttribute("keySplines", stringJoin(strings, separator: ";"))
    }
    
    public func dur(_ value: String) -> SVGAnimateElement { addingAttribute("dur", value) }
    public func dur(_ value: CSSTime) -> SVGAnimateElement { addingAttribute("dur", value.value) }
    
    public func repeatCount(_ value: String) -> SVGAnimateElement { addingAttribute("repeatCount", value) }
    public func repeatCount(_ count: SVGAnimate.RepeatCount) -> SVGAnimateElement { addingAttribute("repeatCount", count.value) }
    
    public func fill(_ value: String) -> SVGAnimateElement { addingAttribute("fill", value) }
    public func fill(_ fill: SVGAnimate.Fill) -> SVGAnimateElement { addingAttribute("fill", fill.rawValue) }
    
    public func begin(_ value: String) -> SVGAnimateElement { addingAttribute("begin", value) }
    public func begin(_ begin: SVGAnimate.Begin) -> SVGAnimateElement { addingAttribute("begin", begin.rawValue) }

    public func attributeType(_ value: String) -> SVGAnimateElement { addingAttribute("attributeType", value) }
    public func attributeType(_ type: SVGAnimate.AttributeType) -> SVGAnimateElement { addingAttribute("attributeType", type.rawValue) }
}

public func animate() -> SVGAnimateElement { SVGAnimateElement() }
