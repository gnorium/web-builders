import DOMBuilder
import WebTypes
import HTMLBuilder

// MARK: - SVG Factory Functions

public func svg(@SVGBuilder _ content: () -> [DOMNode] = { [] }) -> DOMNode {
    .element(ns: .svg, tag: "svg", attributes: [], children: content())
}

public func g(@SVGBuilder _ content: () -> [DOMNode] = { [] }) -> DOMNode {
    .element(ns: .svg, tag: "g", attributes: [], children: content())
}

public func defs(@SVGBuilder _ content: () -> [DOMNode] = { [] }) -> DOMNode {
    .element(ns: .svg, tag: "defs", attributes: [], children: content())
}

public func path() -> DOMNode {
    .element(ns: .svg, tag: "path", attributes: [], children: [])
}

public func rect() -> DOMNode {
    .element(ns: .svg, tag: "rect", attributes: [], children: [])
}

public func circle() -> DOMNode {
    .element(ns: .svg, tag: "circle", attributes: [], children: [])
}

public func clipPath(@SVGBuilder _ content: () -> [DOMNode] = { [] }) -> DOMNode {
    .element(ns: .svg, tag: "clipPath", attributes: [], children: content())
}

public func linearGradient(@SVGBuilder _ content: () -> [DOMNode] = { [] }) -> DOMNode {
    .element(ns: .svg, tag: "linearGradient", attributes: [], children: content())
}

public func stop() -> DOMNode {
    .element(ns: .svg, tag: "stop", attributes: [], children: [], selfClosing: true)
}

public func animate() -> DOMNode {
    .element(ns: .svg, tag: "animate", attributes: [], children: [], selfClosing: true)
}

public func animateTransform() -> DOMNode {
    .element(ns: .svg, tag: "animateTransform", attributes: [], children: [], selfClosing: true)
}

// MARK: - SVG Specific Modifiers

extension DOMNode {
    public func d(_ path: [SVGPath.Definition.Command]) -> DOMNode { addingAttribute("d", (path.map { $0.pathString } as [String]).joinedString(separator: " ")) }
    public func d(_ commands: SVGPath.Definition.Command...) -> DOMNode { addingAttribute("d", (commands.map { $0.pathString } as [String]).joinedString(separator: " ")) }
    public func d(_ value: String) -> DOMNode { addingAttribute("d", value) }
    
    public func x(_ value: String) -> DOMNode { addingAttribute("x", value) }
    public func y(_ value: String) -> DOMNode { addingAttribute("y", value) }
    public func x(_ value: LengthPercentage) -> DOMNode { addingAttribute("x", value.value) }
    public func y(_ value: LengthPercentage) -> DOMNode { addingAttribute("y", value.value) }
    public func x(_ value: Int) -> DOMNode { addingAttribute("x", "\(value)") }
    public func y(_ value: Int) -> DOMNode { addingAttribute("y", "\(value)") }
    
    public func x1(_ value: String) -> DOMNode { addingAttribute("x1", value) }
    public func y1(_ value: String) -> DOMNode { addingAttribute("y1", value) }
    public func x2(_ value: String) -> DOMNode { addingAttribute("x2", value) }
    public func y2(_ value: String) -> DOMNode { addingAttribute("y2", value) }
    public func x1(_ value: LengthPercentage) -> DOMNode { addingAttribute("x1", value.value) }
    public func y1(_ value: LengthPercentage) -> DOMNode { addingAttribute("y1", value.value) }
    public func x2(_ value: LengthPercentage) -> DOMNode { addingAttribute("x2", value.value) }
    public func y2(_ value: LengthPercentage) -> DOMNode { addingAttribute("y2", value.value) }
    
    public func width(_ value: String) -> DOMNode { addingAttribute("width", value) }
    public func height(_ value: String) -> DOMNode { addingAttribute("height", value) }
    public func width(_ value: LengthPercentage) -> DOMNode { addingAttribute("width", value.value) }
    public func height(_ value: LengthPercentage) -> DOMNode { addingAttribute("height", value.value) }
    public func width(_ value: Int) -> DOMNode { addingAttribute("width", "\(value)") }
    public func height(_ value: Int) -> DOMNode { addingAttribute("height", "\(value)") }
    
    public func fill(_ value: String) -> DOMNode { addingAttribute("fill", value) }
    public func fill(_ paint: SVGPaint) -> DOMNode { addingAttribute("fill", paint.value) }
    public func fillRule(_ rule: SVGFillRule) -> DOMNode { addingAttribute("fill-rule", rule.rawValue) }
    public func clipRule(_ rule: SVGFillRule) -> DOMNode { addingAttribute("clip-rule", rule.rawValue) }
    
    public func stroke(_ value: String) -> DOMNode { addingAttribute("stroke", value) }
    public func strokeWidth(_ value: String) -> DOMNode { addingAttribute("stroke-width", value) }
    public func strokeWidth(_ value: Int) -> DOMNode { addingAttribute("stroke-width", "\(value)") }
    public func strokeLinecap(_ cap: SVGStrokeLinecap) -> DOMNode { addingAttribute("stroke-linecap", cap.rawValue) }
    public func strokeMiterlimit(_ limit: Double) -> DOMNode { addingAttribute("stroke-miterlimit", "\(limit)") }
    
    public func transform(_ value: String) -> DOMNode { addingAttribute("transform", value) }
    public func viewBox(_ value: String) -> DOMNode { addingAttribute("viewBox", value) }
    public func viewBox(_ x: Int, _ y: Int, _ w: Int, _ h: Int) -> DOMNode { addingAttribute("viewBox", "\(x) \(y) \(w) \(h)") }
    
    public func xmlns(_ value: String) -> DOMNode { addingAttribute("xmlns", value) }
    public func xmlnsXlink(_ value: String) -> DOMNode { addingAttribute("xmlns:xlink", value) }
    public func xmlSpace(_ value: SVGXMLSpace) -> DOMNode { addingAttribute("xml:space", value.rawValue) }

    public func cx(_ value: String) -> DOMNode { addingAttribute("cx", value) }
    public func cy(_ value: String) -> DOMNode { addingAttribute("cy", value) }
    public func r(_ value: String) -> DOMNode { addingAttribute("r", value) }

    public func offset(_ value: String) -> DOMNode { addingAttribute("offset", value) }
    public func offset(_ value: LengthPercentage) -> DOMNode { addingAttribute("offset", value.value) }
    public func stopColor(_ value: String) -> DOMNode { addingAttribute("stop-color", value) }
    public func stopOpacity(_ value: String) -> DOMNode { addingAttribute("stop-opacity", value) }

    // Animation Modifiers
    public func attributeName(_ name: String) -> DOMNode { addingAttribute("attributeName", name) }
    public func attributeName(_ name: SVGAttributeName) -> DOMNode { addingAttribute("attributeName", name.rawValue) }
    public func dur(_ value: String) -> DOMNode { addingAttribute("dur", value) }
    public func dur(_ time: CSSTime) -> DOMNode { addingAttribute("dur", time.value) }
    public func repeatCount(_ value: String) -> DOMNode { addingAttribute("repeatCount", value) }
    public func repeatCount(_ value: SVGAnimate.RepeatCount) -> DOMNode { addingAttribute("repeatCount", value.value) }
    public func begin(_ value: String) -> DOMNode { addingAttribute("begin", value) }
    public func begin(_ value: SVGAnimate.Begin) -> DOMNode { addingAttribute("begin", value.rawValue) }
    
    public func values(_ list: String...) -> DOMNode { addingAttribute("values", list.joinedString(separator: ";")) }
    public func values(_ list: [String]) -> DOMNode { addingAttribute("values", list.joinedString(separator: ";")) }
    public func values(_ list: [[SVGPath.Definition.Command]]) -> DOMNode { addingAttribute("values", (list.map { ($0.map { $0.pathString } as [String]).joinedString(separator: " ") } as [String]).joinedString(separator: ";")) }
    public func values(_ list: LengthPercentage...) -> DOMNode { addingAttribute("values", (list.map { $0.value } as [String]).joinedString(separator: ";")) }
    
    public func keyTimes(_ times: Double...) -> DOMNode { addingAttribute("keyTimes", times.map { "\($0)" }.joinedString(separator: ";")) }
    public func calcMode(_ mode: SVGAnimate.CalcMode) -> DOMNode { addingAttribute("calcMode", mode.rawValue) }
    public func keySplines(_ splines: (Double, Double, Double, Double)...) -> DOMNode { 
        addingAttribute("keySplines", splines.map { "\($0.0) \($0.1) \($0.2) \($0.3)" }.joinedString(separator: ";"))
    }
    
    public func type(_ transformType: SVGAnimateTransform.`Type`) -> DOMNode { addingAttribute("type", transformType.rawValue) }
    public func from(_ values: Double...) -> DOMNode { addingAttribute("from", values.map { "\($0)" }.joinedString(separator: " ")) }
    public func to(_ values: Double...) -> DOMNode { addingAttribute("to", values.map { "\($0)" }.joinedString(separator: " ")) }
}
